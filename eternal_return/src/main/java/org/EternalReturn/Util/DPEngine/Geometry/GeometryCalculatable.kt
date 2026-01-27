package org.EternalReturn.Util.DPEngine.Geometry

import org.EternalReturn.Util.DPEngine.DPEngine


open class GeometryCalculatable{

    lateinit var dpEngine: DPEngine;

    infix fun Vector3.dot(b: Vector3): Double {
        return dpEngine.dotprd(b, this)
    }

    /**
     * = 과 같음.
     * */
    infix fun Vector3.assign(b: Vector3): Vector3 {
        val out = dpEngine.vec3()
        dpEngine.assign(out, this)
        return out
    }

    infix fun Vector3.cross(b: Vector3): Vector3 {
        val out = dpEngine.vec3()
        dpEngine.cross(out, b, this)
        return out
    }

    open operator fun Vector3.plus(b: Vector3): Vector3 {
        val out = dpEngine.vec3()
        dpEngine.add(out, this, b)
        return out
    }

    operator fun Vector3.times(scalar: Double): Vector3 {
        val out = dpEngine.vec3()
        dpEngine.scalarProd(out, scalar, this)
        return out
    }

    operator fun Double.times(vector: Vector3): Vector3 {
        val out = dpEngine.vec3()
        dpEngine.scalarProd(out, this, vector)
        return out
    }

    operator fun Vector3.unaryMinus(): Vector3 {
        val out = dpEngine.vec3()
        dpEngine.scalarProd(out, -1.0, this)
        return out
    }

    /**
     * +=, -= 부분
     * */
    operator fun Vector3.plusAssign(b: Vector3) {
        dpEngine.add(this, this, b)
    }

    operator fun Vector3.minusAssign(b: Vector3) {
        dpEngine.sub(this, this, b)
    }

    fun vec3(): Vector3 = dpEngine.vec3()

    fun vec3(x : Double, y : Double, z : Double): Vector3 = dpEngine.vec3(x, y, z)

}