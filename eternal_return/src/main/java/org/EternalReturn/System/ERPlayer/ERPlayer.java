package org.EternalReturn.System.ERPlayer;

import org.EternalReturn.System.ERPlayer.Gui.Bossbars.HyperLoopGui;
import org.EternalReturn.System.ERPlayer.Gui.Bossbars.KioskGui;
import org.EternalReturn.System.UpgradeSystem.UpgradeGuiController;
import org.EternalReturn.System.UpgradeSystem.View.UpgradeGui;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BossbarGuiFrame;
import org.EternalReturn.Util.Physics.MathVector.Vec2d;
import org.EternalReturn.Util.Physics.MathVector.Vec3d;
import org.EternalReturn.Util.Physics.MotionManager;
import org.bukkit.entity.Player;
import org.bukkit.util.Vector;

public class ERPlayer {

    private Player player;

    private UpgradeGui upgradeGui;
    private UpgradeGuiController upgradeGuiController;

    private BossbarGuiFrame currentOpened;
    private BossbarGuiFrame hyperloopGui;
    private BossbarGuiFrame kioskGui;

    private MotionManager motionManager;

    private Vec2d rot2dVecX;
    private Vec2d rot2dVecY;

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
        rot2dVecX = new Vec2d(Math.cos(0),Math.sin(0));
        rot2dVecY = new Vec2d(Math.cos(0),Math.sin(0));

        upgradeGui = new UpgradeGui(this);
        upgradeGuiController = new UpgradeGuiController(upgradeGui);

        motionManager = new MotionManager(p);

        kioskGui = new KioskGui(this, "kiosk");
        hyperloopGui = new HyperLoopGui(this, "hyperloop");

    }

    //getter
    public Player getPlayer() {
        return player;
    }

    public BossbarGuiFrame getHyperloopGui(){
        return hyperloopGui;
    }

    public BossbarGuiFrame getKioskGui(){
        return kioskGui;
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

    public BossbarGuiFrame getCurrentOpened(){
        return currentOpened;
    }

    public MotionManager getMotionManager(){
        return motionManager;
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

    public void setCurrentOpened(BossbarGuiFrame currentOpened){
        this.currentOpened = currentOpened;
    }

    /**
     * true == 양의 방향 (+) , false == 음의 방향 (-)
     * */

    //controller
    public void openHyperloopGui(){
        currentOpened = hyperloopGui;
        hyperloopGui.open();
    }

    public void openKioskGui(){
        currentOpened = kioskGui;
        kioskGui.open();
    }

    public String closeCurrentOpenedGui(){
        currentOpened.close();
        String guiName = currentOpened.getName();
        currentOpened = null;
        return guiName;
    }

    public void sendMessage(String str) {
        player.sendMessage(str);
    }



}
