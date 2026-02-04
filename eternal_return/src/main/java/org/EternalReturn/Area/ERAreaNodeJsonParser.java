package org.EternalReturn.Area;


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
