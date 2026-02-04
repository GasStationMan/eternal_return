package org.EternalReturn.util.Gui.bossbarGui.View;

import java.util.ArrayList;
import java.util.List;

public class BPanel extends BComponent implements BComponentManager{

    private List<BComponent> bComponents;
    private List<BButton> bButtons;

    /**
     * BFontComponent, BPanel 틀이 되어 기본 메소드들을 제공하는 클래스
     *
     * @param location : BComponent의 위치 정보를 담는 객체
     */
    public BPanel(BLocation location) {
        super(location);
        bComponents = new ArrayList<>(4);
        bButtons = new ArrayList<>(4);
    }

    /**
     * 부모 노드 방향으로 repaint()호출
     * */
    @Override
    public void repaint() {
        bComponentManager.repaint();
    }

    @Override
    public void add(BComponent bComponent) {
        bComponent.setBComponentManager(this);
        BLocation bGuiLocation = bComponent.getLocation();
        bComponent.setLocation(
                bGuiLocation.getX() + location.getX(),
                bGuiLocation.getY() + location.getY()
        );

        bComponents.add(bComponent);
        if(bComponent instanceof BButton){
            bButtons.add((BButton)bComponent);
        }
    }

    @Override
    public List<BComponent> getBComponents() {
        return bComponents;
    }


}
