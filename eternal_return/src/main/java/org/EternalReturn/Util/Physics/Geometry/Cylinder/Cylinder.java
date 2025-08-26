package org.EternalReturn.Util.Physics.Geometry.Cylinder;

import org.EternalReturn.Util.Physics.Geometry.StraightLine.InfStraightLine;
import org.EternalReturn.Util.Physics.Hitbox.Hitbox;
import org.EternalReturn.Util.Physics.MathVector.Vec3d;

public class Cylinder extends InfCylinder implements Hitbox {

    private double height;

    public Cylinder(double height){

    }

    public boolean isIntersect(InfStraightLine line){

        //Get point of intersect
        Vec3d poi = super.pointOfIntersectOfInfStrLine(line);

        if(poi.getY() > height){
            return false;
        }

        return true;
    }

}
