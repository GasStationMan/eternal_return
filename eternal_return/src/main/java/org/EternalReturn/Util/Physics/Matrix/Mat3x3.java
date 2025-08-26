package org.EternalReturn.Util.Physics.Matrix;

import org.EternalReturn.Util.Physics.MathVector.Vec2d;
import org.EternalReturn.Util.Physics.MathVector.Vec3d;

/**
 * 3x3 Matrix 클래스.
 * */
public class Mat3x3 {

    public double[] e = new double[9];

    /**
     * 3x3 Matrix를 생성한다. 세 개의 벡터는 모두 전치된(Transposed) 상태에서 행렬이 생성된다.
     * */
    public Mat3x3(Vec3d v1, Vec3d v2, Vec3d v3){

        this.e[0] = v1.getX();
        this.e[1] = v2.getX();
        this.e[2] = v3.getX();

        this.e[3] = v1.getY();
        this.e[4] = v2.getY();
        this.e[5] = v3.getY();

        this.e[6] = v1.getZ();
        this.e[7] = v2.getZ();
        this.e[8] = v3.getZ();

    }

    /**
     * 매개변수로 전달된 double[]의 길이가 9가 아닌 경우엔 항등행렬 반환
     * */
    public Mat3x3(double[] elems){
        this();
        if(elems.length == 9){
            e = elems;
        }
    }
    
    /**
     * 매개변수 없이 생성 시 항등행렬 반환
     * */
    public Mat3x3(){
        e[0] = 1; e[1] = 0; e[2] = 0;
        e[3] = 0; e[4] = 1; e[5] = 0;
        e[6] = 0; e[7] = 0; e[8] = 1;
    }

    /**
     * 해당 행렬과 매개변수로 전달된 벡터를 곱하여 새로운 벡터를 만든다.
     * */
    public Vec3d prod(Vec3d v){
        return new Vec3d(
                e[0] * v.getX() + e[1] * v.getY() + e[2] * v.getZ(),
                e[3] * v.getX() + e[4] * v.getY() + e[5] * v.getZ(),
                e[6] * v.getX() + e[7] * v.getY() + e[8] * v.getZ());
    }

    /**
     * 두 행렬을 더하여 새로운 행렬을 만든다.
     * */
    public Mat3x3 add(Mat3x3 m){
        double[] me = m.getElems();
        return new Mat3x3(
                new double[]{
                        me[0] + e[0], me[1] + e[1], me[2] + e[2],
                        me[3] + e[3], me[4] + e[4], me[5] + e[5],
                        me[6] + e[6], me[7] + e[7], me[8] + e[8],
                }
        );
    }

    /**
     * 해당 행렬의 원소 정보를 double[]형으로 반환한다.
     * */
    public double[] getElems(){
        return this.e;
    }

    /**
     * 해당 행렬의 행렬식 값을 구한다.
     * | e[0] e[1] e[2] |
     * | e[3] e[4] e[5] |
     * | e[6] e[7] e[8] |
     * */
    public double getDet(){
        return
                e[0] * (e[4] * e[8] - e[5] * e[7])
                - e[1] * (e[3] * e[8] - e[5] * e[6])
                + e[2] * (e[3] * e[7] - e[4] * e[6]);
    }




}
