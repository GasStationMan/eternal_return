package org.EternalReturn.System.ERPlayer;

import org.EternalReturn.System.ERPlayer.Gui.Bossbars.RumiaIsland.extRumiaIslandGui.HyperLoopGui;
import org.EternalReturn.System.ERPlayer.Gui.Bossbars.Kiosk.KioskGui;
import org.EternalReturn.System.ERPlayer.Gui.Bossbars.RumiaIsland.extRumiaIslandGui.ResurrectionGui;
import org.EternalReturn.System.ERPlayer.Gui.Bossbars.RumiaIsland.extRumiaIslandHud.RumiaMapHud;
import org.EternalReturn.System.ERPlayer.Gui.Inventory.UpgradeSystem.UpgradeGuiController;
import org.EternalReturn.System.ERPlayer.Gui.Inventory.UpgradeSystem.View.UpgradeGui;
import org.EternalReturn.System.ERPlayer.Skill.Mukbo;
import org.EternalReturn.System.ERPlayer.Skill.Skill;
import org.EternalReturn.Util.Gui.InventoryGui.View.IController;
import org.EternalReturn.Util.Gui.bossbarGui.View.BFrame;
import org.EternalReturn.Util.Physics.MathVector.Vec2d;
import org.EternalReturn.Util.Physics.MotionManager;
import org.bukkit.entity.Player;

public class ERPlayer {

    private Player player;

    private UpgradeGui upgradeGui;
    private IController upgradeGuiController;

    private BFrame currentOpened;
    private BFrame hyperloopGui;
    private BFrame resurrectionGui;
    private BFrame kioskGui;
    private BFrame rumiaMapHud;

    private MotionManager motionManager;

    private Vec2d rot2dVecX;
    private Vec2d rot2dVecY;

    private Skill mukbo;

    public void free(){
        upgradeGuiController.free();
        resurrectionGui.free();
        hyperloopGui.free();
        kioskGui.free();
        rumiaMapHud.free();
        upgradeGui.free();
        motionManager.free();
        mukbo.free();

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

        upgradeGui = new UpgradeGui(p);
        upgradeGuiController = new UpgradeGuiController(this, upgradeGui);

        motionManager = new MotionManager(p);

        kioskGui = new KioskGui(this, "kiosk");
        hyperloopGui = new HyperLoopGui(this, "hyperloop");
        rumiaMapHud = new RumiaMapHud(this, "rumiaMap");
        resurrectionGui = new ResurrectionGui(this, "resurrection");

        mukbo = new Mukbo(this);
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

    public IController getUpgradeGuiController(){
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

    public Skill getSkill(){
        return mukbo;
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

    /**
     * 대상 객체 : ERPlayer <br>
     * 반환 : 열려있는 해당 GUI의 이름 (String) <br>
     * 역할 : 열려있는 해당 GUI를 닫고, 해당 GUI의 이름을 반환함.
     * */
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
