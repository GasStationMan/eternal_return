package org.EternalReturn.System.AreaSystem;

import org.EternalReturn.System.SystemManager;

public class AreaNode {

    private int zoneState;
    private String name;

    public AreaNode(String name){
        this.zoneState = SystemManager.GREEN_ZONE;
        this.name = name;
    }

    //getter
    public int getZoneState(){
        return zoneState;
    }

    public String getName(){
        return name;
    }

    //setter
    public void setZoneState(int state){
        try{
            if(state != SystemManager.RED_ZONE && state != SystemManager.GREEN_ZONE && state != SystemManager.YELLOW_ZONE){
                throw new IllegalArgumentException("SystemManager.GREEN_ZONE 또는 RED_ZONE 또는 YELLOW_ZONE으로 값을 넣으십시오.");
            }
            this.zoneState = state;
        }
        catch (IllegalStateException e){
            e.printStackTrace();
        }
    }



}
