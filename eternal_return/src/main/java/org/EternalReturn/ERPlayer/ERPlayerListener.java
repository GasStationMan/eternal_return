package org.EternalReturn.ERPlayer;

import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.System.SystemManager;
import org.bukkit.entity.Entity;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.block.Action;
import org.bukkit.event.entity.EntityDamageByEntityEvent;
import org.bukkit.event.player.*;

public class ERPlayerListener implements Listener {

    @EventHandler
    public void onPlayerJoin(PlayerJoinEvent e){
        Player p = e.getPlayer();
        SystemManager.addPlayer(p);
        System.out.println("플레이어가 업데이트되었습니다. : ");
        p.sendMessage("당신이 리스트에 추가되었습니다.");
    }

    @EventHandler
    public void onPlayerLeave(PlayerQuitEvent e){
        Player p = e.getPlayer();
        SystemManager.removePlayer(p);
        System.out.println("플레이어가 업데이트되었습니다. : ");
        p.sendMessage("플레이어가 게임을 떠났습니다.");
    }

    @EventHandler
    public void onPlayerInteraction(PlayerInteractEvent e){
        Action action = e.getAction();
        if(action.equals(Action.LEFT_CLICK_AIR) || action.equals(Action.LEFT_CLICK_BLOCK)){
            ERPlayer erPlayer = SystemManager.getERPlayerHashMap().get(e.getPlayer());
            PluginInstance.getEREngine().submitLeftClickerByEvent(erPlayer);
        }
    }

    @EventHandler
    public void onPlayerAttack(EntityDamageByEntityEvent e) {
        Entity damager = e.getDamager();
        if (damager instanceof Player) {
            ERPlayer erPlayer = SystemManager.getERPlayerHashMap().get(damager);
            PluginInstance.getEREngine().submitLeftClickerByEvent(erPlayer);
        }
    }

}
