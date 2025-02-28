package org.EternalReturn.System.ERPlayer.Gui.Bossbars.RumiaIsland.extBComponent;

import net.kyori.adventure.text.format.TextColor;
import org.EternalReturn.System.SystemManager;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BLocation;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BImage;

public class HBImage extends BImage {
    /**
     * BImage를 생성하는 함수 extends extBComponent
     *
     * @param sizeX    : font가 가리키는 이미지의 공백을 제거한 x픽셀 수
     * @param sizeY    : font가 가리키는 이미지의 y픽셀 수
     * @param name     : 지역의 이름
     * @param location : BComponent의 위치 정보를 담는 객체
     */

    private int zoneState;

    public HBImage(int sizeX, int sizeY, BLocation location, String name) {
        super(sizeX, sizeY, "map/hyperloop/default/" + name, location);
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
