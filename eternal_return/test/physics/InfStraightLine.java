
public class InfStraightLine {

    public double px;
    public double py;
    public double pz;

    public double vx;
    public double vy;
    public double vz;
    
    /**
     * direction 벡터와 position 벡터로 하나의 유일한 직선을 결정. <p>
     * direction 벡터는 normalize되어 전달됨. <p>
     * */
    public InfStraightLine(double px, double py, double pz, double vx, double vy, double vz){
        this.px = px; this.py = py; this.pz = pz;
        double magInv = 1 / Math.sqrt(vx * vx + vy * vy + vz * vz);
        this.vx = vx * magInv; 
        this.vy = vy * magInv; 
        this.vz = vz * magInv;
    }

    /**
     * 생성자에 아무 값도 넣지 않는 경우,
     * [0,1,0] t + [0,0,0]에 해당하는 직선이 생성됨
     * */
    public InfStraightLine(){
        this.vx = 0;
        this.vy = 1;
        this.vz = 0;
        this.px = 0;
        this.py = 0;
        this.pz = 0;
    }
}
