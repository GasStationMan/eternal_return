package org.EternalReturn.Util.dpengine

import org.EternalReturn.Util.dpengine.behaviour.MonobehaviourModule
import org.EternalReturn.Util.dpengine.command.Command
import org.EternalReturn.Util.dpengine.geometry.Cylinder
import org.EternalReturn.Util.dpengine.geometry.GeometryModule
import org.EternalReturn.Util.dpengine.geometry.InfPlane
import org.EternalReturn.Util.dpengine.geometry.InfStraightLine
import org.EternalReturn.Util.dpengine.geometry.OrientedBox
import org.bukkit.Location
import org.joml.Quaterniond
import java.util.concurrent.ArrayBlockingQueue

/**
 * Made by Danpung (TDanfung)
 * 기본적 엔진
 * */
abstract class DPEngine(bufferSize: Int = 512) : Runnable {

    val geometryModule = GeometryModule(this, bufferSize)

    public fun createCylinder(line : InfStraightLine, height : Double, radius : Double) : Cylinder{
        return Cylinder(geometryModule, line, height, radius);
    }

    public fun createCylinder(location : Location, height : Double, radius : Double) : Cylinder{
        val dir = location.direction;
        return Cylinder(geometryModule,
            InfStraightLine(geometryModule, dir.x, dir.y, dir.z, location.x, location.y, location.z),
            radius, height);
    }

    public fun createInfStrightLine(dirX: Double, dirY: Double, dirZ: Double, posX: Double, posY: Double, posZ: Double): InfStraightLine {
        return InfStraightLine(geometryModule, dirX, dirY, dirZ, posX, posY, posZ);
    }

    public fun createInfPlane(dirX: Double, dirY: Double, dirZ: Double, posX: Double, posY: Double, posZ: Double): InfPlane {
        return InfPlane(geometryModule, posX, posY, posZ, dirX, dirY, dirZ);
    }

    public fun createOrientedBox(location : Location, halfX: Double, halfY: Double, halfZ: Double): OrientedBox {
        val dir = location.direction;
        return OrientedBox(geometryModule,location.x,location.y, location.z,Quaterniond(dir.x, dir.y, dir.z, 0.0), halfX, halfY, halfZ);
    }

    public fun createOrientedBox(dirX: Double, dirY: Double, dirZ: Double, posX: Double, posY: Double, posZ: Double): OrientedBox {
        return OrientedBox(geometryModule,posX,posY,posZ, Quaterniond(dirX, dirY, dirZ, 0.0), 0.0, 0.0, 0.0);
    }

    public val monobehaviourModule = MonobehaviourModule(this)

    protected abstract fun update();

    public val commandQueue = ArrayBlockingQueue<Command>(128);

    public fun appendCommandQueue(cmd : Command){
        commandQueue.add(cmd);
        //println("Command queue length = " + commandQueue.size);
    }

    public fun flushCommandQueue(){
        while(!commandQueue.isEmpty()){
            val cmd = commandQueue.poll();
            cmd.run();
        }
    }

    /**
     * In main thread
     * */
    override fun run() {
        monobehaviourModule.consumeEvents();
        monobehaviourModule.updateMonobehaviours();
        update();
        flushCommandQueue();
    }

}