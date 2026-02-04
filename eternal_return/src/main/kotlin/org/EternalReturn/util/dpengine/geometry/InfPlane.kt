package org.EternalReturn.util.dpengine.geometry

import kotlin.math.sqrt

/**
 * 무한평면을 표현하는 객체임.
 */
class InfPlane : Collider {
    var px: Double
    var py: Double
    var pz: Double

    var vx: Double
    var vy: Double
    var vz: Double

    // n * ( x - p ) = 0
    internal constructor(
        engine: GeometryModule,
        px: Double,
        py: Double,
        pz: Double,
        vx: Double,
        vy: Double,
        vz: Double
    ) : super(engine) {
        this.px = px
        this.py = py
        this.pz = pz
        val magInv = 1 / sqrt(vx * vx + vy * vy + vz * vz)
        this.vx = vx * magInv
        this.vy = vy * magInv
        this.vz = vz * magInv
    }

    /**
     * 생성자에 아무 값도 넣지 않는 경우,
     * [0,1,0] * (x - [0,0,0])에 해당하는 직선이 생성됨
     */
    internal constructor(engine: GeometryModule) : super(engine) {
        this.vx = 0.0
        this.vy = 1.0
        this.vz = 0.0
        this.px = 0.0
        this.py = 0.0
        this.pz = 0.0
    }

    public override fun setPosition(x: Double, y: Double, z: Double) {
        this.px = x
        this.py = y
        this.pz = z
    }

    public override fun setDirection(x: Double, y: Double, z: Double) {
        this.vx = x
        this.vy = y
        this.vz = z
    }

    public override fun rayCasting(out: Vector3, pos: Vector3, dir: Vector3): Boolean {
        return engine.fgetIntersectPoint(out, pos, dir, this);
    }

    /**
     * n * x + D = 0 기준으로 D를 구함.
     * */
    public fun D() : Double{
        return -(px*vx + py*vy + pz*vz)
    }
}