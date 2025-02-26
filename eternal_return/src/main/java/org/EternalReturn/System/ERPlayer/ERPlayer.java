package org.EternalReturn.System.ERPlayer;

import org.EternalReturn.System.ERPlayer.Gui.Bossbars.RumiaIsland.extendsRumiaIslandGui.HyperLoopGui;
import org.EternalReturn.System.ERPlayer.Gui.Bossbars.Kiosk.KioskGui;
import org.EternalReturn.System.ERPlayer.Gui.Bossbars.RumiaIsland.extendsRumiaIslandHud.RumiaMap;
import org.EternalReturn.System.ERPlayer.Gui.Bossbars.RumiaIsland.extendsRumiaIslandGui.ResurrectionGui;
import org.EternalReturn.System.ERPlayer.Gui.Inventory.UpgradeSystem.UpgradeGuiController;
import org.EternalReturn.System.ERPlayer.Gui.Inventory.UpgradeSystem.View.UpgradeGui;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BFrame;
import org.EternalReturn.Util.Physics.MathVector.Vec2d;
import org.EternalReturn.Util.Physics.MotionManager;
import org.bukkit.entity.Player;

public class ERPlayer {

    private Player player;

    private UpgradeGui upgradeGui;
    private UpgradeGuiController upgradeGuiController;

    private BFrame currentOpened;
    private BFrame hyperloopGui;
    private BFrame resurrectionGui;
    private BFrame kioskGui;
    private BFrame rumiaMapHud;

    private MotionManager motionManager;

    private Vec2d rot2dVecX;
    private Vec2d rot2dVecY;

    //먹보효과 -> 나중에 가능하면 class로 따로 빼야 함.
    private long mukboActivatedTime;

    public void free(){
        upgradeGuiController.free();
        resurrectionGui.free();
        hyperloopGui.free();
        kioskGui.free();
        rumiaMapHud.free();
        upgradeGui.free();
        motionManager.free();
        
        upgradeGuiController = null;
        resurrectionGui = null;
        hyperloopGui = null;
        kioskGui = null;
        upgradeGui = null;
        player = null;
        rumiaMapHud = null;
        motionManager = null;
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
        rumiaMapHud = new RumiaMap(this, "rumiaMap");
        resurrectionGui = new ResurrectionGui(this, "resurrection");

        mukboActivatedTime = System.currentTimeMillis();
    }

    //getter
    public Player getPlayer() {
        return player;
    }

    public BFrame getHyperloopGui(){
        return hyperloopGui;
    }

    public BFrame getKioskGui(){
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

    public BFrame getCurrentOpened(){
        return currentOpened;
    }

    public MotionManager getMotionManager(){
        return motionManager;
    }

    public long getMukboActivatedTime(){
        return mukboActivatedTime;
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

    public void setCurrentOpened(BFrame currentOpened){
        this.currentOpened = currentOpened;
    }

    public void setMukboActivatedTime(long coolTime){
        this.mukboActivatedTime = System.currentTimeMillis() + coolTime;
    }

    //controller
    public void openHyperloopGui(){
        currentOpened = hyperloopGui;
        hyperloopGui.open();
    }

    public void openKioskGui(){
        currentOpened = kioskGui;
        kioskGui.open();
    }

    public void openRumiaMapHud(){
        currentOpened = rumiaMapHud;
        rumiaMapHud.open();
    }

    public void openResurrectionGui(){
        currentOpened = resurrectionGui;
        resurrectionGui.open();
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
