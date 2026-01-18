package org.EternalReturn.ERAnimal;

import org.EternalReturn.ERAnimal.Animals.Alpha.Alpha;
import org.EternalReturn.ERAnimal.Animals.Bear.Bear;
import org.EternalReturn.ERAnimal.Animals.Boar.Boar;
import org.EternalReturn.ERAnimal.Animals.Wolf.Wolf;
import org.EternalReturn.ERAnimal.Event.ERAnimalReadyEvent;
import org.EternalReturn.ERPlayer.ERPlayer;
import org.EternalReturn.System.DPEngine;
import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.System.SystemManager;
import org.EternalReturn.Util.AJEntity.AJEntityManager;
import org.bukkit.Location;
import org.bukkit.World;
import org.bukkit.entity.Entity;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;







/**
 * animal.json 정보를 토대로 ERAnimal을 관리하는 클래스.
 * AJEntityManager에 접근하는 코드가 있다. 해당 클래스를 register(instantiate)하는 것은 필수.
 *
 * 첫 번째 월드에만 엔티티를 소환한다. 나중에 아키텍처를 바꿀 필요는 있어보인다. (필요하다면)
 * PluginInstance.getServerInstance().getServer().getWorlds().getFirst();
 *
 * */
public class ERAnimalManager {

    private static World world;

    private static ERAnimalManager instance;

    private static HashMap<String, AreaERAnimalInfo> areaInfoMap;

    private static ERAJEntityLoader erAnimalLoader;

    private static List<ERAnimal> animalList;

    private static DPEngine engine;

    private ERAnimalManager(AJEntityManager ajEntityManager, DPEngine engine){

        if(ajEntityManager == null){
            throw new RuntimeException("Cannot instantiate(register) ERAnimalManager, ajEntityManager is null.");
        }
        this.erAnimalLoader = new ERAJEntityLoader("plugins/animal.json");
        this.areaInfoMap = this.erAnimalLoader.load();
        this.animalList = new ArrayList<>();
        this.world = PluginInstance.getServerInstance().getServer().getWorlds().getFirst();
        this.engine = engine;
        __registerERAnimals(/*ajEntityManager*/);
    }



    public static void update(int updateDistance) {
        for(ERAnimal animal : animalList){
            if (animal.isShown()) {
                __animalMountUpdate(animal);
            }

            __animalShownUpdate(animal, updateDistance);
        }
    }

    private static void __animalMountUpdate(ERAnimal animal){
        ERAJEntity ajEntity = animal.getAJEntity();
        Entity actor = ajEntity.getActor();
        Entity rootEntity = ajEntity.getRootEntity();
        if(actor == null){
            return;
        }
        if (actor.getPassengers().isEmpty()) {
            actor.addPassenger(rootEntity);
            System.out.println("mount!");
        }
    }

    /**
     * 플레이어 리스트를 전부 순회하며 각 ERAnimal마다 시야 카운트를 조정.
     * 시야 카운트가 0이 된 경우, 엔티티를 보이지 않게 함.
     * */
    private static void __animalShownUpdate(ERAnimal animal, int dist){
        ERAJEntity ajEntity = animal.getAJEntity();
        Location animalLoc = ajEntity.getLocation();
        double ax = animalLoc.getX();
        double ay = animalLoc.getY();
        double az = animalLoc.getZ();
        ajEntity.resetRefCount(); //레퍼런스 카운트 리셋

        for(ERPlayer player : SystemManager.getERPlayerList()){
            Location ploc = player.getPlayer().getLocation();

            double dx = ax - ploc.getX();
            double dy = ay - ploc.getY();
            double dz = az - ploc.getZ();

            if(dx*dx + dy*dy + dz*dz <= dist*dist){
                ajEntity.addRefCount(); //하나씩 추가
            }
        }

        if(ajEntity.getRefCount() == 0 && ajEntity.isShown()){
            ajEntity.remove();
            ajEntity.setShown(false);
        }

        if(ajEntity.getRefCount() > 0 && !ajEntity.isShown()){
            ajEntity.summon();
            ajEntity.setShown(true);
            animal.submitEvent(new ERAnimalReadyEvent());
        }

    }

    private void __registerERAnimals(/*AJEntityManager ajEntityManager*/) {

        for(AreaERAnimalInfo areaInfo : areaInfoMap.values()){
            for(ERAnimalInfo animalInfo : areaInfo.animals()){
                
                //ERAnimal 생성
                ERAnimal newInstance = new_ERAnimal(animalInfo);

                //이거 없으면 무한 연결리스트 쌉가능
                engine.registerMonobehaviourActor(newInstance);

                animalInfo.instance = newInstance;

                this.animalList.add(newInstance);

                AJEntityManager.registerAJEntity(newInstance.getAJEntity());
            }
        }
    }

    private static @NotNull ERAnimal new_ERAnimal(ERAnimalInfo animalInfo) {
        Location location = new Location(world, animalInfo.x, animalInfo.y, animalInfo.z, animalInfo.yaw, animalInfo.pitch);
        ERAnimal newInstance = switch (animalInfo.name) {
            case "bear" -> new Bear(location);
            case "boar" -> new Boar(location);
            case "wolf" -> new Wolf(location);
            case "alpha" -> new Alpha(location);
            default -> throw new RuntimeException(animalInfo.name + " is NOT in the EREntity category");
        };
        return newInstance;
    }

    public static List<ERAnimal> getERAnimalList(){
        return ERAnimalManager.animalList;
    }

    public static ERAnimalManager registerERAnimalManager(AJEntityManager ajEntityManager, DPEngine engine){
        if(instance == null){
            instance = new ERAnimalManager(ajEntityManager, engine);
        }
        return instance;
    }

}
