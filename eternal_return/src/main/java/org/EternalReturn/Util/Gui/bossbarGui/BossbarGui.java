package org.EternalReturn.Util.Gui.bossbarGui;

import org.EternalReturn.System.PluginInstance;
import net.kyori.adventure.audience.Audience;
import net.kyori.adventure.bossbar.BossBar;
import org.bukkit.entity.Player;

import net.kyori.adventure.text.Component;

import java.util.ArrayList;
import java.util.List;

public class BossbarGui {

    private BossBar bufferShower;
    private final Audience audience;
    private List<Component> components;
    private List<BComponent> bComponents;
    private boolean isOpen;
    private final Player player;
    private BComponent cursor;


    protected static final String space = "space.";

    public BossbarGui(Player p){

        this.player = p;

        this.isOpen = false;
        this.components = new ArrayList<>(64);
        this.bComponents = new ArrayList<>(64);
        this.audience = PluginInstance.adventure().player(p);

    }

    public void generate(){
        convBcomponentsToComponents();
        Component buffer = Component.text("").children(components);
        this.bufferShower = BossBar.bossBar(buffer,0, BossBar.Color.BLUE, BossBar.Overlay.PROGRESS);
    }

    public void add(BComponent bComponent){
        bComponents.add(bComponent);
    }

    //이 메소드는 이 클래스를 상속시킨 자식 클래스에서 내용을 채워넣어야 함.


    private void convBcomponentsToComponents(){
        int length = bComponents.size();

        //널체크 + 비우기
        if(components != null){
            components.clear();
        }

        components = new ArrayList<>(64);

        for(int i = 0 ; i < length ; i ++){
            components.add(bComponents.get(i).getComponent());
        }

    }

    public void moveMousePointer(int x, int y){
        cursor.setLocation(-x,y + 50);
        convBcomponentsToComponents();
        bufferShower.name(Component.text("").children(components));
    }

    protected void setMouseCursor(BComponent mouseCursor){
        this.cursor = mouseCursor;
    }

    public void open() {
        isOpen = true;
        bufferShower.addViewer(audience);
    }

    public void close(){
        isOpen = false;
        bufferShower.removeViewer(audience);
    }

    public boolean isOpen() {
        return isOpen;
    }

    public void free() {
        components.clear();
        bComponents.clear();
    }

}
