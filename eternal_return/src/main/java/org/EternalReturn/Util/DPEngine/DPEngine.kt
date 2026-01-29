package org.EternalReturn.Util.DPEngine

import org.EternalReturn.Util.DPEngine.behaviour.MonobehaviourModule
import org.EternalReturn.Util.DPEngine.geometry.Cylinder
import org.EternalReturn.Util.DPEngine.geometry.GeometryModule
import org.EternalReturn.Util.DPEngine.geometry.InfPlane
import org.EternalReturn.Util.DPEngine.geometry.InfStraightLine
import org.EternalReturn.Util.DPEngine.geometry.OrientedBox
import org.bukkit.Location
import org.joml.Quaterniond

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

    public fun createOrientedBox(dirX: Double, dirY: Double, dirZ: Double, posX: Double, posY: Double, posZ: Double): OrientedBox {
        return OrientedBox(geometryModule,posX,posY,posZ, Quaterniond(dirX, dirY, dirZ, 0.0), 0.0, 0.0, 0.0);
    }

    val monobehaviourModule = MonobehaviourModule(this)

    protected abstract fun update();


    override fun run() {
        monobehaviourModule.updateMonobehaviourActors();



        update();
    }

}