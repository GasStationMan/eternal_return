package org.EternalReturn.System.ERPlayer;

import org.EternalReturn.System.ERPlayer.Gui.HyperLoopGui;
import org.EternalReturn.System.ERPlayer.Gui.KioskGui;
import org.EternalReturn.System.UpgradeSystem.UpgradeGuiController;
import org.EternalReturn.System.UpgradeSystem.View.UpgradeGui;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BossbarGuiFrame;
import org.EternalReturn.Util.MathVector.Vec2d;
import org.bukkit.entity.Player;


public class ERPlayer {

    private Player player;

    private UpgradeGui upgradeGui;
    private UpgradeGuiController upgradeGuiController;

    private BossbarGuiFrame hyperloopGui;
    private BossbarGuiFrame kioskGui;

    private boolean isHyperloopGuiOpened;
    private boolean isKioskGuiOpened;

    private Vec2d rot2dVecX;
    private Vec2d rot2dVecY;
    private boolean directionRotY;

    public void free(){
        upgradeGuiController.free();
        hyperloopGui.free();
        kioskGui.free();
        upgradeGui.free();
        
        upgradeGuiController = null;
        hyperloopGui = null;
        kioskGui = null;
        upgradeGui = null;
        player = null;
    }

    public ERPlayer(Player p){
        player = p;
        directionRotY = true;
        rot2dVecX = new Vec2d(Math.cos(0),Math.sin(0));
        rot2dVecY = new Vec2d(Math.cos(0),Math.sin(0));

        upgradeGui = new UpgradeGui(this);
        upgradeGuiController = new UpgradeGuiController(upgradeGui);

        kioskGui = new KioskGui(this);
        hyperloopGui = new HyperLoopGui(this);

        isHyperloopGuiOpened = false;
    }

    //getter
    public Player getPlayer() {
        return player;
    }

    public BossbarGuiFrame getHyperloop(){
        return hyperloopGui;
    }

    public BossbarGuiFrame getKioskGui(){
        return kioskGui;
    }

    public boolean isHyperloopGuiOpened(){
        return isHyperloopGuiOpened;
    }

    public boolean isKioskGuiOpened() {
        return isKioskGuiOpened;
    }

    public UpgradeGuiController getUpgradeGuiController(){
        return upgradeGuiController;
    }

    public Vec2d getRot2dVecX(){
        return rot2dVecX;
    }

    public Vec2d getRot2dVecY(){
        return rot2dVecY;
    }

    /**
     * true == 양의 방향 (+) , false == 음의 방향 (-)
     * */
    public boolean getDirectionRotY(){
        return directionRotY;
    }

    //setter
    public UpgradeGui getUpgradeGui() {
        return upgradeGui;
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

    /**
     * true == 양의 방향 (+) , false == 음의 방향 (-)
     * */
    public void setDirectionRotY(boolean direction){
        directionRotY = direction;
    }

    public void changeDirectionRotY() {
        directionRotY = !directionRotY;
    }

    //controller
    public void openHyperloopGui(){
        isHyperloopGuiOpened = true;
        hyperloopGui.open();
    }

    public void closeHyperloopGui(){
        isHyperloopGuiOpened = false;
        hyperloopGui.close();
    }

    public void openKioskGui(){
        isKioskGuiOpened = true;
        kioskGui.open();
    }

    public void closeKioskGui(){
        isKioskGuiOpened = false;
        kioskGui.close();
    }

    public void sendMessage(String str) {
        player.sendMessage(str);
    }



}
