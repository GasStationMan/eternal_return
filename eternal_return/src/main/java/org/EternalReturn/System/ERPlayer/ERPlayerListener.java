package org.EternalReturn.System.ERPlayer;

import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.System.SystemManager;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BButton;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BossbarGuiFrame;
import org.bukkit.Bukkit;
import org.bukkit.Sound;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.block.Action;
import org.bukkit.event.inventory.InventoryOpenEvent;
import org.bukkit.event.player.PlayerInteractEvent;
import org.bukkit.event.player.PlayerJoinEvent;
import org.bukkit.event.player.PlayerQuitEvent;

import java.util.HashMap;

public class ERPlayerListener implements Listener {
    private SystemManager systemManager;
    private HashMap<Player,ERPlayer> playerHashMap;

    public ERPlayerListener(SystemManager manager) {
        this.systemManager = manager;
        this.playerHashMap = systemManager.getErPlayerHashMap();
    }

    @EventHandler
    public void onPlayerInteraction(PlayerInteractEvent e){

        //플레이어가
        Action action = e.getAction();
        Player p = e.getPlayer();
        if(action.equals(Action.LEFT_CLICK_AIR) || action.equals(Action.LEFT_CLICK_BLOCK)){
            ERPlayer erPlayer = playerHashMap.get(p);
            BossbarGuiFrame guiFrame = erPlayer.getCurrentOpened();
            
            //열린 상황이 아니라면
            BButton selectedButton = null;
            if(guiFrame == null
                    || (selectedButton = guiFrame.getCurrentButtonUnderCursor()) == null){
                return;
            }
            p.playSound(p.getLocation(), Sound.BLOCK_AMETHYST_BLOCK_BREAK, 1.0F, 1.0F);
            p.sendMessage(selectedButton.getBButton());
            //p. selectedButton.getBButton();

        }
    }

    @EventHandler
    public void onPlayerJoin(PlayerJoinEvent e){
        Player p = e.getPlayer();
        systemManager.addPlayer(p);
        System.out.println("플레이어가 업데이트되었습니다. : ");
        p.sendMessage("당신이 리스트에 추가되었습니다.");
    }

    @EventHandler
    public void onPlayerLeave(PlayerQuitEvent e){
        Player p = e.getPlayer();
        systemManager.removePlayer(p);
        System.out.println("플레이어가 업데이트되었습니다. : ");
        p.sendMessage("플레이어가 게임을 떠났습니다.");
    }

}
