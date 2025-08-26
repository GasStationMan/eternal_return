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
    public static Vec3d crossProd(Vec3d v0, Vec3d v1){

        double x0 = v0.getX();
        double y0 = v0.getY();
        double z0 = v0.getZ();

        double x1 = v1.getX();
        double y1 = v1.getY();
        double z1 = v1.getZ();

        return new Vec3d(
                y0 * z1 - z0 * y1,
                x0 * z1 - z0 * x1,
                x0 * y1 - y0 * x1);
    }

    public static double dotProd(Vec3d v0, Vec3d v1){

        double fx = v0.getX();
        double fy = v0.getY();
        double fz = v0.getZ();

        double sx = v1.getX();
        double sy = v1.getY();
        double sz = v1.getZ();

        return fx*sx + fy*sy + fz*sz;
    }

    public static Vec3d add(Vec3d v0, Vec3d v1){
        return new Vec3d(
                v0.getX() + v1.getX(),
                v0.getY() + v1.getY(),
                v0.getZ() + v1.getZ());
    }

    /**
     * 벡터의 뺄셈을 게산.<br>
     * @return v0 - v1
     * */
    public static Vec3d sub(Vec3d v0, Vec3d v1){
        return new Vec3d(
                v0.getX() - v1.getX(),
                v0.getY() - v1.getY(),
                v0.getZ() - v1.getZ());
    }

    //getter
    public double dotProd(Vec3d v){
        return x * v.getX()
                + y * v.getY()
                + z * v.getZ();
    }

    public Vec3d copy(){
        return new Vec3d(
                this.getX(),
                this.getY(),
                this.getZ()
        );
    }

    /**
     * 해당 벡터를 v로 사영한 벡터를 반환합니다.
     * proj v (this)
     * */
    public Vec3d proj(Vec3d v){
        return Vec3d.scrlPrd(
                v.copy(),
                Vec3d.dotProd(v,this)/v.getSquareScale()
        );
    }

    public static Vec3d scrlPrd(Vec3d v, double s) {
        return new Vec3d(
                v.getX() * s,
                v.getY() * s,
                v.getZ() * s
        );
    }

    public static Vec3d scrlDiv(Vec3d v, double s) {
        return new Vec3d(
                v.getX() / s,
                v.getY() / s,
                v.getZ() / s
        );
    }

    public Vec3d crossProd(Vec3d v){

        double x0 = x;
        double y0 = y;
        double z0 = z;

        double x1 = v.getX();
        double y1 = v.getY();
        double z1 = v.getZ();

        return new Vec3d(
                y0 * z1 - z0 * y1,
                x0 * z1 - z0 * x1,
                x0 * y1 - y0 * x1);
    }

    /**
     * 해당 벡터(v)의 크기의 제곱을 반환한다.
     * @return |v|^2
     * */
    public double getSquareScale(){
        return this.dotProd(this);
    }

    /**
     * 해당 벡터의 크기를 구한다.
     * @return |v|
     * */
    public double getMag(){
        return Math.sqrt(getSquareScale());
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
    public void add(Vec3d v1){
        x += v1.getX();
        y += v1.getY();
        z += v1.getZ();
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

    /**
     * 해당 벡터의 단위 벡터를 구한다.
     * */
    public Vec3d normalize() {
        return Vec3d.scrlDiv(this.copy(),this.getMag());
    }

    @Override
    public String toString(){
        return "< " + this.x + " , " + this.y + " , " + this.z + " >";
    }
}



