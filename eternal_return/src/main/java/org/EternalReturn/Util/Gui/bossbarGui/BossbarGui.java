package org.EternalReturn.Util.Gui.bossbarGui;

import org.EternalReturn.System.ERPlayer.ERPlayer;
import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.Util.MathVector.Vec2d;
import org.bukkit.Location;
import org.bukkit.entity.Player;

import net.kyori.adventure.audience.Audience;
import net.kyori.adventure.bossbar.BossBar;
import net.kyori.adventure.text.Component;

import java.util.ArrayList;
import java.util.List;

public class BossbarGui {

    private BossBar bufferShower;
    private Audience audience;
    private List<Component> components;
    private List<BComponent> bComponents;
    private List<BButton> bButtons;
    private Player player;
    private ERPlayer erPlayer;
    private BComponent cursor;
    private boolean isOpen;

    public void free() {
        for(BComponent bcmp : bComponents){
            bcmp.free();
        }
        components.clear();
        bComponents.clear();
        bButtons.clear();
        components = null;
        bComponents = null;
        bufferShower = null;
        audience = null;
        player = null;
        erPlayer = null;
        cursor = null;
    }

    public BossbarGui(ERPlayer erPlayer){
        this.player = erPlayer.getPlayer();
        this.erPlayer = erPlayer;
        this.isOpen = false;
        this.components = new ArrayList<>(16);
        this.bComponents = new ArrayList<>(16);
        this.bButtons = new ArrayList<>(16);
        this.audience = PluginInstance.adventure().player(player);

    }

    //getter
    public BGuiLocation getMousePointerLocation(){
        return cursor.getLocation();
    }

    public List<BButton> getBButtons(){
        return bButtons;
    }

    //setter
    public void generate(){
        convBcomponentsToComponents();
        Component buffer = Component.text("").children(components);
        this.bufferShower = BossBar.bossBar(buffer,0, BossBar.Color.BLUE, BossBar.Overlay.PROGRESS);
    }

    public void add(BComponent bComponent){
        bComponents.add(bComponent);
        if(bComponent instanceof BButton){
            bButtons.add((BButton)bComponent);
        }
    }

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

    public void moveMousePointer(int dx, int dy){
        BGuiLocation loc = cursor.getLocation();
        Location pLoc = player.getLocation();

        int xToModify = loc.getX() + dx;
        int yToModify = loc.getY() - dy / 2;


        if((-350 <= xToModify && xToModify <= 350) && (40 <= yToModify && yToModify <= 400)){

            erPlayer.sendMessage("( " + xToModify + " , " + yToModify + " )");

            cursor.setLocation(xToModify,yToModify);
            convBcomponentsToComponents();
            bufferShower.name(Component.text("").children(components));
        }
    }

    protected void setMouseCursor(BComponent mouseCursor){
        this.cursor = mouseCursor;
    }

    public void open() {
        isOpen = true;
        bufferShower.addViewer(audience);
    }

    public void close(){
        erPlayer.setRot2dVecX(new Vec2d(Math.cos(0),Math.sin(0)));
        erPlayer.setRot2dVecY(new Vec2d(Math.cos(0),Math.sin(0)));
        isOpen = false;
        bufferShower.removeViewer(audience);
    }

    public boolean isOpen() {
        return isOpen;
    }



}
