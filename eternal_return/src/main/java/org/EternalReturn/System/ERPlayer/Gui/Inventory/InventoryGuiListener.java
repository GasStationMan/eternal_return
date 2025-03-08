package org.EternalReturn.System.ERPlayer.Gui.Inventory;

import org.EternalReturn.System.ERPlayer.ERPlayer;
import org.EternalReturn.System.SystemManager;
import org.EternalReturn.Util.Gui.InventoryGui.IGuiController;
import org.EternalReturn.Util.Gui.InventoryGui.View.GuiPos;
import org.EternalReturn.Util.Gui.InventoryGui.View.IController;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.inventory.InventoryClickEvent;
import org.bukkit.event.inventory.InventoryCloseEvent;
import org.bukkit.inventory.Inventory;

import java.util.HashMap;


public class InventoryGuiListener implements Listener {

    private final HashMap<Player, ERPlayer> playerHashMap;

    public InventoryGuiListener(SystemManager systemManager){
        playerHashMap = systemManager.getErPlayerHashMap();
    }

    @EventHandler public void guiCloseEvent(InventoryCloseEvent e){
        ERPlayer erPlayer = playerHashMap.get((Player)e.getPlayer());
        if(erPlayer == null){
            return;
        }
        IGuiController controller = erPlayer.getUpgradeGuiController();
        if(controller.isOpen()){
            controller.whenClose();
        }
    }

    @EventHandler public void guiClickEvent(InventoryClickEvent e){
        Player p = (Player)e.getWhoClicked();
        ERPlayer erPlayer = playerHashMap.get(p);

        Inventory clickedGui = e.getClickedInventory();

        if(clickedGui == null){
            return;
        }

        IController controller = erPlayer.getUpgradeGuiController();
        GuiPos pos = new GuiPos(e.getSlot());



        if(clickedGui.equals(p.getInventory()) && pos.equals(0,1)){
            e.setCancelled(true);
            if(controller.isOpen()){
                controller.closeGui();
            }
            else{
                controller.openGui();
            }

        }
        else if(clickedGui.equals(controller.getGui())){ //클릭한 위치가 업그레이드 gui인 경우
            controller.doEvent(pos, e);
        }
    }
}
