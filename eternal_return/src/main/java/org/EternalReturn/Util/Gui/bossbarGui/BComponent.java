package org.EternalReturn.Util.Gui.bossbarGui;

import net.kyori.adventure.key.Key;
import net.kyori.adventure.text.Component;

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

    public void free(){
        font = null;
        component = null;
        metaData.clear();
        location = null;
    }

    public BComponent(int sizeX, int sizeY, String font, BGuiLocation location){
        this.sizeX = sizeX;
        this.sizeY = sizeY;
        this.text = '\u1000';
        this.font = font;
        this.location = location;

        //int mouseY = text + location.getY() - 25; //왜 25가 차이나는 지는 모르겠음... 으아아아


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

    public int getSizeX() {
        return sizeX;
    }

    public int getSizeY() {
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

    private void updateComponent(){

        int mouseY = text + location.getY();

        metaData.set(0, Component.translatable("space." + -location.getX()).font(Key.key("default")));
        metaData.set(1, Component.translatable("space." + -sizeX / 2).font(Key.key("default")));
        metaData.set(2, Component.text((char)mouseY).font(Key.key(font)));
        metaData.set(3, Component.translatable("space." + -sizeX / 2).font(Key.key("default")));
        metaData.set(4, Component.translatable("space." + location.getX()).font(Key.key("default")));
        component = Component.text("").children(metaData);
    }

}
