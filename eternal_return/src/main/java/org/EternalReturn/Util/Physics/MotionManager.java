package org.EternalReturn.Util.Physics;

import java.util.Set;

import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.System.ERPlayer.ERPlayer;
import org.bukkit.entity.Player;
import org.bukkit.util.Vector;

public class MotionManager {

    private int tick;
    private int endTick;
    private Player player;

    private double mx;
    private double my;
    private double mz;


    public void free(){
        player = null;
    }

    public MotionManager(Player p){
        this.mx = 0;
        this.my = 0;
        this.mz = 0;
        this.tick = 0;
        this.player = p;
    }

    public boolean getMotionIsDone(){
        return tick == endTick;
    }

    //setter
    public void setMotion(double x, double y, double z){
        this.mx = x;
        this.my = y;
        this.mz = z;
    }

    private void updateTick(){
        if(tick < endTick){
            tick = tick + 1;
        }
    }

    public void updatePlayerMotion(){
        Vector playerVelocity = player.getVelocity();
        playerVelocity.setX(mx);
        playerVelocity.setY(my);
        playerVelocity.setZ(mz);
        player.setVelocity(playerVelocity);
    }

    public void updatePlayerMotion(double x, double y, double z){
        Vector playerVelocity = player.getVelocity();
        playerVelocity.setX(x);
        playerVelocity.setY(y);
        playerVelocity.setZ(z);
        player.setVelocity(playerVelocity);
    }

    /**
     * 포물선 이동 시 초기속도 구하는 함수
     * @param dx 목적지까지의 x 좌표 차
     * @param dy 목적지까지의 y 좌표 차
     * @param dz 목적지까지의 z 좌표 차
     * @param h  포물선의 최대 높이
     * */
    public void setParabolicInitMotion(double dx, double dy, double dz, double h) {
        tick = 0;
        double sqrt_2gh = Math.sqrt(2 * 9.8 * h);
        double sqrt_2gdh = Math.sqrt(2 * 9.8 * (h - dy));

        //tick 당 업데이트 할 거기 때문에 m/s -> m/tick
        mx = /*vx = */ dx * 9.8 / ((sqrt_2gh + sqrt_2gdh) * 20);
        my = /*vy = */ sqrt_2gh / 20;
        mz = /*vz = */ dz * 9.8 / ((sqrt_2gh + sqrt_2gdh) * 20);

        endTick = (int)(20 * (sqrt_2gh + sqrt_2gdh)/9.8);
    }

    public void updateParabolicMotion(){
        //PluginInstance.getServerInstance().getLogger().info(
        // " , vx : " + motion.getX() + " , vy : " + motion.getY() + " , vz : " + motion.getZ());
        //g (m/s^2) * 0.05 * 0.05 = g'(m/tick^2)
        my = my - 9.8 * 0.05 * 0.05;
        updatePlayerMotion();
        updateTick();
    }


    /**
     * FROM : private void motionManagerUpdate()
     * */
    public void parseVectorTag(Set<String> tags, ERPlayer erPlayer){
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

    /**
     * FROM : private void erPlayerScript()
     * */
    public void update(ERPlayer erPlayer, Set<String> tags){
        MotionManager motionManager = erPlayer.getMotionManager();
        if(tags.contains("vector")){
            motionManager.parseVectorTag(tags,erPlayer);
        }

        if(!motionManager.getMotionIsDone()){
            motionManager.updateParabolicMotion();
        }
        
        else{
            tags.remove("vector");
        }
    }


}
