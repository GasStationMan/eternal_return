package org.EternalReturn.Area;

import org.EternalReturn.Util.Geometry.MathVector.Vec3d;

/**
 * ERAnimalSpawnPointControlBlock, 줄여서 ERAnimalSPCB <br>
 * 해당 구역에서 생성할 야생동물의 정보를 저장한다.
 * */
public class ERAnimalSPCB {

    private String className;

    private Vec3d spawnPoint;

    private int numOfSpawn;

    public ERAnimalSPCB(String name, Vec3d spawnPoint, int numOfSpawn){
        this.className = name;
        this.spawnPoint = spawnPoint;
        this.numOfSpawn = numOfSpawn;
    }


}
