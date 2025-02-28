package org.EternalReturn.System.ERPlayer;

import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BFrame;
import org.EternalReturn.Util.Physics.MotionManager;
import org.EternalReturn.Util.ScriptUtill.Script;
import org.EternalReturn.System.SystemManager;
import org.EternalReturn.Util.itemUtill.CMDManager;
import org.bukkit.Material;
import org.bukkit.World;
import org.bukkit.entity.Entity;
import org.bukkit.entity.Marker;
import org.bukkit.entity.Player;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.ItemStack;
import org.bukkit.plugin.Plugin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

public class ERPlayerScript implements Script {
    private HashMap<Player,ERPlayer> erPlayerHashMap;
    private List<Marker> markerList;
    private Plugin pluginInstance;
    private World currentWorld;
    private CMDManager cmdManager;

    public void free(){
        erPlayerHashMap = null;
        markerList.clear();
        markerList = null;
        pluginInstance = null;
        currentWorld = null;
        cmdManager = SystemManager.getCmdManager();
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
            erPlayerScript(erPlayer,p);
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

        //if(erPlayer.getMukboActivatedTime() <= System.currentTimeMillis()){
        //    mukboFunction(erPlayer, p, p.getAttribute(Attribute.MAX_HEALTH).getBaseValue(), p.getHealth());
        //}

        bossbarGuiUpdate(p,erPlayer,tags);
        motionManagerUpdate(erPlayer,tags);

    }

    private void upgradeArmorWearingUpdate(){

    }

    private void bossbarGuiUpdate(Player p, ERPlayer erPlayer, Set<String> tags){

        BFrame currentBFrame = erPlayer.getCurrentOpened();
        //보스바 gui 띄우기
        if(currentBFrame == null){
            if(tags.contains(SystemManager.USE_HYPERLOOP)){
                erPlayer.openHyperloopGui();
            }
            else if(tags.contains(SystemManager.USE_KIOSK)){
                erPlayer.openKioskGui();
            }
        }

        //보스바 gui 닫기
        if(currentBFrame != null && currentBFrame.isOpen()){
            if(p.isSneaking()
                    || !(tags.contains(SystemManager.USE_HYPERLOOP) || (tags.contains(SystemManager.USE_KIOSK)))){
                tags.remove("use_" + erPlayer.closeCurrentOpenedGui());
            }
            else{
                currentBFrame.updateMouseCursor(erPlayer);
            }
        }
    }

    private void mukboFunction(ERPlayer erPlayer, Player p, double playerMaxHealth, double playerCurrentHealth){
        Inventory inventory = p.getInventory();
        ItemStack[] inventoryContent = inventory.getContents();
        if(playerMaxHealth * 0.8 >= playerCurrentHealth){
            for(ItemStack item : inventoryContent){
                CMDManager cmdManagerContainsCurrItem = cmdManager.setItem(item);
                if(item != null
                        && item.getType() == Material.FLOWER_BANNER_PATTERN
                        && cmdManagerContainsCurrItem.hasStringCMD("food")){
                    if(cmdManagerContainsCurrItem.hasFloatCMD(0.0f)){

                    }
                    else if(cmdManagerContainsCurrItem.hasFloatCMD(1.0f)){

                    }
                    erPlayer.setMukboActivatedTime(5000);
                }
            }
        }
    }

    private void motionManagerUpdate(ERPlayer erPlayer, Set<String> tags){
        MotionManager motionManager = erPlayer.getMotionManager();
        if(tags.contains("vector")){
            vectorTagFunction(tags,erPlayer);
        }

        if(!motionManager.getMotionIsDone()){
            motionManager.updateParabolicMotion();
        }
        else{
            tags.remove("vector");
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
