package org.EternalReturn.System.ERAnimalSystem;

import org.EternalReturn.ERAnimal.*;
import org.EternalReturn.ERPlayer.ERPlayer;
import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.System.SystemManager;
import org.EternalReturn.Util.AnimatedJAVAEntity.AJEntityManager;
import org.bukkit.Location;
import org.bukkit.World;

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

    private static ERAnimalLoader erAnimalLoader;

    private static List<ERAnimal> animalList;

    private ERAnimalManager(AJEntityManager ajEntityManager){

        if(ajEntityManager == null){
            throw new RuntimeException("Cannot instantiate(register) ERAnimalManager, ajEntityManager is null.");
        }
        this.erAnimalLoader = new ERAnimalLoader("plugins/animal.json");
        this.areaInfoMap = this.erAnimalLoader.load();
        this.animalList = new ArrayList<>();
        this.world = PluginInstance.getServerInstance().getServer().getWorlds().getFirst();

        __registerERAnimals(/*ajEntityManager*/);
    }

    /**
     * 플레이어 리스트를 전부 순회하며 각 ERAnimal마다 시야 카운트를 조정.
     * 시야 카운트가 0이 된 경우, 엔티티를 보이지 않게 함.
     * */
    public static void animalRenderDistanceManage(int dist) {

        for(ERAnimal animal : animalList){

            Location animalLoc = animal.getLocation();
            double ax = animalLoc.getX();
            double ay = animalLoc.getY();
            double az = animalLoc.getZ();
            animal.resetRefCount(); //레퍼런스 카운트 리셋

            for(ERPlayer player : SystemManager.getERPlayerList()){
                Location ploc = player.getPlayer().getLocation();

                double dx = ax - ploc.getX();
                double dy = ay - ploc.getY();
                double dz = az - ploc.getZ();

                if(dx*dx + dy*dy + dz*dz <= dist*dist){
                    animal.addRefCount(); //하나씩 추가
                }

            }

            if(animal.getRefCount() == 0 && animal.isShown()){
                animal.remove();
                animal.setShown(false);
            }

            if(animal.getRefCount() > 0 && !animal.isShown()){
                animal.summon();
                animal.setShown(true);
            }


        }




    }

    private void __registerERAnimals(/*AJEntityManager ajEntityManager*/) {

        for(AreaERAnimalInfo areaInfo : areaInfoMap.values()){
            for(ERAnimalInfo animalInfo : areaInfo.animals()){

                ERAnimal newInstance = null;

                Location location = new Location(world, animalInfo.x, animalInfo.y, animalInfo.z, animalInfo.yaw, animalInfo.pitch);
                if(animalInfo.name.equals("bear")) newInstance = new Bear(location);
                else if(animalInfo.name.equals("boar")) newInstance = new Boar(location);
                else if(animalInfo.name.equals("wolf")) newInstance = new Wolf(location);
                else if(animalInfo.name.equals("alpha")) newInstance = new Alpha(location);
                else{
                    throw new RuntimeException(animalInfo.name + " is NOT in the ERAnimal category");
                }

                animalInfo.instance = newInstance;
                this.animalList.add(newInstance);
                AJEntityManager.registerAJEntity(newInstance);
            }
        }
    }

    public static List<ERAnimal> getERAnimalList(){
        return ERAnimalManager.animalList;
    }

    public static ERAnimalManager registerERAnimalManager(AJEntityManager ajEntityManager){
        if(instance == null){
            instance = new ERAnimalManager(ajEntityManager);
        }
        return instance;
    }

}
