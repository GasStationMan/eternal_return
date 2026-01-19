package org.EternalReturn.Util.physics.Geometry



open class GeometryCalculatable(var geometryEngine: GeometryEngine) {

    infix fun Vector3.dot(b: Vector3): Double {
        return geometryEngine.dotprd(b, this)
    }

    /**
     * = 과 같음.
     * */
    infix fun Vector3.assign(b: Vector3): Vector3 {
        val out = geometryEngine.vec3()
        geometryEngine.assign(out, this)
        return out
    }

    infix fun Vector3.cross(b: Vector3): Vector3 {
        val out = geometryEngine.vec3()
        geometryEngine.cross(out, b, this)
        return out
    }

    open operator fun Vector3.plus(b: Vector3): Vector3 {
        val out = geometryEngine.vec3()
        geometryEngine.add(out, this, b)
        return out
    }

    operator fun Vector3.times(scalar: Double): Vector3 {
        val out = geometryEngine.vec3()
        geometryEngine.scalarProd(out, scalar, this)
        return out
    }

    operator fun Double.times(vector: Vector3): Vector3 {
        val out = geometryEngine.vec3()
        geometryEngine.scalarProd(out, this, vector)
        return out
    }

    operator fun Vector3.unaryMinus(): Vector3 {
        val out = geometryEngine.vec3()
        geometryEngine.scalarProd(out, -1.0, this)
        return out
    }

    /**
     * +=, -= 부분
     * */
    operator fun Vector3.plusAssign(b: Vector3) {
        geometryEngine.add(this, this, b)
    }

    operator fun Vector3.minusAssign(b: Vector3) {
        geometryEngine.sub(this, this, b)
    }

    fun vec3(): Vector3 = geometryEngine.vec3()

    fun vec3(x : Double, y : Double, z : Double): Vector3 = geometryEngine.vec3(x, y, z)



}