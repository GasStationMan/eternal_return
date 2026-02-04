package org.EternalReturn.util.Gui.bossbarGui.View;

import net.kyori.adventure.key.Key;
import net.kyori.adventure.text.Component;
import net.kyori.adventure.text.format.TextColor;

import java.util.ArrayList;
import java.util.List;

@Deprecated
public class BTextComponent extends BComponent{

    protected int sizeX;
    protected int sizeY;
    protected Component component;
    protected List<Component> metaData;
    protected BLocation location;
    protected TextColor color;
    protected StringBuilder text;

    public void free(){
        super.free();
        component = null;
        metaData.clear();
        metaData = null;
        location = null;
        text = null;
        color = null;
    }
    /**
     * BButton, BImage의 틀이 되어 기본 메소드들을 제공하는 클래스
     * @param sizeX     : font가 가리키는 이미지의 공백을 제거한 x픽셀 수
     * @param sizeY     : font가 가리키는 이미지의 y픽셀 수
     * @param font      : 리소스팩의 font의 위치
     * @param location  : BComponent의 위치 정보를 담는 객체
     * */
    public BTextComponent(int sizeX, int sizeY, String font, BLocation location){
        super(location);
        this.sizeX = sizeX;
        this.sizeY = sizeY;
        this.text = new StringBuilder(32);
        this.location = location;
        this.color = TextColor.color(0xffffff);

        List<Component> children = new ArrayList<>(5);
        children.add(Component.translatable("space." + -location.getX()).font(Key.key("default")));
        children.add(Component.translatable("space." + -sizeX / 2).font(Key.key("default")));
        children.add(Component.text(text.toString()));
        children.add(Component.translatable("space." + -sizeX / 2).font(Key.key("default")));
        children.add(Component.translatable("space." + location.getX()).font(Key.key("default")));

        component = Component.text("").children(children);
        metaData = children;
    }

    public Component getComponent(){
        return component;
    }

    public float getSizeX() {
        return sizeX;
    }

    public float getSizeY() {
        return sizeY;
    }

    public void setLocation(int x, int y){
        super.setLocation(x,y);
        updateComponent();
    }

    protected void updateComponent(){
        metaData.set(0, Component.translatable("space." + -location.getX()).font(Key.key("default")));
        metaData.set(1, Component.translatable("space." + -sizeX / 2).font(Key.key("default")));
        metaData.set(2, Component.text(text.toString()));
        metaData.set(3, Component.translatable("space." + -sizeX / 2).font(Key.key("default")));
        metaData.set(4, Component.translatable("space." + location.getX()).font(Key.key("default")));
        component = Component.text("").children(metaData);
    }

    protected void updateComponent(TextColor color){
        this.color = color;

        metaData.set(0, Component.translatable("space." + -location.getX()).font(Key.key("default")));
        metaData.set(1, Component.translatable("space." + -sizeX / 2).font(Key.key("default")));
        metaData.set(2, Component.text(text.toString()));
        metaData.set(3, Component.translatable("space." + -sizeX / 2).font(Key.key("default")));
        metaData.set(4, Component.translatable("space." + location.getX()).font(Key.key("default")));
        component = Component.text("").children(metaData);

    }


}
