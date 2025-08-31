package org.EternalReturn.Util.AnimatedJAVAEntity;

import org.EternalReturn.System.PluginInstance;
import org.bukkit.Bukkit;
import org.bukkit.Location;
import org.bukkit.World;
import org.bukkit.entity.Entity;
import java.util.HashMap;



/**
 *
 * */
public abstract class AJEntity {

    private World world;

    public enum ANIMATION_STATE{
        PLAY,
        PAUSE,
        STOP
    };

    private Entity rootEntity;

    private String name;

    private HashMap<String, AJAnimationInfoBlock> animationMap;

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

    private long animationEndTime;

    public AJEntity(String name) {
        this.name = name;
        this.animationMap = new HashMap<>();
    }

    protected abstract void afterSummoning(Location location);

    protected abstract void afterSpawnEvent(Entity rootEntity);

    protected abstract void script();

    /**
     * 현재 AJEntity를 제거한다. <br>
     * AJEntity.remove(AJEntity ajEntity, Entity rootEntity){...}를 내부적으로 호출한다.<br>
     * */
    public void remove(){
        Bukkit.dispatchCommand(
                Bukkit.getConsoleSender(),
                getExecuteAsRunFuncPrefix() + "animated_java:" + this.name + "/remove/this");
        AJEntityManager.remove(this,rootEntity);
    }

    /**
     * 애니메이션을 등록하는 메소드.<br>
     * HashMap<>에 다음과 같이 등록된다
     * <code>
     *     .put(animationState,"animated_java:"+this.name+"/animations/"+animationState);
     * <code/>
     * */
    public void registerAnimation(String animationState,double durationSeconds){
        animationMap.put(
                animationState,
                new AJAnimationInfoBlock(
                         "animated_java:"+this.name+"/animations/"+animationState,
                        (long)durationSeconds * 20
                )
        );
    }

    /**
     * 애니에이션을 실행하는 메소드 <br>
     * 현재 이 메소드를 통해 실행하려는 애니메이션과 실행 중인 애니메이션이 같은 경우, 아무 일도 일어나지 않음. <br>
     * 다를 경우. 해당 애니메이션으로 바로 진행됨. <br>
     * @throws : AJAnimationNotFoundException
     * */
    public void playAnim(String selectedAnimation)throws AJAnimationNotFoundException{

        AJAnimationInfoBlock acb = this.animationMap.get(selectedAnimation);

        long durationTicks = acb.getAnimationDurationTicks();

        long currentTime = System.currentTimeMillis();

        String animation = acb.getAnimation();

        if(animationEndTime > currentTime){
            return;
        }

        if(animation == null){
            throw new AJAnimationNotFoundException(
                    "AJAnimation is not found : \"" + selectedAnimation + "\"\n"
                    +"Solution : Check the animated_java project name and your JAVA code");
        }

        this.animationPlaying = animation;
        this.animationEndTime = durationTicks * 50 + currentTime;
        this.animationState = ANIMATION_STATE.PLAY;
        String command = getExecuteAsRunFuncPrefix() + animation + "/play";
        PluginInstance.dfLogUTF8(command);
        Bukkit.dispatchCommand(Bukkit.getConsoleSender(), command);


    }

    /**
     * 실행 중인 해당 애니메이션을 일시 정지한다.
     * getAnimationState()메소드로 얻을 수 있는 값은 ANIMATION_PAUSE의 값이 된다.
     * */
    public void pauseAnim(){

        this.animationState = ANIMATION_STATE.PAUSE;
        Bukkit.dispatchCommand(
                Bukkit.getConsoleSender(),
                getExecuteAsRunFuncPrefix() + animationPlaying + "/pause");
    }

    /**
     * 실행 중인 해당 애니메이션을 완전히 끈다.<br>
     * getAnimationPlaying()메소드로 얻을 수 있는 값은 null이 되며,<br>
     * getAnimationState()메소드로 얻을 수 있는 값은 ANIMATION_STOP의 값이 된다.
     * */
    public void stopAnim(){
        Bukkit.dispatchCommand(
                Bukkit.getConsoleSender(),
                getExecuteAsRunFuncPrefix() + animationPlaying + "/stop");
        this.animationState = ANIMATION_STATE.STOP;
        this.animationPlaying = null;
    }

    /**
     * 다음 문자열을 반환한다.
     * @return "execute as "+ rootEntity.getUniqueId() +" run function "
     * */
    private String getExecuteAsRunFuncPrefix(){
        return "execute as "+ rootEntity.getUniqueId() +" run function ";
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

    /**
     * 현재 AJEntity가 처리되고 있는 World를 가져온다.
     * */
    public World getWorld(){
        return this.world;
    }

    //setter

    public void setRootEntity(Entity entity){
        this.rootEntity = entity;
    }

    public void setWorld(World world){
        this.world = world;
    }

}
