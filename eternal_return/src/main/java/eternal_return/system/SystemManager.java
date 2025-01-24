package eternal_return.system;

import eternal_return.system.ERPlayer.ERPlayer;
import net.kyori.adventure.platform.bukkit.BukkitAudiences;
import org.bukkit.entity.Player;
import org.checkerframework.checker.nullness.qual.NonNull;

import java.util.HashMap;
import java.util.UUID;

//싱글톤 객체
public class SystemManager {

    private static SystemManager instance;
    private HashMap<Player, ERPlayer> erPlayerHashMap;
    private HashMap<UUID, Player> uuidPlayerHashMap;
    private BukkitAudiences bukkitAudiences;

    private SystemManager() {
        erPlayerHashMap = new HashMap<>();
        uuidPlayerHashMap = new HashMap<>();
    }
    

    /**
     * Getters
     * */
    //이건 느려 터져서 안 쓸 듯.
    public ERPlayer getERPlayer(UUID uuid){
        return erPlayerHashMap.get(uuidPlayerHashMap.get(uuid));
    }

    //Player 객체를 이용해서 ERPlayer 객체 불러오기
    public ERPlayer getERPlayer(Player player){
        return erPlayerHashMap.get(player);
    }

    //싱글톤이라서 이건 필수
    public static SystemManager getInstance() {
        if(instance == null){
            instance = new SystemManager();
        }
        return instance;
    }


    /**
     * Setters
     * */

    //해시맵에서 플레이어 추가
    public void addPlayer(Player p){
        erPlayerHashMap.putIfAbsent(p,new ERPlayer(p));
        uuidPlayerHashMap.putIfAbsent(p.getUniqueId(),p);
    }
    
    //해시맵에서 플레이어 제거
    public void removePlayer(Player p){
        erPlayerHashMap.remove(p);
        uuidPlayerHashMap.remove(p.getUniqueId());
    }

    //free (메모리 할당 해제)
    public void free() {

        erPlayerHashMap.clear();
        uuidPlayerHashMap.clear();
        erPlayerHashMap = null;
        uuidPlayerHashMap = null;
    }

    public HashMap<Player, ERPlayer> getErPlayerHashMap() {
        return erPlayerHashMap;
    }
}
