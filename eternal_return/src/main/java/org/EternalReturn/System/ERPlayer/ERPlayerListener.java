package org.EternalReturn.System.ERPlayer;

import org.EternalReturn.System.ERPlayer.Gui.Bossbars.RumiaIsland.extBComponent.HBButton;
import org.EternalReturn.System.SystemManager;
import org.EternalReturn.Util.Gui.bossbarGui.View.BButton;
import org.EternalReturn.Util.Gui.bossbarGui.View.BFrame;
import org.bukkit.Sound;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.block.Action;
import org.bukkit.event.player.PlayerInteractEvent;
import org.bukkit.event.player.PlayerJoinEvent;
import org.bukkit.event.player.PlayerQuitEvent;

import java.util.HashMap;
import java.util.Set;

public class ERPlayerListener implements Listener {
    private SystemManager systemManager;
    private HashMap<Player,ERPlayer> playerHashMap;

    public ERPlayerListener(SystemManager manager) {
        this.systemManager = manager;
        this.playerHashMap = SystemManager.getERPlayerHashMap();
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
