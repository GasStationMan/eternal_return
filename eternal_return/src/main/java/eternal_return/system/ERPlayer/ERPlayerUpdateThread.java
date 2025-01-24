package eternal_return.system.ERPlayer;

import eternal_return.system.SystemManager;
import org.bukkit.entity.Player;
import org.bukkit.scheduler.BukkitRunnable;

import java.util.HashMap;

public class ERPlayerUpdateThread implements Runnable {

    HashMap<Player,ERPlayer> erPlayerHashMap;

    public ERPlayerUpdateThread(){
        erPlayerHashMap = SystemManager.getInstance().getErPlayerHashMap();
    }

    private boolean stop;
    private boolean pause;

    @Override
    public void run() {
        for(ERPlayer p : erPlayerHashMap.values()){
            if(p.getHyperloopHud().isOpen()){

                int x = (int)(p.getPlayer().getLocation().getYaw() * 2);
                int y = (int)(p.getPlayer().getLocation().getPitch() * 2);

                p.getHyperloopHud().moveCursorPoint(x,y);
            }
            p.encodeVelocityTag();
        }
    }
}
