package org.EternalReturn.Util.Physics.Geometry;

import org.EternalReturn.Util.Physics.MathVector.Vec3d;
import org.EternalReturn.Util.Physics.Matrix.Mat3x3;

public class InfStraightLine {

    private Vec3d direction;
    private Vec3d position;
    
    /**
     * direction 벡터와 position 벡터로 하나의 유일한 직선을 결정. <p>
     * direction 벡터는 normalize되어 전달됨. <p>
     * */
    public InfStraightLine(Vec3d direction, Vec3d position){
        this.direction = direction.normalize();
        this.position = position;
    }

    /**
     * 생성자에 아무 값도 넣지 않는 경우,
     * [0,1,0] t + [0,0,0]에 해당하는 직선이 생성됨
     * */
    public InfStraightLine(){
        this.direction = new Vec3d(0,1,0);
        this.position = new Vec3d(0,0,0);
    }

    //getter

    /**
     * 시간 t 후의 점의 위치를 구하는 것과 같은 역할을 하는 함수이다.<br>
     * t = 0인 경우에는 getPosition()과 같은 값을 반환한다.<br>
     * t는 음수 또한 가능하다.
     * */
    public Vec3d getDot(double t){
        return new Vec3d(
                direction.getX() * t + position.getX(),
                direction.getY() * t + position.getY(),
                direction.getZ() * t + position.getZ()
        );
    }

    /**
     * getDot(0)과 같은 역할을 함.
     * */
    public Vec3d getZeroDot(){
        return this.getPosition();
    }

    public Vec3d getDirection(){
        return this.direction;
    }

    public Vec3d getPosition(){
        return this.position;
    }
    //setter


    //static
    /**
     * 수식 <br>
     * t = det(pos2 - pos1, dir1, dir1 x dir2) / |d1 x d2| ^ 2 를 통해 교점을 구하여 <br>
     * 3차원 벡터(Vec3d)를 반환함.
     * @return 교점(Vec3d)
     * */
    public static Vec3d getIntersectPoint(InfStraightLine line1, InfStraightLine line2){

        Vec3d dir1 = line1.getDirection();
        Vec3d dir2 = line2.getDirection();

        Vec3d pos1 = line1.getPosition();
        Vec3d pos2 = line2.getPosition();

        Mat3x3 m = new Mat3x3(Vec3d.sub(pos2,pos1), dir1, Vec3d.crossProd(dir1,dir2));

        double D = Vec3d.crossProd(dir1, dir2).getSquareScale();

        // 분모가 0에 가까우면 postion의 벡터를 반환하지 않음.
        // 사실상 평행이기 때문.
        if(-1E-7 <= D && D <= 1E-7){
            return null;
        }

        double t = m.getDet() / Vec3d.crossProd(dir1, dir2).getSquareScale();

        if(t < 0){
            return null;
        }
        return line2.getDot(t); //t를 구한 뒤 점을 반환
    }
}
