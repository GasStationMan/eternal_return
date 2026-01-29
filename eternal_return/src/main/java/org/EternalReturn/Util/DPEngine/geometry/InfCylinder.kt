package org.EternalReturn.Util.DPEngine.geometry



open class InfCylinder internal constructor(
    engine: GeometryModule,
    var center: InfStraightLine,
    var radius: Double
) : Collider(engine) {
    override fun setPosition(x: Double, y: Double, z: Double) {
        center.px = x
        center.py = y
        center.pz = z
    }

    override fun setDirection(x: Double, y: Double, z: Double) {
        center.vx = x;
        center.vy = y;
        center.vz = z;
    }

    override fun rayCasting(out: Vector3, pos: Vector3, dir: Vector3): Boolean {
        return engine.fgetIntersectPoint(out, pos, dir, this)
    }
}