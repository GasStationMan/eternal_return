package org.EternalReturn.System.ERPlayer;

import org.EternalReturn.System.HyperLoopSystem.HyperLoopGui;
import org.EternalReturn.System.KioskSystem.KioskGui;
import org.EternalReturn.System.UpgradeSystem.UpgradeGuiController;
import org.EternalReturn.System.UpgradeSystem.View.UpgradeGui;
import org.EternalReturn.Util.Gui.bossbarGui.BossbarGui;
import org.bukkit.entity.Player;


public class ERPlayer {

    private final Player player;

    private final UpgradeGui upgradeGui;
    private final UpgradeGuiController upgradeGuiController;

    private final BossbarGui hyperloopGui;
    private final BossbarGui kioskGui;

    private boolean isHyperloopGuiOpened;
    private boolean isKioskGuiOpened;

    public ERPlayer(Player p){
        player = p;

        upgradeGui = new UpgradeGui(this);
        upgradeGuiController = new UpgradeGuiController(upgradeGui);

        kioskGui = new KioskGui(p);
        hyperloopGui = new HyperLoopGui(p);
        isHyperloopGuiOpened = false;
    }

    //getter
    public Player getPlayer() {
        return player;
    }

    public BossbarGui getHyperloop(){
        return hyperloopGui;
    }

    public BossbarGui getKioskGui(){
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

    //setter
    public UpgradeGui getUpgradeGui() {
        return upgradeGui;
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

    public void free(){
        upgradeGuiController.free();
        hyperloopGui.free();
        kioskGui.free();
        upgradeGui.free();
    }


}
