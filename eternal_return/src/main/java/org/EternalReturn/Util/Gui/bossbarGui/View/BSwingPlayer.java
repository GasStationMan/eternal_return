package org.EternalReturn.Util.Gui.bossbarGui.View;

import org.EternalReturn.Util.Geometry.MathVector.Vec2d;
import org.bukkit.entity.Player;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * */
public class BSwingPlayer {
    private Player player;
    private BComponentManager opened;
    private List<BComponent> interactionList = new ArrayList<>();

    private Vec2d rot2dVecX; //끄덕끄덕 -> xAxis
    private Vec2d rot2dVecY; //도리도리 -> yAxis

    public BSwingPlayer(Player p){
        this.player = p;
        this.rot2dVecX = new Vec2d(Math.cos(0), Math.sin(0));
        this.rot2dVecY = new Vec2d(Math.cos(0), Math.sin(0));
    }

    public Vec2d getRot2dVecX(){
        return rot2dVecX;
    }

    public Vec2d getRot2dVecY(){
        return rot2dVecY;
    }

    public Player getPlayer() {
        return player;
    }

    public BComponentManager opened(){
        return this.opened;
    }

    public void setRot2dVecX(double x, double y){
        rot2dVecX.set(x, y);
    }

    public void setRot2dVecX(Vec2d vector){
        rot2dVecX = vector;
    }

    public void setRot2dVecY(double x, double y){
        rot2dVecY.set(x, y);
    }

    public void setRot2dVecY(Vec2d vector){
        rot2dVecY = vector;
    }
}
