package org.EternalReturn.System.ERPlayer;

import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BossbarGuiFrame;
import org.EternalReturn.Util.Physics.MotionManager;
import org.EternalReturn.Util.ScriptUtill.Script;
import org.EternalReturn.System.SystemManager;
import org.bukkit.Bukkit;
import org.bukkit.World;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Entity;
import org.bukkit.entity.Marker;
import org.bukkit.entity.Player;
import org.bukkit.plugin.Plugin;
import org.bukkit.scoreboard.Scoreboard;
import org.bukkit.scoreboard.ScoreboardManager;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

public class ERPlayerScript implements Script {
    private HashMap<Player,ERPlayer> erPlayerHashMap;
    private List<Marker> markerList;
    private Plugin pluginInstance;
    private World currentWorld;

    public void free(){
        erPlayerHashMap = null;
        markerList.clear();
        markerList = null;
        pluginInstance = null;
        currentWorld = null;
    }

    public ERPlayerScript(){
        erPlayerHashMap = SystemManager.getInstance().getErPlayerHashMap();
        pluginInstance = PluginInstance.getServerInstance();
        markerList = new ArrayList<>();
        currentWorld = null;
    }

    @Override
    public void update() {

        for(ERPlayer erPlayer : erPlayerHashMap.values()){
            Player p = erPlayer.getPlayer();
            if(currentWorld == null){
                getMarkerEntityList(p);
            }
            else{
                erPlayerScript(erPlayer,p);
            }
        }
    }

    private void getMarkerEntityList(Player p){
        currentWorld = p.getWorld();
        List<Entity> entityList = currentWorld.getEntities();
        for(Entity entity : entityList){
            if(entity instanceof Marker){
                markerList.add((Marker)entity);
            }
        }
    }

    private void erPlayerScript(ERPlayer erPlayer, Player p){
        Set<String> tags = p.getScoreboardTags();
        BossbarGuiFrame currentBFrame = erPlayer.getCurrentOpened();
        MotionManager motionManager = erPlayer.getMotionManager();

        //보스바 gui 띄우기
        if(currentBFrame == null){
            if(tags.contains("hyperloop")){
                erPlayer.openHyperloopGui();
            }
            else if(tags.contains("kiosk")){
                erPlayer.openKioskGui();
            }
        }
        
        //보스바 gui 닫기
        if(currentBFrame != null && currentBFrame.isOpen()){
            if(p.isSneaking()){
                tags.remove(erPlayer.closeCurrentOpenedGui());
            }
            else{
                currentBFrame.updateMouseCursor(erPlayer);
            }
        }

        //parabola_x0_y0_z0_x1_y1_z1
        if(tags.contains("vector")){
            vectorTagFunction(tags,erPlayer);
        }

        if(!motionManager.getMotionIsDone()){
            motionManager.updateParabolicMotion();
        }
    }

    private void vectorTagFunction(Set<String> tags, ERPlayer erPlayer){
        MotionManager motionManager = erPlayer.getMotionManager();

        for(String tag : tags){
            try{
                if(tag.startsWith("parabola_")){
                    String[] args = tag.split("_");

                    motionManager.setParabolicInitMotion(
                            Double.parseDouble(args[4]) - Double.parseDouble(args[1]),
                            Double.parseDouble(args[5]) - Double.parseDouble(args[2]),
                            Double.parseDouble(args[6]) - Double.parseDouble(args[3]),
                            10.0
                    );
                    tags.remove(tag);
                    break;
                }
                else if(tag.startsWith("motion_")){
                    String[] args = tag.split("_");

                    motionManager.setMotion(
                            Double.parseDouble(args[1]),
                            Double.parseDouble(args[2]),
                            Double.parseDouble(args[3])
                    );
                    tags.remove(tag);
                    break;
                }
            }
            catch (NumberFormatException e){
                PluginInstance.getServerInstance().getLogger().info("잘못된 태그가 들어갔습니다.");
                e.printStackTrace();
            }
        }
    }
}
