package org.EternalReturn.System.ERPlayer.Gui.Bossbars.RumiaIsland.extBComponent;

import net.kyori.adventure.text.format.TextColor;
import org.EternalReturn.System.SystemManager;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BButton;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BLocation;

/**
 * Hyperloop BButton
 * */
public class HBButton extends BButton {

    private int zoneState;

    public HBButton(int sizeX, int sizeY, BLocation location, String buttonName) {
        super(sizeX, sizeY,
                "map/hyperloop/default/" + buttonName,
                "map/hyperloop/hover/" + buttonName, location, buttonName);


        this.zoneState = SystemManager.GREEN_ZONE;
    }

    //getter
    public int getZoneState(){
        return zoneState;
    }

    //setter
    public void setZoneState(int state){
        try{
            int currentState = this.zoneState;
            this.zoneState = state;

            if(zoneState == SystemManager.GREEN_ZONE){
                updateComponent(TextColor.color(0xffffff));
            }
            else if(zoneState == SystemManager.YELLOW_ZONE){
                updateComponent(TextColor.color(0xFFE851));
            }
            else if(zoneState == SystemManager.RED_ZONE){
                updateComponent(TextColor.color(0xFF7D66));
            }
            else{
                this.zoneState = currentState;
                throw new IllegalArgumentException("영역 상태 수정 함수에 예상치 못한 값이 들어갔습니다.");
            }
        }
        catch (IllegalStateException e){
            e.printStackTrace();
        }
    }



}
