package org.EternalReturn.System;

import com.google.gson.Gson;
import org.EternalReturn.Util.AnimatedJAVAEntity.AJEntityManager;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


record JsonRoot(
        List<JsonArea> location
) {}

record JsonArea(
        String name,
        List<JsonAnimal> table
) {}

record JsonAnimal(
        String name,
        double[] pos,
        double[] rot
) {}

record ERAnimalInfo(String name, double x, double y, double z, double yaw, double pitch) {
}


record AreaERAnimalInfo(String name, List<ERAnimalInfo> animals) {
}

/**
 * animal.json 정보를 토대로 ERAnimal을 관리하는 클래스.
 * */
public class ERAnimalManger {

    private static AJEntityManager ajEntityManager;

    private static ERAnimalManger instance;

    private static HashMap<String, AreaERAnimalInfo> areaInfoMap;

    private ERAnimalManger(){
        try {
            String json = Files.readString(Path.of(
                    "E:\\EWorkspace\\git\\eternal_return\\server\\plugins\\animal.json"
            ));

            Gson gson = new Gson();
            JsonRoot root = gson.fromJson(json, JsonRoot.class);

            __load(root);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static ERAnimalManger registerERAnimalManager(){
        if(instance == null){
            instance = new ERAnimalManger();
        }
        return instance;
    }

    private void __load(JsonRoot root){
        areaInfoMap = new HashMap<>();

        for (JsonArea area : root.location()) {

            List<ERAnimalInfo> animals = new ArrayList<>();

            for (JsonAnimal a : area.table()) {
                animals.add(new ERAnimalInfo(
                        a.name(),
                        a.pos()[0],
                        a.pos()[1],
                        a.pos()[2],
                        a.rot()[0],
                        a.rot()[1]
                ));
            }

            areaInfoMap.put(
                    area.name(),
                    new AreaERAnimalInfo(area.name(), animals)
            );
        }
    }

    public static ERAnimalManger getInstance() {
        return instance;
    }

    public static void main(String[] args){
        ERAnimalManger manager = ERAnimalManger.registerERAnimalManager();
        System.out.println("test");
        for(AreaERAnimalInfo areaERAnimalInfo : areaInfoMap.values()){
            String indent = "   ";
            System.out.println(areaERAnimalInfo.name());
            for(ERAnimalInfo animal : areaERAnimalInfo.animals()){
                System.out.println(indent + animal.name() + " : " + animal.x() + ", " + animal.y() + ", " + animal.z() + ", " + animal.yaw() + ", " + animal.pitch());
            }
        }
    }


}
