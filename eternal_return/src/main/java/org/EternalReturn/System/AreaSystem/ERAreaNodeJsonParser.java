package org.EternalReturn.System.AreaSystem;


import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.Util.Physics.MathVector.Vec3d;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class ERAreaNodeJsonParser {

    private String directory;

    private List<AreaNode> areaNodes;

    public ERAreaNodeJsonParser(String directory){
        this.directory = directory;
    }

    public List<AreaNode> parse(){
        try{
            //여기서 NullPointerException한번 터질 수 있음.
            File file = new File(this.directory);
            if(!file.exists()){
                throw new RuntimeException("해당하는 파일이 없습니다.");
            }

            BufferedReader br = new BufferedReader(new FileReader(file));

            areaNodes = new ArrayList<>(20);

            JSONParser parser = new JSONParser();
            JSONObject obj = (JSONObject) parser.parse(br);
            //addNode 밑의 JSON 요소들을 가져온다.
            JSONArray arr = (JSONArray)obj.get("addNode");

            for(Object elem : arr) {
                JSONObject area = (JSONObject)elem;
                
                //구역의 이름을 가져오기
                String name = (String)area.get("name");
                if(name == null){
                    throw new RuntimeException("구역의 \"name\"에 해당하는 값이 없습니다.");
                }

                AreaNode newNode= new AreaNode(name);
                
                //야생동물들 정보 가져오기
                JSONArray animals = (JSONArray)area.get("animals");
                if(animals == null){
                    PluginInstance.dfLogUTF8("해당 지역 " + name + "에 야생동물에 대한 정보가 없습니다.");
                }
                else{
                    // 새로운 시스템 ERAnimalSPCB
                    // ERAnimalSPCB는 야생동물의 스폰 위치, 스폰 종류, 스폰할 개수를 저장하는 객체이다.
                    List<ERAnimalSPCB> spcbList = new ArrayList<>(16);
                    for(Object animal : animals) {
                        JSONObject animalInfo = (JSONObject)animal;
                        JSONArray animalCoord = (JSONArray)animalInfo.get("coord");

                        spcbList.add(
                                new ERAnimalSPCB(
                                        (String)animalInfo.get("className"),
                                        new Vec3d(
                                                (double)animalCoord.get(0),
                                                (double)animalCoord.get(1),
                                                (double)animalCoord.get(2)
                                        ),
                                        ((Long)animalInfo.get("num")).intValue()
                                )
                        );
                    }
                    newNode.setSpawnPointControlBlocks(spcbList);
                }
                areaNodes.add(newNode);

            }

            return areaNodes;

        }
        catch (ParseException | RuntimeException | IOException e) {
            e.printStackTrace();
        }
        return null;
    }


}
