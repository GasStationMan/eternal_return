package org.EternalReturn.System.ERAnimal;

import org.EternalReturn.System.ERPlayer.ERPlayer;
import org.EternalReturn.Util.Physics.Geometry.Cylinder;
import org.EternalReturn.Util.Physics.Geometry.InfStraightLine;
import org.bukkit.Location;
import org.jetbrains.annotations.NotNull;

import java.util.List;

public class Alpha extends ERAnimal{


    public Alpha(@NotNull Location position) {
        super("animal_alpha",
                new Cylinder(
                    new InfStraightLine(0,1,0, position.getX(), position.getY(), position.getZ()),
                        1,
                        3
                ));

        registerAnimation("ready",2.0d);
        registerAnimation("attack",2.3d);
        registerAnimation("move",3.5d);
        registerAnimation("skill",3.25d);
        registerAnimation("death",2.0d);

    }
    

    /**
     * 캐싱 상황까지 고려하여 플레이어 리스트를 뽑아냄
     * */
    @Override
    protected void script() {

        List<ERPlayer> list = getPlayersInRange(5.0);

        if(list.isEmpty()){
            return;
        }

        if(isHit()) {
            scriptAfterHit();
            return;
        }

        playAnim("ready");

    }

    private void scriptAfterHit(){

    }

}
