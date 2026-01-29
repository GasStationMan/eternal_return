package org.EternalReturn.Util.DPEngine.geometry

class Cylinder internal constructor(
    engine: GeometryModule,
    centerLine: InfStraightLine,
    radius: Double,
    height: Double
) : InfCylinder(engine, centerLine, radius) {

    var height: Double
    var top: InfPlane
    var bottom: InfPlane


    init {
        val x = centerLine.px
        val y = centerLine.py
        val z = centerLine.pz
        this.height = height
        this.top = InfPlane(engine, 0.0, 1.0, 0.0, x, y, z)
        this.bottom = InfPlane(engine, 0.0, 1.0, 0.0, x, y + height, z)
    }

    public override fun setPosition(x: Double, y: Double, z: Double) {
        super.setPosition(x, y, z);
        this.bottom.setPosition(x, y, z);
        this.top.setPosition(x, y, z);
    }

    public override fun setDirection(x: Double, y: Double, z: Double) {
        super.setDirection(x, y, z);
        this.bottom.setDirection(x, y, z);
        this.top.setDirection(x, y, z);
    }

    override fun rayCasting(out: Vector3, pos: Vector3, dir: Vector3): Boolean {
        return engine.fgetIntersectPoint(out, pos, dir, this);
    }
}