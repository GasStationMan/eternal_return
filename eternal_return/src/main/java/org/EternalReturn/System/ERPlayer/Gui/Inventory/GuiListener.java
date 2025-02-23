package org.EternalReturn.System.ERPlayer.Gui.Inventory;

import org.EternalReturn.System.ERPlayer.ERPlayer;
import org.EternalReturn.System.SystemManager;
import org.EternalReturn.Util.Gui.Inventory.GuiController;
import org.EternalReturn.Util.Gui.Inventory.InventoryGui.GuiPos;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.inventory.InventoryClickEvent;
import org.bukkit.event.inventory.InventoryCloseEvent;
import org.bukkit.inventory.Inventory;

import java.util.HashMap;


public class GuiListener implements Listener {

    private final HashMap<Player, ERPlayer> playerHashMap;

    public GuiListener(SystemManager systemManager){
        playerHashMap = systemManager.getErPlayerHashMap();
    }

    @EventHandler
    public void guiCloseEvent(InventoryCloseEvent e){
        ERPlayer erPlayer = playerHashMap.get((Player)e.getPlayer());
        if(erPlayer == null){
            return;
        }
        GuiController controller = erPlayer.getUpgradeGuiController();
        if(controller.isOpen()){
            controller.whenClose();
        }
    }

    @EventHandler
    public void guiClickEvent(InventoryClickEvent e){
        Player p = (Player)e.getWhoClicked();
        ERPlayer erPlayer = playerHashMap.get(p);

        Inventory clickedGui = e.getClickedInventory();

        if(clickedGui == null){
            return;
        }

        int clickedIndex = e.getSlot();
        GuiController controller = erPlayer.getUpgradeGuiController();
        GuiPos pos = new GuiPos();

        //클릭한 위치가 본인 인벤토리 위 (1,4)위치인 경우.
        pos.setPos(0,1);
        if(clickedGui.equals(p.getInventory()) && clickedIndex == pos.toIndex()){
            e.setCancelled(true);
            if(!controller.isOpen()){
                controller.openGui();
            }
            else{
                controller.closeGui();
            }
        }
        //클릭한 위치가 업그레이드 gui인 경우
        else if(clickedGui.equals(controller.getGui())){
            controller.doEvent(pos, e);
        }
    }
}
