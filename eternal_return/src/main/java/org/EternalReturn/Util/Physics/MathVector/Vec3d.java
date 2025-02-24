package org.EternalReturn.Util.Physics.MathVector;

public class Vec3d{

    private double x;
    private double y;
    private double z;

    public Vec3d(double x, double y, double z){
        this.x = x;
        this.y = y;
        this.z = z;
    }

    //static
    public static Vec3d crossProd(Vec3d firstVector, Vec3d secondVector){

        double fx = firstVector.getX();
        double fy = firstVector.getY();
        double fz = firstVector.getZ();

        double sx = secondVector.getX();
        double sy = secondVector.getY();
        double sz = secondVector.getZ();

        return new Vec3d(
                fz * sx - fx * sz,
                fx * sy - fy * sx,
                fy * sz - fz * sy);
    }

    public static Vec3d add(Vec3d firstVector, Vec3d secondVector){
        return new Vec3d(
                firstVector.getX() + secondVector.getX(),
                firstVector.getY() + secondVector.getY(),
                firstVector.getZ() + secondVector.getZ());
    }

    public static Vec3d sub(Vec3d firstVector, Vec3d secondVector){
        return new Vec3d(
                firstVector.getX() - secondVector.getX(),
                firstVector.getY() - secondVector.getY(),
                firstVector.getZ() - secondVector.getZ());
    }

    //getter
    public double dotProd(Vec3d secondVector){
        return x * secondVector.getX()
                + y * secondVector.getY()
                + z * secondVector.getZ();
    }

    public Vec3d crossProd(Vec3d secondVector){

        double fx = x;
        double fy = y;
        double fz = z;

        double sx = secondVector.getX();
        double sy = secondVector.getY();
        double sz = secondVector.getZ();

        return new Vec3d(
                fz * sx - fx * sz,
                fx * sy - fy * sx,
                fy * sz - fz * sy);
    }

    public double getScaleSquare(){
        return this.dotProd(this);
    }

    public double getX(){
        return x;
    }

    public double getY(){
        return y;
    }

    public double getZ(){
        return z;
    }

    //setter
    public void add(Vec3d secondVector){
        x += secondVector.getX();
        y += secondVector.getY();
        z += secondVector.getZ();
    }

    public void neg(){
        x = -x;
        y = -y;
        z = -z;
    }

    public void sclPrd(double scalar){
        x = scalar * x;
        y = scalar * y;
        z = scalar * z;
    }

    public void setX(double x){
        this.x = x;
    }

    public void setY(double y){
        this.y = y;
    }

    public void setZ(double z){
        this.z = z;
    }

    public void set(double x, double y, double z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }

}



