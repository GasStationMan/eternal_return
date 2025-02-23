package org.EternalReturn.System;

import org.EternalReturn.System.AreaSystem.AreaGraph;
import org.EternalReturn.System.ERPlayer.ERPlayer;
import net.kyori.adventure.platform.bukkit.BukkitAudiences;
import org.EternalReturn.Util.itemUtill.Enchanter;
import org.bukkit.entity.Player;

import java.util.HashMap;
import java.util.UUID;

//싱글톤 객체
public class SystemManager {

    private static SystemManager instance;
    private static HashMap<Player, ERPlayer> erPlayerHashMap;
    private static HashMap<UUID, Player> uuidPlayerHashMap;
    private static BukkitAudiences bukkitAudiences;
    private static Enchanter enchanter;

    private static AreaGraph areaGraph;

    public static int RED_ZONE = 0;
    public static int YELLOW_ZONE = 1;
    public static int GREEN_ZONE = 2;

    //free (메모리 할당 해제)
    public void free() {
        for(ERPlayer erPlayer : erPlayerHashMap.values()){
            erPlayer.free();
        }
        erPlayerHashMap.clear();
        uuidPlayerHashMap.clear();
        erPlayerHashMap = null;
        uuidPlayerHashMap = null;
        enchanter.free();
        enchanter = null;
        areaGraph.free();
        areaGraph = null;
    }

    private SystemManager() {
        erPlayerHashMap = new HashMap<>();
        uuidPlayerHashMap = new HashMap<>();
        enchanter = new Enchanter();
        areaGraph = new AreaGraph(20);
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

    //setter
    public void addPlayer(Player p){//해시맵에서 플레이어 추가
        erPlayerHashMap.putIfAbsent(p,new ERPlayer(p));
        uuidPlayerHashMap.putIfAbsent(p.getUniqueId(),p);
    }

    public void removePlayer(Player p){//해시맵에서 플레이어 제거
        ERPlayer erPlayer = erPlayerHashMap.get(p);
        erPlayer.free();
        erPlayerHashMap.remove(p);
        uuidPlayerHashMap.remove(p.getUniqueId());
    }



    public HashMap<Player, ERPlayer> getErPlayerHashMap() {
        return erPlayerHashMap;
    }
}
