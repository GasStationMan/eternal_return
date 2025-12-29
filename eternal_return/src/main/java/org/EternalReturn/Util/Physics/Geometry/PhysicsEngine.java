package org.EternalReturn.Util.Physics.Geometry;

public class PhysicsEngine extends MatVecCalculator {

    static final double EPS_DIST  = 1e-9;   // 거리
    static final double EPS_DOT   = 1e-12;  // dot
    static final double EPS_CRSS  = 1e-12;  // cross
    static final double EPS_PARAM = 1e-9;   // t 값

    /**
     * 
     * 선과 선의 교차점을 1E-7의 오차 범위 내로 구하는 함수
     * 
     * @param out
     * @param line1Vec
     * @param line1Pos
     * @param line2Vec
     * @param line2Pos
     * @return
     */
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
    
    protected boolean getIntersectPoint(Vector3 dot, InfPlane plane){
        try(VecScope scope = setVecScope()){
            Vector3 p = vec3(plane.px, plane.py, plane.pz);
            Vector3 n = vec3(plane.vx, plane.vy, plane.vz);
            Vector3 subVec = vec3(); 
            sub(subVec, p, dot);
            double dotprd = dot(subVec,n);
            return -1E-7 < dotprd && dotprd < 1E-7;
        }
    }

    protected boolean getIntersectPoint(Vector3 out, InfStraightLine line, InfCylinder cylinder){
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

    protected boolean fgetIntersectPoint(Vector3 out, InfStraightLine line, Cylinder cylinder){
        // === Ray 정보 ===
        final double ox = line.px;
        final double oy = line.py;
        final double oz = line.pz;

        final double dx = line.vx;
        final double dy = line.vy;
        final double dz = line.vz;

        // === Cylinder axis 정보 ===
        final double cx = cylinder.center.px;
        final double cy = cylinder.center.py;
        final double cz = cylinder.center.pz;

        final double ax = cylinder.center.vx;
        final double ay = cylinder.center.vy;
        final double az = cylinder.center.vz;

        final double radius = cylinder.radius;
        final double height = cylinder.height;

        // === O - C ===
        final double rx = ox - cx;
        final double ry = oy - cy;
        final double rz = oz - cz;

        // ======================================================
        // 1 방향성 early reject (축 기준)
        // ======================================================
        // 축에서 본 ray 시작점 → ray가 멀어지는 중이면 컷
        if (rx * dx + ry * dy + rz * dz >= 0.0) {
            return false;
        }

        // ======================================================
        // 2 Ray–Axis 최소 거리^2 검사
        // ======================================================
        // u = d × a
        final double ux = dy * az - dz * ay;
        final double uy = dz * ax - dx * az;
        final double uz = dx * ay - dy * ax;

        final double denom = ux*ux + uy*uy + uz*uz;
        if (denom < 1e-12) {
            // ray || axis
            return false;
        }

        // distance^2 = ((O-C)·u)^2 / |u|^2
        final double num = rx * ux + ry * uy + rz * uz;
        final double dist2 = (num * num) / denom;

        if (dist2 > radius * radius) {
            return false;
        }

        // ======================================================
        // 3 실제 교차 계산 (2차식)
        // ======================================================
        // d⊥ = d - (d·a)a
        final double dDotA = dx*ax + dy*ay + dz*az;
        final double px = dx - dDotA * ax;
        final double py = dy - dDotA * ay;
        final double pz = dz - dDotA * az;

        // r⊥ = (O-C) - ((O-C)·a)a
        final double rDotA = rx*ax + ry*ay + rz*az;
        final double qx = rx - rDotA * ax;
        final double qy = ry - rDotA * ay;
        final double qz = rz - rDotA * az;

        final double A = px*px + py*py + pz*pz;
        final double B = 2.0 * (px*qx + py*qy + pz*qz);
        final double C = qx*qx + qy*qy + qz*qz - radius*radius;

        final double disc = B*B - 4*A*C;
        if (disc < 0.0) {
            return false;
        }

        // 가장 가까운 t
        final double t = (-B - Math.sqrt(disc)) / (2*A);
        if (t < 0.0) {
            return false;
        }

        // ======================================================
        // 4 교차점 계산
        // ======================================================
        final double ix = ox + t * dx;
        final double iy = oy + t * dy;
        final double iz = oz + t * dz;

        // ======================================================
        // 5 유한 원기둥 높이 검사
        // ======================================================
        final double hx = ix - cx;
        final double hy = iy - cy;
        final double hz = iz - cz;

        final double h = hx*ax + hy*ay + hz*az;
        if (h < 0.0 || h > height) {
            return false;
        }

        // 결과 기록
        set(out, ix, iy, iz);
        return true;
    }

    protected boolean getIntersectPoint(Vector3 out, InfStraightLine line, Cylinder cylinder){
        try(VecScope scope = setVecScope()){

            Vector3 lpos = vec3(line.px, line.py, line.pz);//line.getPosition();
            Vector3 cpos = vec3(cylinder.center.px, cylinder.center.py, cylinder.center.pz);

            Vector3 ldir = vec3(line.vx, line.vy, line.vz);
            Vector3 cdir = vec3(cylinder.center.vx, cylinder.center.vy, cylinder.center.vz);
            
            Vector3 a = vec3();
            Vector3 u = vec3();
            sub(a, cpos, lpos);

            // 플레이어의 위치와 원기둥의 위치의 차에 대한 벡터 a
            // 플레이어의 방향벡터 lpos
            // 두 벡터의 내적값이 90도가 넘는 경우는 원기둥 내에 들어가는 경우가 전부.
            // 충돌체 내로 들어가는 경우는 없다고 가정하므로 바로 취소 절차에 들어간다.
            if(dot(a,ldir) < 0){ // 90도가 넘으면 바로 취소
                return false;
            }

            cross(u, ldir, cdir); // center의 방향벡터와 매개변수 직선의 방향벡터의 외적
            
            // u 의 크기, 0이 되면 false 반환
            double D = dot(u,u);
            //분모가 0에 가까운 경우, 두 직선은 사실상 평행하다고 판단한다. (부동소수점 오류 고려)
            if(-1E-7 <= D && D <= 1E-7){
                return false;
            }

            //사영벡터 구하기 -> r벡터 반환.
            //Vec3d r = (a * u)u;
            Vector3 r = vec3();
            scalarProd(r, dot(a,u), u);
            
            double radius = cylinder.radius;
            if(magSqr(r) > radius * radius){
                return false;
            }

            //중심 직선을 r 벡터만큼 이동시켜 매개변수 직선(ldir, lpos)과 교점을 구한다. (out)
            Vector3 movedDir = vec3(), movedPos = vec3();
            set(movedDir, cdir);
            add(movedPos, r, cpos);
            getIntersectPoint(out, movedDir, movedPos, ldir, lpos);

            //// ===== 유한 원기둥 조건 추가 =====
            Vector3 diff = vec3();
            sub(diff, out, cpos);          // out - baseCenter
            double t = dot(diff, cdir);    // projection on axis
            if (t < 0.0 || t > cylinder.height) return false;
            //// ==================================
            return true;
        }
    }

}
