package org.EternalReturn.ERPlayer;

import org.EternalReturn.ERCharacter.ERCharacter;
import org.EternalReturn.ERCharacter.Event.*;
import org.EternalReturn.EREntity.EREntity;
import org.EternalReturn.EREntity.Event.EREntityDamagedEvent;
import org.EternalReturn.System.EREngine;
import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.System.SystemManager;
import org.bukkit.entity.Entity;
import org.bukkit.entity.Husk;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.block.Action;
import org.bukkit.event.entity.EntityDamageByEntityEvent;
import org.bukkit.event.entity.EntityDeathEvent;
import org.bukkit.event.player.*;

import java.util.*;

public class ERPlayerListener implements Listener {

    @EventHandler
    public void onPlayerJoin(PlayerJoinEvent e){
        Player p = e.getPlayer();
        SystemManager.addPlayer(p);
        System.out.println("플레이어가 업데이트되었습니다. : " + p);
        //p.sendMessage("당신이 리스트에 추가되었습니다.");
    }

    @EventHandler
    public void onPlayerLeave(PlayerQuitEvent e){
        Player p = e.getPlayer();
        SystemManager.removePlayer(p);
        System.out.println("플레이어가 업데이트되었습니다. : " + p);
        //p.sendMessage("플레이어가 게임을 떠났습니다.");
    }

    @EventHandler
    public void onPlayerInteraction(PlayerInteractEvent e){
        Action action = e.getAction();
        if(action.equals(Action.LEFT_CLICK_AIR) || action.equals(Action.LEFT_CLICK_BLOCK)){
            ERPlayer erPlayer = SystemManager.getERPlayerHashMap().get(e.getPlayer());
            ERCharacter character = erPlayer.getCharacter();
            character.submitEvent(new CharacterLeftClickEvent());
        }
    }

    private static final Set<UUID> apiAttackers = new HashSet<>();

    public static void addAPIAttacker(Player attacker){
        apiAttackers.add(attacker.getUniqueId());
    }

    @EventHandler
    public void onPlayerAttack(EntityDamageByEntityEvent e) {

        if (!(e.getDamager() instanceof Player p)) return;

        ERPlayer erPlayer = SystemManager.getERPlayerHashMap().get(p);
        ERCharacter character = erPlayer.getCharacter();

        if(e.getEntity() instanceof Husk){
            character.submitEvent(new CharacterLeftClickEvent());
        }

        EREntity victim = PluginInstance.getEREngine().getEREntity(e.getEntity());

        if(victim == null){
            return;
        }

        victim.submitEvent(new EREntityDamagedEvent());

        /// LivingEntity.damage() 함수로 피해를 준 경우에 제외
        if (apiAttackers.remove(p.getUniqueId())) {
            System.out.println("[API DAMAGE] dropped from " + p.getName());
            return;
        }

        character.submitEvent(new CharacterLeftClickEvent());
    }

    @EventHandler
    public void onPlayerSwap(PlayerSwapHandItemsEvent e){
        ERPlayer erPlayer = SystemManager.getERPlayerHashMap().get(e.getPlayer());
        ERCharacter character = erPlayer.getCharacter();
        character.submitEvent(new CharacterSwapHandEvent(erPlayer));
        e.setCancelled(true);
    }

    @EventHandler
    public void onKill(EntityDeathEvent e){
        Entity killer = e.getDamageSource().getCausingEntity();
        Entity victim = e.getEntity();

        EREntity erVictim = PluginInstance.getEREngine().getEREntity(victim);
        if(killer == null){
            return;
        }

        EREntity erKiller = PluginInstance.getEREngine().getEREntity(killer);
        if(erKiller == null){
            return;
        }

        erKiller.submitEvent(new CharacterKillEvent());

    }

}
