package org.EternalReturn.Util.AnimatedJAVAEntity;

import org.EternalReturn.System.ERAnimal.ERAnimal;
import org.EternalReturn.Util.Free.FreeAble;
import org.bukkit.Bukkit;
import org.bukkit.Location;
import org.bukkit.World;
import org.bukkit.entity.Entity;
import org.bukkit.entity.EntityType;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.entity.EntitySpawnEvent;
import org.bukkit.plugin.Plugin;
import org.jetbrains.annotations.NotNull;

import java.util.*;

/**
 * AJEntity를 원활하게 관리하기 위한 싱글톤 클래스<br>
 * */
public class AJEntityManager implements Listener , FreeAble {

    private static AJEntityManager manager = null;

    private static HashMap<Entity, AJEntity> ajEntityMap = new HashMap<>(8);

    private static List<AJEntity> ajEntities = new ArrayList<>(8);

    private static Plugin plugin = null;

    private static Queue<AJEntity> ajEntitySummonQueue = new LinkedList<>();

    @Override
    public void free() {
        flushAllEntities();
        manager = null;
        ajEntityMap.clear();
        ajEntityMap = null;
        ajEntities.clear();
        ajEntities = null;
        plugin = null;
        ajEntitySummonQueue.clear();
        ajEntitySummonQueue = null;
    }

    private AJEntityManager(){

    }

    public static AJEntityManager registerAJEntityManager(Plugin pluginInstance){
        if(manager == null && plugin == null){
            manager = new AJEntityManager();
            plugin = pluginInstance;
        }
        else{
            Bukkit.getConsoleSender().sendMessage(
                    "\"AJEntityManager.registerAJEntityManager(Plugin plugin)\"는 이미 호출되었습니다. \n객체가 이미 존재합니다.");
        }
        return manager;
    }

    /**
     * 현재 싱글톤 인스턴스가 존재하는지 확인하는 함수. <br>
     * AJEntityManager의 public static 메소드들을 실행시키기 전 해당 싱글톤 인스턴스가 정상적인 상태인지 확인한다.
     * */
    private boolean thisSingletoneIsAlreadAllocated(){
        if(manager == null || plugin == null){
            Bukkit.getConsoleSender().sendMessage("\n"
                    + "\"@Override public void onEnable(){...}\"에서\n"
                    + "\"AJEntityManager.registerAJEntityManager(Plugin plugin)\"를 먼저 호출하십시오.");
            return false;
        }
        return true;
    }

    public static AJEntityManager getInstance(){
        return manager;
    }

    public static AJEntity getAJEntity(Entity rootEntity){
        return ajEntityMap.get(rootEntity);
    }

    /**
     * 해당 Location에 AJEntity 객체의 명세대로 엔티티를 소환한다.
     * */
    public static void summon(@NotNull AJEntity ajEntity, @NotNull Location location){

        World world = location.getWorld();

        if(world == null){
            throw new NullPointerException("해당 함수의 매개변수로 전달된 Location 객체는 반드시 World 객체 정보를 가지고 있어야 합니다.");
        }

        if(manager.thisSingletoneIsAlreadAllocated()){

            String command =  "execute"
                    +" positioned " + location.getX() + " " + location.getY() + " " + location.getZ()
                    +" rotated " + location.getYaw() + " " + location.getPitch()
                    +" run function animated_java:" + ajEntity.getName() + "/summon {args:0}";
            Bukkit.dispatchCommand(Bukkit.getConsoleSender(), command);

            //해당 명세서를 큐에 넣는다. 위의 명령어가 실행이 완료될 때마다, 순차적으로 dequeue(poll)되어
            //ajEntityMap에 등록된다.
            ajEntitySummonQueue.offer(ajEntity);
            //해당 AJEntity가 소환된 world 저장
            ajEntity.setWorld(world);

            ajEntity.afterSummoning(location);

        }
    }

    public static void remove(AJEntity ajEntity, Entity rootEntity) {
        ajEntityMap.remove(rootEntity, ajEntity);
        ajEntities.remove(ajEntity);
    }

    /**
     * 현재 객체가 관리하고 있는 모든 AJEntity를 삭제하는 메소드.
     * */
    public static void flushAllEntities(){
        for(AJEntity ajEntity : ajEntities){
            ajEntity.remove();
        }
        ajEntityMap.clear();
        ajEntities.clear();
    }

    /**
     * 소환된 엔티티를 대상으로 태그를 선형으로 조사하여<br>
     * "aj."로 시작, ".root"로 끝나는 태그가 있는지 확인하고, 해당 엔티티인 경우 true 반환 그 외에는 false 반환
     * */
    private boolean isAJEntityRoot(@NotNull Entity entity){
        if(entity.getType().equals(EntityType.ITEM_DISPLAY)){
            for(String tag : entity.getScoreboardTags()){
                if(tag.startsWith("aj.") && tag.endsWith(".root")){
                    //혹은 tag.equals("aj.global.root")
                    return true; //아도겐!!
                }
            }
        }
        return false;
    }

    //getter

    public static List<AJEntity> getAjEntities(){
        return AJEntityManager.ajEntities;
    }

    //Listener code
    @EventHandler
    public void event(EntitySpawnEvent e){

        Entity entity = e.getEntity();

        //ajEntitySummonQueue가 비어있는지 확인한다.
        //비어있지 않는 경우, 해당 엔티티가 root entity 인지 확인한다.
        // root entity 라면, ajEntityMap에 등록한다.
        if(ajEntitySummonQueue.isEmpty()){
            return;
        }

        if(isAJEntityRoot(entity)){
            AJEntity ajEntity = ajEntitySummonQueue.poll();

            ajEntityMap.put(entity, ajEntity);
            ajEntities.add(ajEntity);

            assert ajEntity != null : "ajEntity가 Null 입니다. AJEntityManager.summon(AJEntity, Location) AJEntity에 잘못된 값이 들어갔습니다.";

            ajEntity.setRootEntity(entity);
            ajEntity.afterSpawnEvent(entity);
        }
    }

}
