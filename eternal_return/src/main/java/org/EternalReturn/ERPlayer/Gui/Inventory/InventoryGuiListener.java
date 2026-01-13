package org.EternalReturn.ERPlayer.Gui.Inventory;

import org.EternalReturn.ERPlayer.ERPlayer;
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


public class InventoryGuiListener implements Listener {

    @EventHandler public void guiCloseEvent(InventoryCloseEvent e){
        ERPlayer erPlayer = SystemManager.getERPlayerHashMap().get((Player)e.getPlayer());
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
        ERPlayer erPlayer = SystemManager.getERPlayerHashMap().get(p);

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
