package org.EternalReturn.ERCharacter.Character.hyunwoo;

import org.EternalReturn.ERCharacter.Event.CharacterSwapHandEvent;
import org.EternalReturn.ERCharacter.util.ERMonobehaviour;
import org.bukkit.Location;
import org.bukkit.Particle;
import org.bukkit.Sound;
import org.bukkit.entity.Entity;
import org.bukkit.entity.LivingEntity;
import org.bukkit.entity.Player;
import org.bukkit.util.Vector;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

public class WallSlamDash extends ERMonobehaviour<CharacterSwapHandEvent> {


    long skillActiveTick = 0;
    Vector direction = null;
    Set<UUID> hitEntities; // 한 번의 돌진에 중복 타격 방지

    @Override
    public void start(CharacterSwapHandEvent event) {
        Player player = getPlayer();
        this.hitEntities = new HashSet<>();
        this.direction = player.getLocation().getDirection(); // 돌진 속도
        this.direction.setY(0).normalize().multiply(1);
        this.skillActiveTick = System.currentTimeMillis();

    }

    @Override
    public void update() {
        if(isNotEnd(skillActiveTick, 10)){
            Player player = getPlayer();
            // 플레이어 돌진
            Vector curVelocity = player.getVelocity();
            direction.setY(curVelocity.getY());
            player.setVelocity(direction);

            // 주변 적 감지
            for (Entity entity : player.getNearbyEntities(1.5, 1.5, 1.5)) {
                if (entity instanceof LivingEntity victim && !entity.equals(getERPlayer())) {
                    if (hitEntities.contains(victim.getUniqueId())) {
                        continue;
                    }

                    hitEntities.add(victim.getUniqueId());
                    handleWallSlam(player, victim, direction);
                    return;
                }
            }
        }
    }

    private void handleWallSlam(Player attacker, LivingEntity victim, Vector direction) {
        // 적을 뒤로 밀쳐냄
        Vector knockback = direction.clone().normalize().multiply(1.2).setY(0.2);
        victim.setVelocity(knockback);

        // 0.2초 후 벽 충돌 체크 (밀려난 직후 위치 확인)
        Location loc = victim.getLocation().add(direction.clone().normalize().multiply(1.0));
        if (loc.getBlock().getType().isSolid()) {
            // 벽에 부딪힘 (벽꿍 성공)
            damage(attacker,victim,5.0); // 추가 피해 (하트 2.5칸)
            applyStun(victim, 40); // 1초(20틱) 기절
            attacker.sendMessage("§b[현우] §f벽꿍 성공!");
            attacker.playSound(attacker.getLocation(), Sound.ENTITY_ZOMBIE_ATTACK_IRON_DOOR, 1f, 1f);
        } else {
            // 일반 충돌
            damage(attacker,victim,2.0); // 추가 피해 (하트 2.5칸)
        }
    }

    private void applyStun(LivingEntity victim, int ticks) {
        Location stunLocation = victim.getLocation();

        int elapsed = 0;
        // 기절 시간이 끝났거나 대상이 사라지면 중단
        if (elapsed++ >= ticks || !victim.isValid()) {
            return;
        }

        // 1. 위치 고정 (텔레포트)
        victim.teleport(stunLocation);

        // 2. 파티클 생성 (커맨드: electric_spark ~ ~1 ~ 0.5 0.5 0.5 0.05 5)
        // location: 대상의 위치에서 y축으로 1칸 위 (머리 부분)
        // count: 5개
        // offset (0.5, 0.5, 0.5): 파티클이 퍼지는 범위
        // extra (0.05): 파티클의 속도
        victim.getWorld().spawnParticle(
                Particle.ELECTRIC_SPARK,
                stunLocation.clone().add(0, 1, 0),5,0.5, 0.5, 0.5, 0.05
        );

        // 시각적 효과 (기절 입자)
        victim.getWorld().spawnParticle(Particle.ELECTRIC_SPARK, victim.getEyeLocation(), 5, 0.5, 0.5, 0.5, 0.05);
    }

}
