package org.EternalReturn.Util.Gui.bossbarGui;

import net.kyori.adventure.key.Key;
import net.kyori.adventure.text.Component;

import java.util.ArrayList;
import java.util.List;

public class BButton implements BComponent {

    private int sizeX;
    private int sizeY;
    private char text;
    private String font;
    private Component component;
    private List<Component> metaData;
    private BGuiLocation location;

    private List<BButtonDot> buttonPolygon;

    public BButton(int sizeX, int sizeY, char text, String font, BGuiLocation location){
        this.sizeX = sizeX;
        this.sizeY = sizeY;
        this.text = text;
        this.font = font;
        this.location = location;
        this.buttonPolygon = null;

        int mouseY = text;
        int y = location.getY();
        mouseY += 256 * (y/100);
        y %= 100;
        mouseY += 16 * (y/10);
        y %= 10;
        mouseY += y;
        System.out.println(mouseY);

        List<Component> children = new ArrayList<>(5);
        children.add(Component.translatable("space." + -location.getX()).font(Key.key("default")));
        children.add(Component.translatable("space." + -sizeX / 2).font(Key.key("default")));
        children.add(Component.text((char)mouseY).font(Key.key(font)));
        children.add(Component.translatable("space." + -sizeX / 2).font(Key.key("default")));
        children.add(Component.translatable("space." + location.getX()).font(Key.key("default")));

        component = Component.text("").children(children);
        metaData = children;
    }

    public void setButtonPolygon(BButtonDot[] dots){
        buttonPolygon = new ArrayList<>(List.of(dots));
    }

    public void setButtonPolygonAsRect(int width, int height){
        buttonPolygon = new ArrayList<>(4);

        int posX = location.getX();
        int posY = location.getY();

        buttonPolygon.add(new BButtonDot(posX - width/2, posY - height/2));
        buttonPolygon.add(new BButtonDot(posX + width/2, posY - height/2));
        buttonPolygon.add(new BButtonDot(posX + width/2, posY + height/2));
        buttonPolygon.add(new BButtonDot(posX - width/2, posY + height/2));
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

        int mouseY = text;
        int y = location.getY();
        mouseY += 256 * (y/100);
        y %= 100;
        mouseY += 16 * (y/10);
        y %= 10;
        mouseY += y;

        metaData.set(0, Component.translatable("space." + -location.getX()).font(Key.key("default")));
        metaData.set(1, Component.translatable("space." + -sizeX / 2).font(Key.key("default")));
        metaData.set(2, Component.text((char)mouseY).font(Key.key(font)));
        metaData.set(3, Component.translatable("space." + -sizeX / 2).font(Key.key("default")));
        metaData.set(4, Component.translatable("space." + location.getX()).font(Key.key("default")));
        component = Component.text("").children(metaData);
    }

}
