package org.EternalReturn.Util.Physics.Geometry;

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

    //optimized form
    /**
     * 해당 원기둥과 직선이 교차하는지 확인한다.
     * @return 교차의 여부를 참거짓으로 나타낸다.
     * */
    @Override
    public boolean isIntersectWith(InfStraightLine line){

        //계산에 필요한 모든 값을 가져옴.
        Vec3d topPoi = top.isIntersectWith(line);
        Vec3d topPos = top.getPosition();
        Vec3d botPoi = bottom.isIntersectWith(line);
        Vec3d botPos = bottom.getPosition();

        Vec3d vl = line.getDirection();
        Vec3d pl = line.getPosition();
        Vec3d vc = this.center.getDirection();
        Vec3d pc = this.center.getPosition();

        double squareRadius = radius * radius;

        double squareTop = squareRadius;
        if(topPoi != null){
            double topPoiDx = topPoi.getX() - topPos.getX();
            double topPoiDy = topPoi.getY() - topPos.getY();
            double topPoiDz = topPoi.getZ() - topPos.getZ();
            squareTop = topPoiDx * topPoiDx + topPoiDy * topPoiDy + topPoiDz * topPoiDz;
        }

        double squareBottom = squareRadius;
        if(botPoi != null){
            double botPoiDx = botPoi.getX() - botPos.getX();
            double botPoiDy = botPoi.getY() - botPos.getY();
            double botPoiDz = botPoi.getZ() - botPos.getZ();
            squareBottom = botPoiDx * botPoiDx + botPoiDy * botPoiDy + botPoiDz * botPoiDz;
        }

        double vcx = vc.getX();
        double vcy = vc.getY();
        double vcz = vc.getZ();

        double pcx = pc.getX();
        double pcy = pc.getY();
        double pcz = pc.getZ();

        double vlx = vl.getX();
        double vly = vl.getY();
        double vlz = vl.getZ();

        double plx = pl.getX();
        double ply = pl.getY();
        double plz = pl.getZ();

        double crsX = vly*vcz - vlz*vcy;
        double crsY = vlx*vcz - vlz*vcx;
        double crsZ = vlx*vcy - vly*vcx;

        double sqSizeOfCrs = crsX * crsX + crsY * crsY + crsZ * crsZ;
        //아래의 if(poi == null)와 같음.
        if(-1E-7 < sqSizeOfCrs && sqSizeOfCrs < 1E-7){
            return squareTop < squareRadius || squareBottom < squareRadius;
        }

        double dotPrd = crsX * (plx - pcx) + crsY * (ply - pcy) + crsZ * (plz - pcz);

        double rx = dotPrd * crsX / sqSizeOfCrs;
        double ry = dotPrd * crsY / sqSizeOfCrs;
        double rz = dotPrd * crsZ / sqSizeOfCrs;

        double r2 = rx * rx + ry * ry + rz * rz;

        //PluginInstance.dfLogUTF8("r = " + Math.sqrt(r2));

        if(r2 > squareRadius){
            return false;
        }

        double dpx = plx - pcx - rx;
        double dpy = ply - pcy - ry;
        double dpz = plz - pcz - rz;

        //플레이어의 직선(광선)에 해당하는 t
        double tl =
                (crsX * (vcy * dpz - dpy * vcz)
                        - vcx * (crsY * dpz - dpy * crsZ)
                        + dpx * (crsY * vcz - vcy * crsZ)) /* /Math.sqrt(sqSizeOfCrs) */;

        //PluginInstance.dfLogUTF8("tl = " + tl);

        if(tl < 0){
            return false;
        }

        //원기둥의 중심축과 평행한 직선에 해당하는 t
        double tc =
                (crsX * (vly * dpz - dpy * vlz)
                        - vlx * (crsY * dpz - dpy * crsZ)
                        + dpx * (crsY * vlz - vly * crsZ)) / Math.sqrt(sqSizeOfCrs);

        //PluginInstance.dfLogUTF8("tc = " + tc);

        if(tc > this.height || tc < 0){
            return squareTop < squareRadius || squareBottom < squareRadius;
        }

        return true;

    }

    /**
     * 해당 원기둥과 직선이 교차하는지 확인한다.
     * @return 교차의 여부를 참거짓으로 나타낸다.
     * */
//    @Override
//    public boolean isIntersectWith(InfStraightLine line){
//
//        //Get point of intersect
//        Vec3d poi = super.getPointOfIntersectWith(line);
//
//        Vec3d topPoi = top.isIntersectWith(line);
//        Vec3d bottomPoi = bottom.isIntersectWith(line);
//
//        double squareTop = Vec3d.sub(topPoi, top.getPosition()).getSquareScale();
//        double squareBottom = Vec3d.sub(bottomPoi, bottom.getPosition()).getSquareScale();
//
//        double squareRadius = radius * radius;
//
//        if(poi == null){
////            PluginInstance.dfLogUTF8("\n"
////                + "------------[test]------------\n"
////                + "topPoi :             " + topPoi + "\n"
////                + "bottomPoi :          " + bottomPoi + "\n"
////                + "------------------------------"
////            );
//            return squareTop < squareRadius || squareBottom < squareRadius;
//        }
//
//        InfStraightLine center = super.center;
//        Vec3d dir = center.getDirection();
//        Vec3d pos = center.getPosition();
//
//        Vec3d projOfPoi = Vec3d.sub(poi,pos).proj(dir);
//        Vec3d prodDir = Vec3d.scrlPrd(dir, height);
//
////        PluginInstance.dfLogUTF8("\n"
////                + "------------[test]------------\n"
////                + "topPoi :             " + topPoi + "\n"
////                + "bottomPoi :          " + bottomPoi + "\n"
////                + "pos :                " + pos + "\n"
////                + "poi :                " + poi + "\n"
////                + "projectedPoi :       " + projOfPoi + "\n"
////                + "direction * height : " + prodDir + "\n"
////                + "------------------------------"
////        );
//
//        if(projOfPoi.getSquareScale() > prodDir.getSquareScale()){
//            //PluginInstance.dfLogUTF8("높이 벗어남");
//            return squareTop < squareRadius || squareBottom < squareRadius;
//        }
//        return true;
//    }

}
