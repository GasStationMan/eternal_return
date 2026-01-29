package org.EternalReturn.Util.geometryModule.Geometry

import org.EternalReturn.Util.DPEngine.geometry.GeometryModule
import org.EternalReturn.Util.DPEngine.geometry.Vector3


open class GeometryCalculatable{

    public lateinit var geometryModule : GeometryModule;

    open fun geometryCalculatableInit(geometryModule : GeometryModule){
        this.geometryModule = geometryModule
    }


    infix fun Vector3.dot(b: Vector3): Double {
        return geometryModule.dotprd(b, this)
    }

    /**
     * = 과 같음.
     * */
    infix fun Vector3.assign(b: Vector3): Vector3 {
        val out = geometryModule.vec3()
        geometryModule.assign(out, this)
        return out
    }

    infix fun Vector3.cross(b: Vector3): Vector3 {
        val out = geometryModule.vec3()
        geometryModule.cross(out, b, this)
        return out
    }

    open operator fun Vector3.plus(b: Vector3): Vector3 {
        val out = geometryModule.vec3()
        geometryModule.add(out, this, b)
        return out
    }

    operator fun Vector3.times(scalar: Double): Vector3 {
        val out = geometryModule.vec3()
        geometryModule.scalarProd(out, scalar, this)
        return out
    }

    operator fun Double.times(vector: Vector3): Vector3 {
        val out = geometryModule.vec3()
        geometryModule.scalarProd(out, this, vector)
        return out
    }

    operator fun Vector3.unaryMinus(): Vector3 {
        val out = geometryModule.vec3()
        geometryModule.scalarProd(out, -1.0, this)
        return out
    }

    /**
     * +=, -= 부분
     * */
    operator fun Vector3.plusAssign(b: Vector3) {
        geometryModule.add(this, this, b)
    }

    operator fun Vector3.minusAssign(b: Vector3) {
        geometryModule.sub(this, this, b)
    }

    fun vec3(): Vector3 = geometryModule.vec3()

    fun vec3(x : Double, y : Double, z : Double): Vector3 = geometryModule.vec3(x, y, z)

}