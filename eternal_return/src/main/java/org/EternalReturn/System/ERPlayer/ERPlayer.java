package org.EternalReturn.System.ERPlayer;

import org.EternalReturn.System.Gui.Control.UpgradeGuiController;
import org.EternalReturn.System.Gui.View.UpgradeGui;
import org.EternalReturn.Util.bossbarHud.BossbarHud;
import org.bukkit.entity.Player;


public class ERPlayer {

    private final Player player;

    private final UpgradeGui upgradeGui;
    private final UpgradeGuiController upgradeGuiController;

    private final BossbarHud hyperloopGui;

    private boolean isHyperloopGuiOpened;

    public ERPlayer(Player p){
        player = p;

        upgradeGui = new UpgradeGui(this);
        upgradeGuiController = new UpgradeGuiController(upgradeGui);

        hyperloopGui = new BossbarHud(p);
        isHyperloopGuiOpened = false;
    }

    //getter
    public Player getPlayer() {
        return player;
    }

    public BossbarHud getHyperloop(){
        return hyperloopGui;
    }

    public boolean isHyperloopGuiOpened(){
        return isHyperloopGuiOpened;
    }

    public UpgradeGuiController getUpgradeGuiController(){
        return upgradeGuiController;
    }


    //setter
    public void openHyperloopGui(){
        isHyperloopGuiOpened = true;
        hyperloopGui.open();
    }

    public void sendMessage(String str) {
        player.sendMessage(str);
    }

    public void free(){
        upgradeGuiController.free();
        hyperloopGui.free();
        upgradeGui.free();
    }

    public UpgradeGui getUpgradeGui() {
        return upgradeGui;
    }
}
