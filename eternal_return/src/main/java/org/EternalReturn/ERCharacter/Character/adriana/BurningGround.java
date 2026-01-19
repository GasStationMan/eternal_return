package org.EternalReturn.ERCharacter.Character.adriana;

import org.EternalReturn.ERCharacter.ERCharacter;
import org.EternalReturn.ERCharacter.ERCharacterMonobehaviour;
import org.EternalReturn.ERCharacter.Event.CharacterSwapHandEvent;
import org.EternalReturn.ERPlayer.ERPlayer;
import org.EternalReturn.Util.Behaviour.MonobehaviourEvent;
import org.bukkit.Location;
import org.bukkit.Particle;
import org.bukkit.entity.Entity;
import org.bukkit.entity.LivingEntity;
import org.bukkit.entity.Player;
import org.bukkit.util.Vector;

import java.util.LinkedList;
import java.util.List;


class BurningGroundVirtualEntity {
    public Player caster;
    public Location location;
    public long startTime;
    public boolean remove = false;
    public BurningGroundVirtualEntity(Player caster, Location location, long startTime){
        this.caster = caster; this.location = location; this.startTime = startTime; this.remove = false;
    }

    public void update(){

        Location loc = this.location;
        Player caster = this.caster;

        long lifeTime = this.startTime - System.currentTimeMillis();

        loc.getWorld().spawnParticle(Particle.FLAME, loc, 3, 0.2, 0.1, 0.2, 0.02);
        if (lifeTime % 5 == 0) {
            loc.getWorld().spawnParticle(Particle.SMOKE, loc, 1, 0.1, 0.1, 0.1, 0.02);
        }

        // 데미지 판정: 주변 1.2칸 내의 적에게 화상
        for (Entity entity : loc.getWorld().getNearbyEntities(loc, 1.2, 1.2, 1.2)) {
            if (entity instanceof LivingEntity target && !target.equals(caster)) {
                target.setFireTicks(100); // 2초간 불타게 함
            }
        }
    }

}

public class BurningGround extends ERCharacterMonobehaviour<CharacterSwapHandEvent> {

    long skillActiveTick = 0;

    @Override
    public void start(CharacterSwapHandEvent event) {
        // 1. 플레이어가 바라보는 방향 가져오기

        Player player = event.player.getPlayer();
        Vector direction = player.getLocation().getDirection();

        // 2. Y축(상하) 값을 0으로 고정 (정면 돌진)
        direction.setY(0);

        // 3. 방향 벡터를 정규화(길이를 1로 만듦)하여 일정한 속도 유지
        if (direction.length() > 0) direction.normalize();

        // 4. 속도 곱하기 (1.5 정도가 약 5칸 돌진에 적당함)
        player.setVelocity(direction.multiply(1.5));

        player.sendMessage("§8[Adriana] §f급속 돌진!");

        this.skillActiveTick = System.currentTimeMillis();
    }

    private LinkedList<BurningGroundVirtualEntity> burningGroundVirtualEntityList = new LinkedList<>();

    @Override
    public void update(List<MonobehaviourEvent> event) {

        ERPlayer erPlayer = ((ERCharacter)getActor()).getERPlayer();

        LinkedList<BurningGroundVirtualEntity> newBGList = new LinkedList<>();

        while(!burningGroundVirtualEntityList.isEmpty()){
            BurningGroundVirtualEntity burningGroundVirtualEntity = burningGroundVirtualEntityList.removeFirst();
            burningGroundVirtualEntity.update(); //업데이트
            if(isNotEnd(burningGroundVirtualEntity.startTime, 60)){
                newBGList.add(burningGroundVirtualEntity); //아직 시간이 남았다면 넣기
            }
            //시간이 다 끝났다면 버리기
        }
        burningGroundVirtualEntityList = newBGList; //갱신

        if(isNotEnd(skillActiveTick, 10)){
            // 현재 플레이어의 발밑 위치에 '지속되는 불길' 생성
            createBurningGround(erPlayer.getPlayer(), erPlayer.getPlayer().getLocation());
        }
    }

    private void createBurningGround(Player caster, Location loc) {
        burningGroundVirtualEntityList.add(new BurningGroundVirtualEntity(caster, loc, System.currentTimeMillis()));
    }
}

