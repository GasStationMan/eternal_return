package org.EternalReturn.Util.Gui.bossbarGui;

import net.kyori.adventure.key.Key;
import net.kyori.adventure.text.Component;

import java.util.ArrayList;
import java.util.List;

public class BImage implements BComponent {

    private int sizeX;
    private int sizeY;
    private char text;
    private String font;
    private Component component;
    private List<Component> metaData;
    private BGuiLocation location;

    public BImage(int sizeX, int sizeY, String font, BGuiLocation location){
        this.sizeX = sizeX;
        this.sizeY = sizeY;
        this.text = '\u1000';
        this.font = font;
        this.location = location;

        int mouseY = text + location.getY();

        List<Component> children = new ArrayList<>(5);
        children.add(Component.translatable("space." + -location.getX()).font(Key.key("default")));
        children.add(Component.translatable("space." + -sizeX / 2).font(Key.key("default")));
        children.add(Component.text((char)mouseY).font(Key.key(font)));
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
