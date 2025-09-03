package org.EternalReturn.Util.JSON;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class JSONFileManager{
	
	private String fileLocation;
	
	public JSONFileManager() {
	}
	
	public void writeJSONString(JSONObject jsonObj) {
		writeJSONString(jsonObj, this.fileLocation);
	}
	
	public void writeJSONString(JSONObject jsonObj, String fileLocation) {
		try {
			
			FileWriter fw = new FileWriter(fileLocation);
			jsonObj.writeJSONString(fw);
			fw.flush();
			fw.close();
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public JSONObject openJSONFile() {
		return openJSONFile(this.fileLocation);
	}

	public JSONObject openJSONFile(String fileLocation) {
		
		File f = new File(fileLocation);
		
		JSONParser parser = new JSONParser();
		
		JSONObject toReturn = null;
		
		try {
			if(f.exists()) {
				FileReader fReader = new FileReader(f);
				
				toReturn = (JSONObject)parser.parse(new BufferedReader(new FileReader(f)));
				
				fReader.close();
				
			}else {
				f.createNewFile();
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return toReturn;
		
		
	}
	
	public void setFileLocation(String fileLocation) {
		this.fileLocation = fileLocation;
	}
	
	public String getFileLocation() {
		return this.fileLocation;
	}
}

