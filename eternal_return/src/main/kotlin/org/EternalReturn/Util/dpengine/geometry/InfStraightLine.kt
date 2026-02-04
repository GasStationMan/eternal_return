package org.EternalReturn.Util.dpengine.geometry

import kotlin.math.sqrt

class InfStraightLine : Collider{
    var px: Double
    var py: Double
    var pz: Double

    var vx: Double
    var vy: Double
    var vz: Double
    /**
     * direction 벡터와 position 벡터로 하나의 유일한 직선을 결정.
     *
     *
     * direction 벡터는 normalize되어 전달됨.
     *
     *
     */
    constructor(engine: GeometryModule, vx: Double, vy: Double, vz: Double, px: Double, py: Double, pz: Double) : super(engine) {
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
     * [0,1,0] t + [0,0,0]에 해당하는 직선이 생성됨
     */
    constructor(engine: GeometryModule) : super(engine) {
        this.vx = 0.0
        this.vy = 1.0
        this.vz = 0.0
        this.px = 0.0
        this.py = 0.0
        this.pz = 0.0
    }

    override fun setPosition(x: Double, y: Double, z: Double) {
        this.px = x;
        this.py = y;
        this.pz = z;
    }

    override fun setDirection(x: Double, y: Double, z: Double) {
        this.vx = x;
        this.vy = y;
        this.vz = z;
    }

    override fun rayCasting(out: Vector3, pos: Vector3, dir: Vector3): Boolean {
        return engine.getIntersectPoint(out, pos, dir, this);
    }
}