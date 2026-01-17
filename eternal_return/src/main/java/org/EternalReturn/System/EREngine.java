package org.EternalReturn.System;

import org.EternalReturn.ERAnimal.ERAnimal;
import org.EternalReturn.ERPlayer.ERPlayer;
import org.EternalReturn.System.ERAnimalSystem.ERAnimalManager;
import org.bukkit.entity.Player;

import java.util.Set;

public class EREngine extends DPEngine {

    @Override
    public void forRightClickers(ERPlayer erPlayer) {

        // animal.json 기반 추가된 야생동물들 관리.
        for (ERAnimal animal : ERAnimalManager.getERAnimalList()) {
            if (rayCheckWithERAnimal(erPlayer, animal)) {
                animal.setHit();
                erPlayer.sendMessage("hit!");
                break;
            }
        }

        // 좌클릭 대상이 플레이어인지 아닌지 체크
        for (ERPlayer victimPlayer : SystemManager.getERPlayerList()) {
            if (victimPlayer == erPlayer) { // 포인터 비교
                continue;
            }

            // 광선 - 충돌체 체크
            if (rayCheckWithERPlayer(erPlayer, victimPlayer)) {
                // TODO: 플레이어 피격 처리
            }
        }
    }

    @Override
    public void erPlayerTick(ERPlayer erPlayer) {
        Player p = erPlayer.getPlayer();
        Set<String> tags = p.getScoreboardTags();

        erPlayer.getSkill().update();
        erPlayer.getMotionManager().update(erPlayer, tags);

        //여기서 NPE 자주 터지던 그 부분
        if (erPlayer.getCharacter() != null) {
            erPlayer.getCharacter().tick();
        }
    }

    @Override
    public void erAnimalTick(ERAnimal animal) {
        if (animal.getActor().getPassengers().isEmpty()) {
            animal.getActor().addPassenger(animal.getRootEntity());
        }
        animal.script();
    }
}