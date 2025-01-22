package eternal_return.system.guiGenerator;


import eternal_return.system.ERPlayer.ERPlayer;
import eternal_return.system.SystemManager;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.inventory.InventoryClickEvent;
import org.bukkit.event.inventory.InventoryCloseEvent;
import org.bukkit.inventory.Inventory;

public class GuiListener implements Listener {

    @EventHandler
    public void guiClickEvent(InventoryClickEvent e){

        if(!(e.getWhoClicked() instanceof Player)){
            return;
        }

        Player p = (Player)e.getWhoClicked();
        ERPlayer erPlayer = SystemManager.getInstance().getERPlayer(p);

        Inventory clickedInventory = erPlayer.getInventory();
        
        //upgradeGui 기능 호출
        if(e.getClickedInventory() == clickedInventory){
            erPlayer.upgradeGuiFunction(e);
        }

    }

    @EventHandler
    public void guiClickEvent(InventoryCloseEvent e){

        Player p = (Player)e.getPlayer();
        ERPlayer erPlayer = SystemManager.getInstance().getERPlayer(p);
        if(erPlayer == null){
            return;
        }

        if(erPlayer.isOpenUpgradeGui()){
            erPlayer.updateUpgradeGuiWhenClose();
        }

    }

}
