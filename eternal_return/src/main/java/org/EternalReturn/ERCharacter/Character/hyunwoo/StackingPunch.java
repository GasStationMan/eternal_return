package org.EternalReturn.ERCharacter.Character.hyunwoo;

import org.EternalReturn.ERCharacter.ERCharacterMonobehaviour;
import org.EternalReturn.ERCharacter.Event.CharacterAttackEvent;
import org.EternalReturn.util.dpengine.behaviour.MonobehaviourEvent;
import org.bukkit.Sound;
import org.bukkit.entity.Entity;
import org.bukkit.entity.LivingEntity;
import org.bukkit.entity.Player;

import java.util.*;

public class StackingPunch extends ERCharacterMonobehaviour<CharacterAttackEvent> {

    private final Map<UUID, Integer> hitCountMap = new HashMap<>();
    private long punchTimeMillis = 0;

    @Override
    public void start(CharacterAttackEvent event) {
        Entity victimEntity = event.victim.getEntity();

        if(!(victimEntity instanceof LivingEntity victim)){
            return;
        }

        if(System.currentTimeMillis() < punchTimeMillis){
            return;
        }
        punchTimeMillis = System.currentTimeMillis() + 10 * 50;

        Player attacker = getPlayer();

        UUID uuid = attacker.getUniqueId();
        // 현재 공격 횟수를 가져오고 1을 더함
        int count = hitCountMap.getOrDefault(uuid, 0) + 1;

        if (count >= 5) {
            // 5회 타격 시 체력 3 회복 (2가 하트 1칸이므로 3은 하트 1.5칸)
            double health = attacker.getHealth() + 3;
            // 최대 체력을 넘지 않도록 설정
            double maxHealth = attacker.getAttribute(org.bukkit.attribute.Attribute.MAX_HEALTH).getValue();
            attacker.setHealth(Math.min(health, maxHealth));

            attacker.sendMessage("§b[현우] §f패시브 발동! 체력을 회복했습니다.");
            attacker.playSound(attacker.getLocation(), Sound.ENTITY_PLAYER_LEVELUP, 1f, 2f);

            // 카운트 초기화
            hitCountMap.put(uuid, 0);
        } else {
            hitCountMap.put(uuid, count);
            // 진행 상황 알림 (선택 사항)
            attacker.sendMessage("§7[현우] §f도그파이트: " + count + "/5");
        }
    }

    @Override
    public void update(Collection<MonobehaviourEvent> event) {
        stopMonobehav();
    }
}
