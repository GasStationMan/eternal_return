package org.EternalReturn.Util.Physics.Geometry.Cylinder;

import org.EternalReturn.Util.Physics.Geometry.StraightLine.InfStraightLine;
import org.EternalReturn.Util.Physics.MathVector.Vec3d;

public class InfCylinder{

    private InfStraightLine center;

    private double radius;

    public InfCylinder(InfStraightLine line, double radius){
        this.center = line;
        this.radius = radius;
    }

    public InfCylinder(){
        this.center = new InfStraightLine();
        this.radius = 1;
    }

    /**
     * 해당 원기둥과 매개변수로 전달된 직선의 교차점을 구한다.
     * */
    public Vec3d pointOfIntersectOfInfStrLine(InfStraightLine line){

        //l1 = center
        //l2 = line(매개변수)

        Vec3d a = Vec3d.sub(
                line.getZeroDot(),
                center.getZeroDot());
        
        // center의 방향벡터와 매개변수 직선의 방향벡터의 외적
        Vec3d u = Vec3d.crossProd(line.getDirection(), center.getDirection());

        // Vec3d.crossProd(line.getDirection(), center.getDirection());
        // ^^^^ 의 크기, 0이 되면 false 반환
        double D = u.getMag();

        //분모가 0에 가까운 경우, 두 직선은 사실상 평행하므로, 무한히 교차하거나 아니면 교차하지 않는다.
        if(-0.0000001 <= D && D <= 0.0000001){
            return null;
        }

        //사영벡터 구하기 -> r벡터 반환.
        Vec3d r = a.proj(u);

        if(r.getMag() > radius){
            return null;
        }

        //중심 직선을 r 벡터만큼 이동시켜 매개변수 직선과 교점을 구한다.
        InfStraightLine moved = new InfStraightLine(center.getDirection(), Vec3d.add(r, center.getPosition()));

        return InfStraightLine.getIntersectPoint(moved,line);

    }

}
