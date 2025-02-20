package org.EternalReturn.System.ERPlayer;

import org.EternalReturn.Util.Gui.bossbarGui.Model.BossbarGuiFrame;
import org.EternalReturn.Util.ScriptUtill.Script;
import org.EternalReturn.System.SystemManager;
import org.bukkit.entity.Player;

import java.util.HashMap;
import java.util.Set;

public class ERPlayerScript implements Script {
    private HashMap<Player,ERPlayer> erPlayerHashMap;

    public ERPlayerScript(){
        erPlayerHashMap = SystemManager.getInstance().getErPlayerHashMap();
    }

    @Override
    public void update() {

        for(ERPlayer erPlayer : erPlayerHashMap.values()){

            Player p = erPlayer.getPlayer();
            Set<String> tags = p.getScoreboardTags();
            BossbarGuiFrame currentBFrame = erPlayer.getCurrentOpened();

            //보스바 gui 띄우기

            if(currentBFrame == null){
                if(tags.contains("hyperloop")){
                    erPlayer.openHyperloopGui();
                }
                else if(tags.contains("kiosk")){
                    erPlayer.openKioskGui();
                }
            }


            if(currentBFrame != null && currentBFrame.isOpen()){
                if(p.isSneaking()){
                    erPlayer.closeCurrentOpenedGui();
                    if(tags.contains("hyperloop")){
                        tags.remove("hyperloop");
                    }
                    else if(tags.contains("kiosk")){
                        tags.remove("kiosk");
                    }
                }
                else{
                    currentBFrame.updateMouseCursor(erPlayer);
                }
            }


            //보스바 gui업데이트

        }
    }





}
