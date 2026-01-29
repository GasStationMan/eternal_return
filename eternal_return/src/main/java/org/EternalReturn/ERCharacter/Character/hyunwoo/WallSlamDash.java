package org.EternalReturn.ERCharacter.Character.hyunwoo;

import org.EternalReturn.ERCharacter.Event.CharacterAttackEvent;
import org.EternalReturn.ERCharacter.Event.CharacterStunEvent;
import org.EternalReturn.ERCharacter.Event.CharacterSwapHandEvent;
import org.EternalReturn.ERCharacter.ERCharacterMonobehaviour;
import org.EternalReturn.ERPlayer.ERPlayer;
import org.EternalReturn.System.SystemManager;
import org.EternalReturn.Util.DPEngine.behaviour.MonobehaviourEvent;
import org.bukkit.Location;
import org.bukkit.Particle;
import org.bukkit.Sound;
import org.bukkit.entity.Entity;
import org.bukkit.entity.LivingEntity;
import org.bukkit.entity.Player;
import org.bukkit.util.RayTraceResult;
import org.bukkit.util.Vector;
import org.jetbrains.annotations.NotNull;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class WallSlamDash extends ERCharacterMonobehaviour<CharacterSwapHandEvent> {

    long skillActiveTick = 0;
    Vector direction = null;
    HashMap<LivingEntity, Integer> hitEntities;
    private boolean isWallSlam;
    // 기절한 엔티티와 그들의 고정 위치, 남은 시간을 저장
    private final Map<LivingEntity, Location> stunnedVictims = new HashMap<>();
    private int stunTimer = 0;

    @Override
    public void start(@NotNull CharacterSwapHandEvent event) {
        Player player = getPlayer();
        if (!player.isOnGround() || player.getLocation().add(0, -0.5, 0).getBlock().getType().isAir()) {
            player.sendMessage("§c[현우] §f지상에서만 사용할 수 있습니다.");
            player.playSound(player.getLocation(), Sound.ENTITY_VILLAGER_NO, 1f, 1f);
            return;
        }

        this.hitEntities = new HashMap<>();
        // 시선과 무관하게 수평 방향 벡터로 고정 (y=0)
        this.direction = player.getLocation().getDirection().setY(0).normalize().multiply(1);
        this.skillActiveTick = System.currentTimeMillis();
        this.isWallSlam = false;
    }

    @Override
    public void update(Collection<MonobehaviourEvent> event) {
        // 벽꿍이 안 터졌고 10틱(0.5초) 이내일 때만 실행
        if (!isWallSlam && isNotEnd(skillActiveTick, 6)) {
            Player player = getPlayer();

            // 1. 돌진 물리 적용
            Vector curVelocity = player.getVelocity();
            direction.setY(curVelocity.getY());
            player.setVelocity(direction);

            // 2. 주변 적 감지
            for (Entity entity : player.getNearbyEntities(0.8, 0.8, 0.8)) {
                if (entity instanceof LivingEntity victim && !entity.equals(getERPlayer())) {
                    hitEntities.putIfAbsent(victim, 0);
                }
            }

            // 3. 피해 및 패시브(도그파이트) 연동
            for (LivingEntity victim : hitEntities.keySet()) {
                if (hitEntities.get(victim) == 0) {
                    hitEntities.put(victim, 1);

                    // [해결] 제공해주신 생성자 구조 (ERPlayer, Entity)에 정확히 맞춘 코드입니다.
                    // getERCharacter()를 통해 시스템에 이벤트를 제출합니다.
                    getERCharacter().submitEvent(new CharacterAttackEvent(getERPlayer(), victim));
                    damage(getPlayer(), victim, 2.0);
                }
                // 적을 플레이어 속도에 맞춰 밀어냄
                victim.setVelocity(direction.clone().multiply(1.2));
            }

            // 4. [중요] 수정된 레이캐스팅 벽꿍 판정
            // 시작점: 플레이어 발 위치(getLocation)에서 배 높이(0.8) 정도 위
            Location startRay = player.getLocation().add(0, 0.8, 0);
            // 방향: 시선이 아닌, 이미 계산된 수평 돌진 방향(direction) 사용
            Vector rayDir = direction.clone().normalize();

            // 1.2칸 앞의 블록 탐색 (거리가 너무 짧으면 인식이 안 됨)
            RayTraceResult result = player.getWorld().rayTraceBlocks(startRay, rayDir, 1.2);

            if (result != null && result.getHitBlock() != null) {
                isWallSlam = true;
                handleWallSlamSuccess(player);
            }
        }
        if (isWallSlam && stunTimer < 40) { // 40틱 동안 유지
            stunTimer++;

            for (Map.Entry<LivingEntity, Location> entry : stunnedVictims.entrySet()) {
                LivingEntity victim = entry.getKey();
                Location loc = entry.getValue();

                if (victim.isValid()) {
                    // 위치 고정 및 파티클 생성
                    victim.teleport(loc);
                    victim.getWorld().spawnParticle(Particle.ELECTRIC_SPARK, loc.clone().add(0, 1, 0), 3, 0.3, 0.3, 0.3, 0.05);
                }
            }
        } else if (stunTimer >= 40) {
            // [핵심] 40틱이 지나 기절이 끝나면 상태를 초기화하여 재사용 가능하게 함
            isWallSlam = false;
            stunTimer = 0;
            stunnedVictims.clear();
            hitEntities.clear(); // 다음 돌진을 위해 타격 리스트도 비워줌
        }
    }

    private void handleWallSlamSuccess(Player player) {
        for (LivingEntity victim : hitEntities.keySet()) {
            // 1. 도그파이트 패시브를 위한 공격 이벤트
            getERCharacter().submitEvent(new CharacterAttackEvent(getERPlayer(), victim));
            damage(getPlayer(), victim, 10.0);

            // 2. [변경] 상대방에게 스턴 이벤트 전달
            // 상대방의 ERPlayer 객체를 가져와서 해당 캐릭터 시스템에 이벤트를 던집니다.
            ERPlayer victimERPlayer = SystemManager.getERPlayer((Player) victim);
            if (victimERPlayer != null) {
                // 40틱(2초) 동안 지속되는 스턴 이벤트 제출
                victimERPlayer.getCharacter().submitEvent(new CharacterStunEvent(40));
            }

            player.sendMessage("§b[현우] §f벽꿍 성공!");
            player.playSound(player.getLocation(), Sound.ENTITY_ZOMBIE_ATTACK_IRON_DOOR, 1f, 1f);
        }
    }

    // 요청하신 구조 그대로 유지 (1회성 텔레포트 및 파티클)
//    private void applyStun(LivingEntity victim, int ticks) {
//        Location stunLocation = victim.getLocation();
//
//        int elapsed = 0;
//        if (elapsed++ >= ticks || !victim.isValid()) {
//            return;
//        }
//
//        victim.teleport(stunLocation);
//
//        victim.getWorld().spawnParticle(
//                Particle.ELECTRIC_SPARK,
//                stunLocation.clone().add(0, 1, 0), 5, 0.5, 0.5, 0.5, 0.05
//        );
//
//        victim.getWorld().spawnParticle(Particle.ELECTRIC_SPARK, victim.getEyeLocation(), 5, 0.5, 0.5, 0.5, 0.05);
//    }
}