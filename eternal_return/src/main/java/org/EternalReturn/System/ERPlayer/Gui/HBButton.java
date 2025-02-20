package org.EternalReturn.System.ERPlayer.Gui;

import org.EternalReturn.System.SystemManager;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BButton;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BGuiLocation;

/**
 * Hyperloop BButton
 * */
public class HBButton extends BButton {
    private int zoneState;

    private String redZoneDefaultString;
    private String redZoneHoverString;
    private String yellowZoneDefaultString;
    private String yellowZoneHoverString;
    private String greenZoneDefaultString;
    private String greenZoneHoverString;


    public HBButton(int sizeX, int sizeY, BGuiLocation location, String buttonName) {
        super(sizeX, sizeY,
                "map/hyperloop/default/" + buttonName,
                "map/hyperloop/hover/" + buttonName, location, buttonName);

        this.greenZoneDefaultString = "map/hyperloop/default/" + buttonName;
        this.greenZoneHoverString = "map/hyperloop/hover/" + buttonName;
        this.zoneState = SystemManager.GREEN_ZONE;
    }

    public void setZoneState(int state){
        try{
            int currentState = this.zoneState;
            this.zoneState = state;

            if(zoneState == SystemManager.GREEN_ZONE){
                updateComponent(greenZoneDefaultString);
            }
            else if(zoneState == SystemManager.YELLOW_ZONE){
                updateComponent(yellowZoneDefaultString);
            }
            else if(zoneState == SystemManager.RED_ZONE){
                updateComponent(redZoneDefaultString);
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
