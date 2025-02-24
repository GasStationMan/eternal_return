package org.EternalReturn.Util.Physics;

import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.Util.Physics.MathVector.Vec3d;
import org.bukkit.entity.Player;
import org.bukkit.util.Vector;

public class MotionManager {

    private Vec3d motion;
    private int tick;
    private int endTick;
    private Player player;

    public MotionManager(Player p){
        this.motion = new Vec3d(0,0,0);
        this.tick = 0;
        this.player = p;
    }

    //getter
    public Vec3d getMotion(){
        return motion;
    }

    public boolean getMotionIsDone(){
        return tick == endTick;
    }

    //setter
    public void setMotion(double x, double y, double z){
        motion.set(x,y,z);
    }

    private void updateTick(){
        if(tick < endTick){
            tick = tick + 1;
        }
    }

    public void updatePlayerMotion(){
        Vector playerVelocity = player.getVelocity();
        playerVelocity.setX(motion.getX());
        playerVelocity.setY(motion.getY());
        playerVelocity.setZ(motion.getZ());
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

        //double vx;
        //double vy;
        //double vz;

        //tick 당 업데이트 할 거기 때문에 m/s -> m/tick
        motion.set(
                /*vx = */ dx * 9.8 / ((sqrt_2gh + sqrt_2gdh) * 20),
                /*vy = */ sqrt_2gh / 20,
                /*vz = */ dz * 9.8 / ((sqrt_2gh + sqrt_2gdh) * 20)
        );

        endTick = (int)(20 * (sqrt_2gh + sqrt_2gdh)/9.8);

        //PluginInstance.getServerInstance().getLogger().info(
        //        "tick : " + tick
        //        + " , endTick : " + endTick
        //                + " , dx : " + dx
        //                + " , dy : " + dy
        //                + " , dz : " + dz
        //                + " , vx : " + vx * 20
        //                + " , vy : " + vy * 20
        //                + " , vz : " + vz * 20
        //);
    }

    public void updateParabolicMotion(){
        //PluginInstance.getServerInstance().getLogger().info(
        //        " , vx : " + motion.getX() + " , vy : " + motion.getY() + " , vz : " + motion.getZ()
        //);

        //g (m/s^2) * 0.05 * 0.05 = g'(m/tick^2)
        motion.setY(motion.getY() - 9.8 * 0.05 * 0.05);

        updatePlayerMotion();
        updateTick();
    }


}
