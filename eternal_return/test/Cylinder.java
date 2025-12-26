
public class Cylinder extends InfCylinder {

    public double height;
    public InfPlane top;
    public InfPlane bottom;

    public Cylinder(InfPlane top, InfPlane bottom, InfStraightLine centerLine, double radius, double height){
        super(centerLine,radius);
        this.height = height;
        this.top    = top;
        this.bottom = bottom;
    }

}
