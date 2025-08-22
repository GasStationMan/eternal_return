package org.EternalReturn.Util.Gui.bossbarGui.View;

import net.kyori.adventure.key.Key;
import net.kyori.adventure.text.Component;
import net.kyori.adventure.text.TranslatableComponent;
import net.kyori.adventure.text.format.TextColor;
import net.kyori.adventure.text.serializer.gson.GsonComponentSerializer;
import net.kyori.adventure.text.serializer.json.JSONComponentSerializer;
import net.kyori.adventure.translation.Translatable;
import org.intellij.lang.annotations.Subst;

import java.util.ArrayList;
import java.util.List;

public class BFontComponent extends BComponent{

    protected int sizeX;
    protected int sizeY;
    protected char text;
    protected String font;
    protected Component component;
    protected TextColor color;

    public void free(){
        super.free();
        font = null;
        component = null;
        location = null;
        color = null;
    }
    /**
     * BButton, BImage의 틀이 되어 기본 메소드들을 제공하는 클래스
     * @param sizeX     : font가 가리키는 이미지의 공백을 제거한 x픽셀 수
     * @param sizeY     : font가 가리키는 이미지의 y픽셀 수
     * @param font      : 리소스팩의 font의 위치
     * @param location  : BComponent의 위치 정보를 담는 객체
     * */
    public BFontComponent(int sizeX, int sizeY, String font, BLocation location){
        super(location);
        this.sizeX = sizeX;
        this.sizeY = sizeY;
        this.text = '\u1000';
        this.font = font;
        this.location = location;
        this.color = TextColor.color(0xffffff);


        int mouseY = text + location.getY();
        component = makeComponentWith(mouseY, this.font);

    }

    private String space(int space){
        return "space." + space;
    }

    /**
     * Kyori text component를 최종적으로 만들어낸다.<br>
     * 이는 bossbar에 표시하기 위한 요소 중 하나이다.<br>
     * getComponent() 메소드로 얻어올 수 있다.
     * */
    private Component makeComponentWith(int mouseY, String font){
        List<Component> children = new ArrayList<>(5);
        children.add(Component.translatable(space(-location.getX())));
        children.add(Component.translatable(space(-sizeX / 2)));
        children.add(Component.text((char)mouseY).font(Key.key(font)));
        children.add(Component.translatable(space(-sizeX / 2)));
        children.add(Component.translatable(space(location.getX())));
        return Component.empty().children(children);
    }

    private Component makeComponentWith(int mouseY, String font, TextColor color){
        List<Component> children = new ArrayList<>(5);
        children.add(Component.translatable(space(-location.getX())));
        children.add(Component.translatable(space(-sizeX / 2)));
        children.add(Component.text((char)mouseY).font(Key.key(font)).color(color));
        children.add(Component.translatable(space(-sizeX / 2)));
        children.add(Component.translatable(space(location.getX())));
        return Component.empty().children(children);
    }

    //getter
    public Component getComponent(){
        return component;
    }

    public float getSizeX() {
        return sizeX;
    }

    public float getSizeY() {
        return sizeY;
    }

    //setter
    public void setLocation(int x, int y){
        super.setLocation(x,y);
        updateComponent();
    }

    //updater
    protected void updateComponent(){
        int mouseY = text + location.getY();
        component = makeComponentWith(mouseY, this.font);
    }

    protected void updateComponent(TextColor color){
        int mouseY = text + location.getY();
        this.color = color;
        component = makeComponentWith(mouseY, this.font, this.color);
    }

    protected void updateComponent(String font){
        int mouseY = text + location.getY();
        component = makeComponentWith(mouseY, font);
    }

}
