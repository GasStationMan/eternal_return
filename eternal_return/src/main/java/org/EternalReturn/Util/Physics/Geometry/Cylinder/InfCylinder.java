package org.EternalReturn.Util.Physics.Geometry.Cylinder;

import org.EternalReturn.Util.Physics.Geometry.StraightLine.InfStraightLine;
import org.EternalReturn.Util.Physics.Geometry.Collider;
import org.EternalReturn.Util.Physics.MathVector.Vec3d;

public class InfCylinder implements Collider {

    protected InfStraightLine center;

    protected double radius;

    public InfCylinder(InfStraightLine line, double radius){
        this.center = line;
        this.radius = radius;
    }

    /**
     * 해당 원기둥과 매개변수로 전달된 직선의 교차점을 구한다.
     * */
    @Override
    public Vec3d getPointOfIntersectWith(InfStraightLine line){

        //l1 = center
        //l2 = line(매개변수)

        Vec3d linePos = line.getPosition();
        Vec3d centerPos = center.getPosition();

        Vec3d lineDir = line.getDirection();
        Vec3d centerDir = center.getDirection();

        Vec3d a = Vec3d.sub(
                linePos,
                centerPos);
        
        // center의 방향벡터와 매개변수 직선의 방향벡터의 외적
        Vec3d u = Vec3d.crossProd(
                lineDir,
                centerDir);

        // Vec3d.crossProd(line.getDirection(), center.getDirection());
        // ^^^^ 의 크기, 0이 되면 false 반환
        double D = u.getMag();

        //분모가 0에 가까운 경우, 두 직선은 사실상 평행하다고 판단한다. (부동소수점 오류 고려)
        if(-1E-7 <= D && D <= 1E-7){
            return null;
        }

        //사영벡터 구하기 -> r벡터 반환.
        Vec3d r = Vec3d.scrlPrd(u,Vec3d.dotProd(a,u));

        double distanceSqr = r.getSquareScale();

        if(distanceSqr > radius * radius){
            return null;
        }

        //중심 직선을 r 벡터만큼 이동시켜 매개변수 직선과 교점을 구한다.
        InfStraightLine moved = new InfStraightLine(center.getDirection(), Vec3d.add(r, center.getPosition()));

        return InfStraightLine.getIntersectPoint(moved,line);

    }

}
