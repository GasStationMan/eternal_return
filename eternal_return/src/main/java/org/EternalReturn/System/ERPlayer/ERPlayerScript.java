package org.EternalReturn.System.ERPlayer;

import org.EternalReturn.Util.ScriptUtill.Script;
import org.EternalReturn.System.SystemManager;
import org.bukkit.entity.Player;

import java.util.HashMap;

public class ERPlayerScript implements Script {
    private HashMap<Player,ERPlayer> erPlayerHashMap;

    public ERPlayerScript(){
        erPlayerHashMap = SystemManager.getInstance().getErPlayerHashMap();
    }

    @Override
    public void update() {

        for(ERPlayer erPlayer : erPlayerHashMap.values()){

            Player p = erPlayer.getPlayer();

            //보스바 gui업데이트
            if(erPlayer.isHyperloopGuiOpened()){
                erPlayer.getHyperloop().moveCursorPoint(
                        (int)(p.getLocation().getYaw() * 2),
                        (int)(p.getLocation().getPitch() * 2)
                );


            }
        }
    }
}
