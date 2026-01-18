package org.EternalReturn.System;

import org.EternalReturn.ERAnimal.ERAJEntity;
import org.EternalReturn.ERPlayer.ERPlayer;
import org.EternalReturn.ERAnimal.ERAnimalManager;
import org.bukkit.entity.Player;

import java.util.Set;

public class EREngine extends DPEngine {



    @Override
    public void update(){

        for(ERPlayer erPlayer : SystemManager.getERPlayerHashMap().values()){
            Player p = erPlayer.getPlayer();
            Set<String> tags = p.getScoreboardTags();

            erPlayer.getSkill().update();
            erPlayer.getMotionManager().update(erPlayer, tags);
        }

        
        ERAnimalManager.update(64);
    }

}