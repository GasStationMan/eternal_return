package org.EternalReturn.Util.Physics.Geometry.Cylinder;

import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.Util.Physics.Geometry.Plane.InfPlane;
import org.EternalReturn.Util.Physics.Geometry.StraightLine.InfStraightLine;
import org.EternalReturn.Util.Physics.MathVector.Vec3d;

public class Cylinder extends InfCylinder {

    private double height;

    private InfPlane top;

    private InfPlane bottom;

    public Cylinder(Vec3d direction, Vec3d position, double radius, double height){
        super(new InfStraightLine(direction, position),radius);

        this.height = height;

        this.top    = new InfPlane(direction, Vec3d.add(position,Vec3d.scrlPrd(direction,height)));
        this.bottom = new InfPlane(direction, position);

    }

    /**
     * 해당 원기둥과 직선이 교차하는지 확인한다.
     * @return 교차의 여부를 참거짓으로 나타낸다.
     * */
    public boolean isIntersectWith(InfStraightLine line){

        //Get point of intersect
        Vec3d poi = super.getPointOfIntersectWith(line);

        Vec3d topPoi = top.isIntersectWith(line);
        Vec3d bottomPoi = bottom.isIntersectWith(line);

        double squareTop = Vec3d.sub(topPoi, top.getPosition()).getSquareScale();
        double squareBottom = Vec3d.sub(bottomPoi, bottom.getPosition()).getSquareScale();

        double squareRadius = radius * radius;

        if(poi == null){
//            PluginInstance.dfLogUTF8("\n"
//                + "------------[test]------------\n"
//                + "topPoi :             " + topPoi + "\n"
//                + "bottomPoi :          " + bottomPoi + "\n"
//                + "------------------------------"
//            );
            return squareTop < squareRadius || squareBottom < squareRadius;
        }

        InfStraightLine center = super.center;
        Vec3d dir = center.getDirection();
        Vec3d pos = center.getPosition();

        Vec3d projOfPoi = Vec3d.sub(poi,pos).proj(dir);
        Vec3d prodDir = Vec3d.scrlPrd(dir, height);

//        PluginInstance.dfLogUTF8("\n"
//                + "------------[test]------------\n"
//                + "topPoi :             " + topPoi + "\n"
//                + "bottomPoi :          " + bottomPoi + "\n"
//                + "pos :                " + pos + "\n"
//                + "poi :                " + poi + "\n"
//                + "projectedPoi :       " + projOfPoi + "\n"
//                + "direction * height : " + prodDir + "\n"
//                + "------------------------------"
//        );

        if(projOfPoi.getSquareScale() > prodDir.getSquareScale()){
            //PluginInstance.dfLogUTF8("높이 벗어남");
            return squareTop < squareRadius || squareBottom < squareRadius;
        }
        return true;
    }

}
