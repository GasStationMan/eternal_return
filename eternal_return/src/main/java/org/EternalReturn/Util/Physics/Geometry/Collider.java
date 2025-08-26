package org.EternalReturn.Util.Physics.Geometry;

import org.EternalReturn.Util.Physics.Geometry.StraightLine.InfStraightLine;
import org.EternalReturn.Util.Physics.MathVector.Vec3d;

public interface Collider {

    public Vec3d getPointOfIntersectWith(InfStraightLine line);

}
