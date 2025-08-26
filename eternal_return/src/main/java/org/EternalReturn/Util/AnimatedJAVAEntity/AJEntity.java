package org.EternalReturn.Util.AnimatedJAVAEntity;

import org.EternalReturn.System.PluginInstance;
import org.bukkit.Bukkit;
import org.bukkit.Location;
import org.bukkit.World;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Entity;
import org.bukkit.entity.EntityType;
import org.bukkit.entity.Marker;
import org.bukkit.plugin.Plugin;
import org.bukkit.scheduler.BukkitScheduler;
import org.jetbrains.annotations.NotNull;

import java.util.HashMap;
import java.util.Objects;
import java.util.Vector;

public class AJEntity {

    public enum ANIMATION_STATE{
        PLAY,
        PAUSE,
        STOP
    };

    private Entity rootEntity;

    private String name;

    private HashMap<String, String> animationMap;

    /**
     * 현재 실행 중인 애니메이션의 상태 <br>
     * ANIMATION_STATE.PLAY, ANIMATION_STATE.PAUSE, ANIMATION_STATE.STOP
     * */
    private ANIMATION_STATE animationState;

    /**
     * 현재 실행 중인 애니메이션의 이름<br>
     * registerAnimation(String,String) 메소드를 통해 등록해야 함.
     * */
    private String animationPlaying;

    public AJEntity(String name) {
        this.name = name;
        this.animationMap = new HashMap<>();
    }

    /**
     * 해당 World, Location에 엔티티(Marker)를 임시로 소환, 그 엔티티를 기준으로<br>
     * AJEntity를 소환한다. 해당 마커는 1틱 뒤에 제거된다.<br>
     * @ATTENTION :  해당 객체가 GC에 의해 소멸될 경우, 해당 엔티티 묶음은 그대로 월드에 남아 있을 수 있음.
     * */
    public void summon(Plugin plugin, World world, Location loc){
        Entity summoner = world.spawnEntity(loc, EntityType.MARKER);

        this.summon(summoner);

        //Bukkit.getScheduler().runTaskLater(plugin, ()->{
        //    summoner.remove();
        //},1);
        //vvvv해당 표현식은 위의 표현식과 같음vvvv
        //1틱 뒤에 해당 엔티티를 제거함.
        Bukkit.getScheduler().runTaskLater(plugin, summoner::remove,1);
    }

    /**
     * 매개변수로 전달된 엔티티를 기준으로<br>
     * AJEntity를 소환한다. 해당 마커는 제거되지 않는다.<br>
     * @ATTENTION :  해당 객체가 GC에 의해 소멸될 경우, 해당 엔티티 묶음은 그대로 월드에 남아 있을 수 있음.
     * */
    public void summon(Entity summoner){
        summoner.getScoreboardTags().add("AJEntitySummoner");
        String command = "execute as @e[tag=AJEntitySummoner] at @s run function animated_java:" + this.name + "/summon {args:0}";
        Bukkit.dispatchCommand(Bukkit.getConsoleSender(), command);
    }

    /**
     * 현재 AJEntity를 제거한다.
     * */
    public void destroy(){
        Bukkit.dispatchCommand(
                Objects.requireNonNull(rootEntity),
                "function animated_java:" + this.name + "/remove/this");
    }

    /**
     * 애니메이션을 등록하는 메소드.<br>
     * HashMap<>에 다음과 같이 등록된다
     * <code>
     *     .put(animationState,"animated_java:"+this.name+"/animations/"+animationState);
     * <code/>
     * */
    public void registerAnimation(String animationState){
        animationMap.put(animationState,"animated_java:"+this.name+"/animations/"+animationState);
    }

    /**
     * 애니에이션을 실행하는 메소드
     * @throws : AJAnimationNotFoundException
     * */
    private void playAnim(String selectedAnimation)throws AJAnimationNotFoundException{
        String animation = this.animationMap.get(selectedAnimation);
        if(animation == null){
            throw new AJAnimationNotFoundException(
                    "AJAnimation is not found : \"" + selectedAnimation + "\"\n"
                    +"Soultion : Check the animated_java project name and your JAVA code");
        }

        this.animationPlaying = animation;
        this.animationState = ANIMATION_STATE.PLAY;
        Bukkit.dispatchCommand(
                Objects.requireNonNull(rootEntity),
                "function " + animation + "/play");

    }

    /**
     * 실행 중인 해당 애니메이션을 일시 정지한다.
     * getAnimationState()메소드로 얻을 수 있는 값은 ANIMATION_PAUSE의 값이 된다.
     * */
    public void pauseAnim(){

        this.animationState = ANIMATION_STATE.PAUSE;
        Bukkit.dispatchCommand(rootEntity,"function " + animationPlaying + "/pause");
    }

    /**
     * 실행 중인 해당 애니메이션을 완전히 끈다.<br>
     * getAnimationPlaying()메소드로 얻을 수 있는 값은 null이 되며,<br>
     * getAnimationState()메소드로 얻을 수 있는 값은 ANIMATION_STOP의 값이 된다.
     * */
    public void stopAnim(){
        this.animationPlaying = null;
        this.animationState = ANIMATION_STATE.STOP;
        Bukkit.dispatchCommand(rootEntity,"function " + animationPlaying + "/stop");
    }

    //getter

    /**
     * 현재 실행 중인 애니메이션의 상태를 얻어온다.
     * */
    public ANIMATION_STATE getAnimationState(){
        return this.animationState;
    }

    /**
     * 현재 실행 중인 애니메이션의 이름(name)을 얻어온다.
     * */
    public String getAnimationPlaying(){
        return this.animationPlaying;
    }

    /**
     * 현재 AJEntity의 이름을 얻어온다.
     * */
    public String getName(){
        return this.name;
    }

    /**
     * 현재 AJEntity의 rootEntity를 얻어온다.
     * */
    public Entity getRootEntity(){
        return this.rootEntity;
    }

}
