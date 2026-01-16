package org.EternalReturn.System

import org.EternalReturn.System.ERAnimalSystem.ERAnimalManager;
import org.EternalReturn.ERAnimal.ERAnimal
import org.EternalReturn.ERPlayer.ERPlayer

class EREngine : DPEngine() {


    override fun forRightClickers(erPlayer : ERPlayer) {

        // animal.json 기반 추가된 야생동물들 관리.
        for(animal in ERAnimalManager.getERAnimalList()){
            if(rayCheckWithERAnimal(erPlayer, animal)){
                animal.setHit();
                erPlayer.sendMessage("hit!");
                break;
            }
        }

        //좌클릭 대상이 플레이어인지 아닌지 체크
        for(victimPlayer : ERPlayer in SystemManager.getERPlayerList()){
            if(victimPlayer == erPlayer){ //포인터 비교로 일단 퉁칠거임
                continue;
            }

            //광선 - 충돌체 체크
            if(rayCheckWithERPlayer(erPlayer, victimPlayer)){

            }
        }
    }

    override fun erPlayerTick(erPlayer: ERPlayer) {
        val p = erPlayer.player;
        val tags = p.scoreboardTags;
        erPlayer.skill.update();
        erPlayer.motionManager.update(erPlayer, tags);

        if(erPlayer.character == null){
            return;
        }

        erPlayer.character.script();
    }

    override fun erAnimalTick(animal: ERAnimal) {
        if(animal.actor.passengers.isEmpty()){
            animal.actor.addPassenger(animal.rootEntity);
        }
        animal.script();
    }
}