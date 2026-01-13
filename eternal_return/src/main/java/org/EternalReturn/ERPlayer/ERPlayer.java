package org.EternalReturn.ERPlayer;

import org.EternalReturn.ERCharacter.ERCharacter;
import org.EternalReturn.ERPlayer.Gui.Inventory.UpgradeSystem.UpgradeGuiController;
import org.EternalReturn.ERPlayer.Gui.Inventory.UpgradeSystem.View.UpgradeGui;
import org.EternalReturn.ERPlayer.Skill.Mukbo;
import org.EternalReturn.ERPlayer.Skill.Skill;
import org.EternalReturn.Util.Gui.InventoryGui.View.IController;
import org.EternalReturn.Util.physics.MathVector.Vec3d;
import org.EternalReturn.Util.physics.MotionManager;
import org.bukkit.entity.Player;

public class ERPlayer {

    private Player player;

    private UpgradeGui upgradeGui;
    private IController upgradeGuiController;
    private ERCharacter character;

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

    public ERCharacter getCharacter(){
        return this.character;
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

    public void setCharacter(ERCharacter character){
        this.character = character;
    }

}
