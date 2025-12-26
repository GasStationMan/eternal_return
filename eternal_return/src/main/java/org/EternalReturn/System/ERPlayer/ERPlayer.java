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
import org.EternalReturn.Util.Physics.MathVector.Vec3d;
import org.EternalReturn.Util.Physics.MotionManager;
import org.bukkit.entity.Player;

public class ERPlayer {

    private Player player;

    private UpgradeGui upgradeGui;
    private IController upgradeGuiController;


    private MotionManager motionManager;

    private Skill mukbo;

    public void free(){
        upgradeGuiController.free();
        upgradeGui.free();
        motionManager.free();
        mukbo.free();

        upgradeGuiController = null;
        upgradeGui = null;
        player = null;
        motionManager = null;

    }

    public ERPlayer(Player p){
        player = p;
        upgradeGui = new UpgradeGui(p);
        upgradeGuiController = new UpgradeGuiController(this, upgradeGui);
        motionManager = new MotionManager(p);
        mukbo = new Mukbo(this);
    }

    //getter
    public Player getPlayer() {
        return player;
    }

    public IController getUpgradeGuiController(){
        return upgradeGuiController;
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

    public void sendMessage(String str) {
        player.sendMessage(str);
    }

    public Vec3d getPos(){
        return new Vec3d(player.getLocation());
    }


}
