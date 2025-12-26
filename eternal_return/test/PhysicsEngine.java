import java.util.Vector;

public class PhysicsEngine extends MatVecCalculator {
    
    public static void main(String[] args){
        PhysicsEngine engine = new PhysicsEngine();
        engine.test();
    }

    public void test(){

        InfStraightLine line0 = new InfStraightLine(0,0,0,1,1,0);
        InfStraightLine line1 = new InfStraightLine(0,1,0,1,2,0);

        Vector3 inter = vec3();

        debugStack();
        
        getIntersectPoint(inter, line1, line0);
        System.out.println(str(inter));

        InfPlane plane = new InfPlane(0,0,0,0,0,1);

        System.out.println(dotIsOnPlane(inter, plane));
        debugStack();
        
    }

    protected boolean getIntersectPoint(Vector3 out, Vector3 line1Vec, Vector3 line1Pos, Vector3 line2Vec, Vector3 line2Pos){
        try(VecScope scope = setVecScope()){
            Vector3 subPos = vec3();
            Vector3 vCross = vec3();
            sub(subPos, line2Pos, line1Pos);
            cross(vCross, line1Vec, line2Vec);

            double crossMag = magSqr(vCross);
            if (crossMag < 1E-7) {
                return false;
            }

            Vector3 tmp = vec3();
            cross(tmp, line2Vec, vCross);

            double t = dot(subPos, tmp) / crossMag;

            Vector3 temp = vec3();
            scalarProd(temp, t, line1Vec);
            add(temp, temp, line1Pos);
            set(out, temp);
        }
        return true;
    }

    /**
     * 수식 <p>
     * t = det(pos2 - pos1, vec1, vec1 x vec2) / |vec1 x vec2| ^ 2 <p> 를 통해 교점을 구하여 
     * 3차원 벡터(Vector3)를 반환함.
     * @return 교점(Vector3)
     * */
    protected boolean getIntersectPoint(Vector3 out, InfStraightLine line1 , InfStraightLine line2){
        try(VecScope scope = setVecScope()){
            Vector3 line1Pos = vec3(line1.px, line1.py, line1.pz);
            Vector3 line1Vec = vec3(line1.vx, line1.vy, line1.vz);
            Vector3 line2Pos = vec3(line2.px, line2.py, line2.pz);
            Vector3 line2Vec = vec3(line2.vx, line2.vy, line2.vz);
            return getIntersectPoint(out, line1Vec, line1Pos, line2Vec, line2Pos);   
        }
    }
    
    protected boolean dotIsOnPlane(Vector3 dot, InfPlane plane){
        try(VecScope scope = setVecScope()){
            Vector3 p = vec3(plane.px, plane.py, plane.pz);
            Vector3 n = vec3(plane.vx, plane.vy, plane.vz);
            Vector3 subVec = vec3(); 
            sub(subVec, p, dot);
            double dotprd = dot(subVec,n);
            return -1E-7 < dotprd && dotprd < 1E-7;
        }
    }

    protected boolean getPointOfIntersectWith(Vector3 out, InfStraightLine line, InfCylinder cylinder){
        try(VecScope scope = setVecScope()){
            Vector3 lpos = vec3(line.px, line.py, line.pz);//line.getPosition();
            Vector3 cpos = vec3(cylinder.center.px, cylinder.center.py, cylinder.center.pz);//center.getPosition();

            Vector3 ldir = vec3(line.vx, line.vy, line.vz);
            Vector3 cdir = vec3(cylinder.center.vx, cylinder.center.vy, cylinder.center.vz);
            
            Vector3 a = vec3();
            Vector3 u = vec3();
            sub(a, lpos, cpos);
            cross(u, ldir, cdir); // center의 방향벡터와 매개변수 직선의 방향벡터의 외적
            
            // u 의 크기, 0이 되면 false 반환
            double D = mag(u);

            //분모가 0에 가까운 경우, 두 직선은 사실상 평행하다고 판단한다. (부동소수점 오류 고려)
            if(-1E-7 <= D && D <= 1E-7){
                return false;
            }

            //사영벡터 구하기 -> r벡터 반환.
            //Vec3d r = Vec3d.scrlPrd(u,Vec3d.dotProd(a,u));
            Vector3 r = vec3();
            scalarProd(r, dot(a,u), u);

            double distanceSqr = magSqr(r);
            
            double radius = cylinder.radius;
            if(distanceSqr > radius * radius){
                return false;
            }

            //중심 직선을 r 벡터만큼 이동시켜 매개변수 직선(ldir, lpos)과 교점을 구한다.
            Vector3 movedDir = vec3(), movedPos = vec3();
            set(movedDir, cdir);
            add(movedPos, r, cpos);
            return getIntersectPoint(out, movedDir, movedPos, ldir, lpos);
        }
    }

    protected boolean getPointOfIntersectWith(Vector3 out, InfStraightLine line, Cylinder cylinder){
        try(VecScope scope = setVecScope()){
            Vector3 lpos = vec3(line.px, line.py, line.pz);//line.getPosition();
            Vector3 cpos = vec3(cylinder.center.px, cylinder.center.py, cylinder.center.pz);//center.getPosition();

            Vector3 ldir = vec3(line.vx, line.vy, line.vz);
            Vector3 cdir = vec3(cylinder.center.vx, cylinder.center.vy, cylinder.center.vz);
            
            Vector3 a = vec3();
            Vector3 u = vec3();
            sub(a, lpos, cpos);
            cross(u, ldir, cdir); // center의 방향벡터와 매개변수 직선의 방향벡터의 외적
            
            // u 의 크기, 0이 되면 false 반환
            double D = mag(u);

            //분모가 0에 가까운 경우, 두 직선은 사실상 평행하다고 판단한다. (부동소수점 오류 고려)
            if(-1E-7 <= D && D <= 1E-7){
                return false;
            }

            //사영벡터 구하기 -> r벡터 반환.
            //Vec3d r = Vec3d.scrlPrd(u,Vec3d.dotProd(a,u));
            Vector3 r = vec3();
            scalarProd(r, dot(a,u), u);

            double distanceSqr = magSqr(r);
            
            double radius = cylinder.radius;
            if(distanceSqr > radius * radius){
                return false;
            }

            
            //중심 직선을 r 벡터만큼 이동시켜 매개변수 직선(ldir, lpos)과 교점을 구한다.
            Vector3 movedDir = vec3(), movedPos = vec3();
            set(movedDir, cdir);
            add(movedPos, r, cpos);
            getIntersectPoint(out, movedDir, movedPos, ldir, lpos);

            // ===== 유한 원기둥 조건 추가 =====
            Vector3 diff = vec3();
            sub(diff, out, cpos);          // out - baseCenter
            double t = dot(diff, cdir);    // projection on axis
            if (t < 0.0 || t > cylinder.height) return false;
            // ==================================
        }
        return true;
    }

}
