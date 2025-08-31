package org.EternalReturn.System;

import org.EternalReturn.System.AreaSystem.AreaGraph;
import org.EternalReturn.System.ERPlayer.ERPlayer;
import net.kyori.adventure.platform.bukkit.BukkitAudiences;
import org.EternalReturn.System.ERPlayer.Gui.Inventory.UpgradeSystem.Model.Upgrader;
import org.EternalReturn.Util.itemUtill.CMDBlock;
import org.EternalReturn.Util.itemUtill.CMDManager;
import org.EternalReturn.System.ERPlayer.Gui.Inventory.UpgradeSystem.Model.Enchanter;
import org.bukkit.entity.Player;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

//싱글톤 객체
public class SystemManager {

    private static SystemManager instance;
    private static HashMap<Player, ERPlayer> erPlayerHashMap;
    private static List<ERPlayer> erPlayerList;
    private static HashMap<UUID, Player> uuidPlayerHashMap;
    private static BukkitAudiences bukkitAudiences;
    private static Enchanter enchanter;
    private static AreaGraph areaGraph;
    private static CMDManager cmdManager;

    public static int RED_ZONE = 0;
    public static int YELLOW_ZONE = 1;
    public static int GREEN_ZONE = 2;

    public static String AREASTRING_alley = "alley";
    public static String AREASTRING_gas_station = "gas_station";
    public static String AREASTRING_archery_range = "archery_range";
    public static String AREASTRING_temple = "temple";
    public static String AREASTRING_hotel = "hotel";
    public static String AREASTRING_school = "school";
    public static String AREASTRING_fire = "fire";
    public static String AREASTRING_police = "police";
    public static String AREASTRING_stream = "stream";
    public static String AREASTRING_pond = "pond";
    public static String AREASTRING_forest = "forest";
    public static String AREASTRING_cemetery = "cemetery";
    public static String AREASTRING_beach = "beach";
    public static String AREASTRING_village = "village";
    public static String AREASTRING_hospital = "hospital";
    public static String AREASTRING_chapel = "chapel";
    public static String AREASTRING_factory = "factory";
    public static String AREASTRING_storage = "storage";
    public static String AREASTRING_port = "port";

    public static String USE_KIOSK = "use_kiosk";
    public static String USE_HYPERLOOP = "use_hyperloop";

    public static CMDBlock EPIC_BLOOD_SAMPLE = new CMDBlock("epic",0.0f);
    public static CMDBlock EPIC_FORCE_CORE   = new CMDBlock("epic",1.0f);
    public static CMDBlock EPIC_METEORITE    = new CMDBlock("epic",2.0f);
    public static CMDBlock EPIC_MITHRIL      = new CMDBlock("epic",3.0f);
    public static CMDBlock EPIC_TREE_OF_LIFE = new CMDBlock("epic",4.0f);



    //free (메모리 할당 해제)
    public void free() {
        for(ERPlayer erPlayer : erPlayerHashMap.values()){
            erPlayer.free();
        }
        erPlayerList.clear();
        erPlayerHashMap.clear();
        uuidPlayerHashMap.clear();
        erPlayerList = null;
        erPlayerHashMap = null;
        uuidPlayerHashMap = null;
        bukkitAudiences = null;
        enchanter.free();
        enchanter = null;
        areaGraph.free();
        areaGraph = null;
        cmdManager.free();
        cmdManager = null;

        AREASTRING_alley = null;
        AREASTRING_gas_station = null;
        AREASTRING_archery_range = null;
        AREASTRING_temple = null;
        AREASTRING_hotel = null;
        AREASTRING_school = null;
        AREASTRING_fire = null;
        AREASTRING_police = null;
        AREASTRING_stream = null;
        AREASTRING_pond = null;
        AREASTRING_forest = null;
        AREASTRING_cemetery = null;
        AREASTRING_beach = null;
        AREASTRING_village = null;
        AREASTRING_hospital = null;
        AREASTRING_chapel = null;
        AREASTRING_factory = null;
        AREASTRING_storage = null;

        EPIC_BLOOD_SAMPLE = null;
        EPIC_FORCE_CORE = null;
        EPIC_METEORITE = null;
        EPIC_MITHRIL = null;
        EPIC_TREE_OF_LIFE = null;

        USE_HYPERLOOP = null;
        USE_KIOSK = null;

    }

    private SystemManager() {
        erPlayerList = new ArrayList<>();
        erPlayerHashMap = new HashMap<>();
        uuidPlayerHashMap = new HashMap<>();
        enchanter = new Upgrader();
        areaGraph = new AreaGraph(20);
        cmdManager = new CMDManager();
    }
    

    //getter
    public ERPlayer getERPlayer(Player player){ //Player 객체를 이용해서 ERPlayer 객체 불러오기
        return erPlayerHashMap.get(player);
    }

    public static SystemManager getInstance() {
        if(instance == null){
            instance = new SystemManager();
        }
        return instance;
    }

    public static Enchanter getEnchanter(){
        return enchanter;
    }

    public static HashMap<Player, ERPlayer> getERPlayerHashMap(){
        return erPlayerHashMap;
    }

    public static BukkitAudiences getBukkitAudiences(){
        return bukkitAudiences;
    }

    public static AreaGraph getAreaGraph(){
        return areaGraph;
    }

    public static CMDManager getCmdManager(){
        return cmdManager;
    }

    public static List<ERPlayer> getERPlayerList() {
        return erPlayerList;
    }

    //setter
    public static void addPlayer(Player p){//해시맵에서 플레이어 추가

        ERPlayer erPlayer = new ERPlayer(p);

        erPlayerList.add(erPlayer);
        erPlayerHashMap.putIfAbsent(p,new ERPlayer(p));
        uuidPlayerHashMap.putIfAbsent(p.getUniqueId(),p);
    }

    public static void removePlayer(Player p){//해시맵에서 플레이어 제거
        ERPlayer erPlayer = erPlayerHashMap.get(p);
        erPlayerList.remove(erPlayer);
        erPlayerHashMap.remove(p);
        uuidPlayerHashMap.remove(p.getUniqueId());
        erPlayer.free();
    }

}
