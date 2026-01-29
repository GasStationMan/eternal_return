package org.EternalReturn.Util.DPEngine.geometry

import org.joml.Quaterniond

class OrientedBox(
    engine: GeometryModule,
    var px: Double, var py: Double, var pz: Double,
    val orientation: Quaterniond, // 월드 기준 회전
    val halfX: Double,
    val halfY: Double,
    val halfZ: Double
) : Collider(engine) {

    public override fun setPosition(x: Double, y: Double, z: Double) {
    }

    public override fun setDirection(x: Double, y: Double, z: Double) {
        val q = Quaterniond(1.0, 0.0, 0.0, 0.0);

    }

    public override fun rayCasting(out: Vector3, pos: Vector3, dir: Vector3): Boolean {
        return engine.getIntersectPoint(out, pos, dir, this);
    }


}