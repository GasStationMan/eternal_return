package org.EternalReturn.ERAnimal;

import com.google.gson.Gson;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Gson으로 animal.json 내의 야생동물 정보를 파싱, load()로 반환한다.
 * 생성 시 JSON파일의 경로가 필요하다.
 * */
public class ERAJEntityLoader {

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

    private JsonRoot root;

    public ERAJEntityLoader(String jsonPath){
        try {
            String json = Files.readString(Path.of(jsonPath));
            Gson gson = new Gson();
            this.root = gson.fromJson(json, JsonRoot.class);

        } catch (Exception e) {
            throw new RuntimeException("Failed to load animal.json", e);
        }

    }

    public HashMap<String, AreaERAnimalInfo> load(){
        HashMap<String, AreaERAnimalInfo> areaInfoMap = new HashMap<>();

        for (ERAJEntityLoader.JsonArea area : root.location()) {

            List<ERAnimalInfo> animals = new ArrayList<>();

            for (ERAJEntityLoader.JsonAnimal a : area.table()) {
                animals.add(new ERAnimalInfo(
                        a.name(),
                        a.pos()[0],
                        a.pos()[1],
                        a.pos()[2],
                        (float)a.rot()[0],
                        (float)a.rot()[1],
                        null
                ));
            }

            areaInfoMap.put(
                    area.name(),
                    new AreaERAnimalInfo(area.name(), animals)
            );
        }

        return areaInfoMap;
    }


    public static void main(String[] args){
        ERAJEntityLoader loader = new ERAJEntityLoader("animal.json");
        HashMap<String,AreaERAnimalInfo> map = loader.load();

        for(AreaERAnimalInfo info : map.values()){
            System.out.println(info);
        }

    }


}
