package org.EternalReturn.System.ERPlayer;

import org.EternalReturn.Util.Gui.bossbarGui.Model.BossbarGuiFrame;
import org.EternalReturn.Util.MathVector.Vec2d;
import org.EternalReturn.Util.ScriptUtill.Script;
import org.EternalReturn.System.SystemManager;
import org.bukkit.Location;
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
            Location location = null;

            //보스바 gui업데이트
            if(erPlayer.isKioskGuiOpened()){
                erPlayer.getKioskGui().updateMouseCursor(erPlayer);
            }
            else if(erPlayer.isHyperloopGuiOpened()){
                erPlayer.getHyperloopGui().updateMouseCursor(erPlayer);
            }
        }
    }





}
