package org.EternalReturn.ERPlayer;

import org.EternalReturn.ERCharacter.ERCharacter;
import org.EternalReturn.ERCharacter.Event.CharacterAttackEvent;
import org.EternalReturn.ERCharacter.Event.CharacterSwapHandEvent;
import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.System.SystemManager;
import org.bukkit.entity.Entity;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.block.Action;
import org.bukkit.event.entity.EntityDamageByEntityEvent;
import org.bukkit.event.player.*;

import java.security.cert.CertificateParsingException;
import java.util.*;

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

    private static final Set<UUID> apiAttackers = new HashSet<>();

    public static void addAPIAttacker(Player attacker){
        apiAttackers.add(attacker.getUniqueId());
    }

    @EventHandler
    public void onPlayerAttack(EntityDamageByEntityEvent e) {
        if (!(e.getDamager() instanceof Player p)) return;

        if (apiAttackers.remove(p.getUniqueId())) {
            System.out.println("[API DAMAGE] dropped from " + p.getName());
            return;
        }

        ERPlayer erPlayer = SystemManager.getERPlayerHashMap().get(p);
        PluginInstance.getEREngine().submitLeftClickerByEvent(erPlayer);
        erPlayer.getCharacter().submitEvent(new CharacterAttackEvent(erPlayer, e.getEntity()));
    }

    @EventHandler
    public void onPlayerSwap(PlayerSwapHandItemsEvent e){
        ERPlayer erPlayer = SystemManager.getERPlayerHashMap().get(e.getPlayer());
        ERCharacter character = erPlayer.getCharacter();
        character.submitEvent(new CharacterSwapHandEvent(erPlayer));
        e.setCancelled(true);
    }

}
