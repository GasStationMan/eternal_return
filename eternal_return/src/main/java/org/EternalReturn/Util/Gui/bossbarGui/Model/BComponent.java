package org.EternalReturn.Util.Gui.bossbarGui.Model;

import net.kyori.adventure.key.Key;
import net.kyori.adventure.text.Component;
import net.kyori.adventure.text.format.TextColor;

import java.util.ArrayList;
import java.util.List;

public class BComponent{

    protected int sizeX;
    protected int sizeY;
    protected char text;
    protected String font;
    protected Component component;
    protected List<Component> metaData;
    protected BGuiLocation location;
    protected TextColor color;

    public void free(){
        font = null;
        component = null;
        metaData.clear();
        location = null;
    }
    /**
     * BButton, BImage의 틀이 되어 기본 메소드들을 제공하는 클래스
     * @param sizeX     : font가 가리키는 이미지의 공백을 제거한 x픽셀 수
     * @param sizeY     : font가 가리키는 이미지의 y픽셀 수
     * @param font      : 리소스팩의 font의 위치
     * @param location  : BComponent의 위치 정보를 담는 객체
     * */
    public BComponent(int sizeX, int sizeY, String font, BGuiLocation location){
        this.sizeX = sizeX;
        this.sizeY = sizeY;
        this.text = '\u1000';
        this.font = font;
        this.location = location;
        this.color = TextColor.color(0xffffff);

        List<Component> children = new ArrayList<>(5);
        children.add(Component.translatable("space." + -location.getX()).font(Key.key("default")));
        children.add(Component.translatable("space." + -sizeX / 2).font(Key.key("default")));
        children.add(Component.text((char)(text + location.getY())).font(Key.key(font)));
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

    public BGuiLocation getLocation(){
        return location;
    }

    public void setLocation(int x, int y){
        location.setX(x);
        location.setY(y);
        updateComponent();
    }

    protected void updateComponent(){

        int mouseY = text + location.getY();

        metaData.set(0, Component.translatable("space." + -location.getX()).font(Key.key("default")));
        metaData.set(1, Component.translatable("space." + -sizeX / 2).font(Key.key("default")));
        metaData.set(2, Component.text((char)mouseY).color(this.color).font(Key.key(font)));
        metaData.set(3, Component.translatable("space." + -sizeX / 2).font(Key.key("default")));
        metaData.set(4, Component.translatable("space." + location.getX()).font(Key.key("default")));
        component = Component.text("").children(metaData);
    }

    protected void updateComponent(TextColor color){
        int mouseY = text + location.getY();
        this.color = color;

        metaData.set(0, Component.translatable("space." + -location.getX()).font(Key.key("default")));
        metaData.set(1, Component.translatable("space." + -sizeX / 2).font(Key.key("default")));
        metaData.set(2, Component.text((char)mouseY).color(color).font(Key.key(font)));
        metaData.set(3, Component.translatable("space." + -sizeX / 2).font(Key.key("default")));
        metaData.set(4, Component.translatable("space." + location.getX()).font(Key.key("default")));
        component = Component.text("").children(metaData);

    }

    protected void updateComponent(String font){

        int mouseY = text + location.getY();

        metaData.set(0, Component.translatable("space." + -location.getX()).font(Key.key("default")));
        metaData.set(1, Component.translatable("space." + -sizeX / 2).font(Key.key("default")));
        metaData.set(2, Component.text((char)mouseY).color(this.color).font(Key.key(font)));
        metaData.set(3, Component.translatable("space." + -sizeX / 2).font(Key.key("default")));
        metaData.set(4, Component.translatable("space." + location.getX()).font(Key.key("default")));
        component = Component.text("").children(metaData);
    }

}
