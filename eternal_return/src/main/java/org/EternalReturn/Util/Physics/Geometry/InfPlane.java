package org.EternalReturn.Util.Physics.Geometry;

import org.EternalReturn.Util.Physics.MathVector.Vec3d;

/**
 * 무한평면을 표현하는 객체임.
 * */
public class InfPlane {

    private Vec3d normal;

    private Vec3d position;

    // n * ( x - p ) = 0
    public InfPlane(Vec3d normal, Vec3d position){
        this.normal = normal;
        this.position = position;
    }

    /**
     * 해당 점 (Vec3d)가 평면 위에 있는지 확인하는 함수 <br>
     * +- 1e-7 오차까지 허용
     * @return 해당 평면 위에 매개변수로 전달된 점이 존재하는 지를 참 거짓으로 반환.
     * */
    public boolean dotIsOnPlane(Vec3d dot){
        double det =
                normal.getX() * (dot.getX() - position.getX())
                + normal.getY() * (dot.getY() - position.getY())
                + normal.getZ() * (dot.getZ() - position.getZ());
        return -1E-7 < det && det < 1E-7;
    }

    //getters
    /**
     * 해당 평면의 법선 벡터를 구함
     * */
    public Vec3d getNormal(){
        return this.normal;
    }

    /**
     * 해당 평면의 원점으로부터 떨어진 위치를 구함.
     * */
    public Vec3d getPosition(){
        return this.position;
    }

    /**
     * 평면을 n * x = c 꼴로 표현했을 때, c의 값을 구함. <br>
     * normalVector, positionVector의 내적값이 반환됨.
     * */
    public double getC(){
        return this.normal.dotProd(this.position);
    }

    public Vec3d isIntersectWith(InfStraightLine line){
        //double det = Vec3d.dotProd(this.normal, line.getDirection());

        Vec3d lineDir = line.getDirection();
        Vec3d linePos = line.getPosition();

        double nX = normal.getX();
        double nY = normal.getY();
        double nZ = normal.getZ();

        double det =
                nX * lineDir.getX()
                + nY * lineDir.getY()
                + nZ * lineDir.getZ();

        if(-1E-7 < det && det < 1E-7){
            return null;
        }

        return line.getDot(
                //Vec3d.dotProd(this.normal, Vec3d.sub(this.position, line.getPosition())) / det
                (nX * (position.getX() - linePos.getX())
                + nY * (position.getY() - linePos.getY())
                + nZ * (position.getZ() - linePos.getZ())) / det
        );
    }

    //setters
    /**
     * 해당 평면의 법선 벡터를 설정한다.
     * */
    public void setNormal(Vec3d normal){
        this.normal = normal;
    }

    /**
     * 해당 평면의 위치 벡터를 설정한다.
     * */
    public void setPosition(Vec3d position){
        this.position = position;
    }

}
