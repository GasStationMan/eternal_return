package org.EternalReturn.Util.Gui.bossbarGui.Model;

public class BComponent{

    protected BLocation location;
    protected BComponentManager bComponentManager;

    public void free(){
        location = null;
        bComponentManager = null;
    }

    /**
     * BFontComponent의 틀이 되어 기본 메소드들을 제공하는 클래스
     * @param location  : BComponent의 위치 정보를 담는 객체
     * */
    public BComponent(BLocation location){
        this.location = location;
    }

    public BLocation getLocation(){
        return location;
    }

    public void setLocation(int x, int y){
        location.setX(x);
        location.setY(y);
    }

    public void setBComponentManager(BComponentManager bComponentManager){
        this.bComponentManager = bComponentManager;
    }


}
