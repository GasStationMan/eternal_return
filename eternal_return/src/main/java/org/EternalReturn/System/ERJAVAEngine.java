package org.EternalReturn.System;

import org.EternalReturn.System.ERAnimal.Alpha;
import org.EternalReturn.System.ERAnimal.ERAnimal;
import org.EternalReturn.System.ERPlayer.ERPlayer;
import org.EternalReturn.Util.AnimatedJAVAEntity.AJEntity;
import org.EternalReturn.Util.AnimatedJAVAEntity.AJEntityManager;
import org.EternalReturn.Util.Physics.MotionManager;
import org.EternalReturn.Util.Physics.Geometry.Cylinder;
import org.EternalReturn.Util.Physics.Geometry.InfStraightLine;
import org.EternalReturn.Util.Physics.Geometry.PhysicsEngine;
import org.bukkit.Location;
import org.bukkit.World;
import org.bukkit.entity.Marker;
import org.bukkit.entity.Player;
import org.bukkit.util.Vector;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

public class ERJAVAEngine extends PhysicsEngine implements Runnable{
    private HashMap<Player,ERPlayer> erPlayerHashMap;
    private List<Marker> markerList;
    private World currentWorld;

    public ERJAVAEngine(){
        erPlayerHashMap = SystemManager.getInstance().getERPlayerHashMap();
        markerList = new ArrayList<>();
        currentWorld = null;
    }

    @Override
    public void run() {
        for(ERPlayer erPlayer : erPlayerHashMap.values()){
            Player p = erPlayer.getPlayer();
            Set<String> tags = p.getScoreboardTags();
            erPlayer.getSkill().update();
            erPlayer.getMotionManager().update(erPlayer,tags);
            physicsDebug(erPlayer, p, tags);
        }
    }

    private void physicsDebug(ERPlayer erPlayer, Player p, Set<String> tags){
        try(VecScope scope = setVecScope()){
            if(!tags.contains("ray")){
                return;
            }
            tags.remove("ray");
            

            for(AJEntity animal : AJEntityManager.getAjEntities()){
                if(!(animal instanceof Alpha)){
                    continue;
                }
                
                Alpha alpha = (Alpha)animal;
                if(!(alpha.getCollider() instanceof Cylinder)){
                    continue;
                }
                Cylinder cylinder = (Cylinder)alpha.getCollider();

                Vector3 dir = vec3(); 
                Vector3 pos = vec3();
                getDirNPos(dir, pos, p.getLocation());
                
                InfStraightLine playerRay = new InfStraightLine(x(dir), y(dir), z(dir), x(pos), y(pos) + 1.75d, z(pos));
                
                Vector3 poi = vec3();
                long s = System.nanoTime();
                boolean intersect = fgetIntersectPoint(poi, playerRay, cylinder);
                p.sendMessage((System.nanoTime() - s) + " ns passed with intersect = " + intersect);

            }
        }
    }

    private void getDirNPos(Vector3 dirOut, Vector3 posOut, Location location){
        try(VecScope vecScope = setVecScope()){
            double rotX = location.getYaw();
            double rotY = location.getPitch();
            double radX = Math.toRadians(rotX);
            double radY = Math.toRadians(rotY);
            double xz = Math.cos(radY);
            Vector3 dir = vec3(-xz * Math.sin(radX), -Math.sin(radY), xz * Math.cos(radX));
            norm(dirOut, dir);
            Vector3 pos = vec3(location.getX(), location.getY(), location.getZ());
            set(posOut, pos);
        }
    }


}
