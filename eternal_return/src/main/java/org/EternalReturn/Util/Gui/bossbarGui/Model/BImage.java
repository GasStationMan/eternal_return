package org.EternalReturn.Util.Gui.bossbarGui.Model;

public class BImage extends BFontComponent {
    
    /**
     * BImage를 생성하는 함수 extends extBComponent
     * @param sizeX     : font가 가리키는 이미지의 공백을 제거한 x픽셀 수
     * @param sizeY     : font가 가리키는 이미지의 y픽셀 수
     * @param font      : 리소스팩의 font의 위치
     * @param location  : BComponent의 위치 정보를 담는 객체
     * */
    public BImage(int sizeX, int sizeY, String font, BLocation location){
        super(sizeX, sizeY, font, location);
    }

}
