package org.EternalReturn.Util.Geometry.MathVector;

public class Vec2d{

    private double x;
    private double y;

    public Vec2d(double x, double y){
        this.x = x;
        this.y = y;
    }

    public double dotProd(Vec2d secondVector){
        return x * secondVector.getX() + y * secondVector.getY();
    }

    public double crossProd(Vec2d secondVector){
        return y * secondVector.getX() - x * secondVector.getY();
    }

    public void add(Vec2d secondVector){
        x += secondVector.getX();
        y += secondVector.getY();
    }

    public void neg(){
        x = -x;
        y = -y;
    }

    public void sclPrd(double scalar){
        x = scalar * x;
        y = scalar * y;
    }

    public double getScaleSquare(){
        return this.dotProd(this);
    }

    public static Vec2d add(Vec2d firstVector, Vec2d secondVector){
        return new Vec2d(firstVector.getX() + secondVector.getX(), firstVector.getY() + secondVector.getY());
    }

    public static Vec2d sub(Vec2d firstVector, Vec2d secondVector){
        return new Vec2d(firstVector.getX() - secondVector.getX(), firstVector.getY() - secondVector.getY());
    }

    /**
     * 두 벡터의 각도를 구함. 그 값은 180을 넘어가지 않음.
     * @return 라디안 각도. 일반 각도를 얻고자 한다면 Math.toDegrees()을 사용할 것.
     * */
    public static double getAngleOfVectors(Vec2d firstVector, Vec2d secondVector){
        return Math.acos(firstVector.dotProd(secondVector) / Math.sqrt(firstVector.getScaleSquare() * secondVector.getScaleSquare()));
    }

    public double getX(){
        return x;
    }

    public double getY(){
        return y;
    }

    public void set(double x, double y) {
        this.x = x;
        this.y = y;
    }
}
