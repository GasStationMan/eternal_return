package org.EternalReturn.Util.physics.Geometry

import kotlin.math.sqrt

public open class GeometryEngine : MatVecCalculator {
    constructor(buffSize: Int) : super(buffSize)
    constructor() : super()
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
    protected fun getIntersectPoint(out: Vector3, line1Vec: Vector3, line1Pos: Vector3, line2Vec: Vector3, line2Pos: Vector3): Boolean {
        val subPos: Vector3 = vec3()
        val vCross: Vector3 = vec3()
        sub(subPos, line2Pos, line1Pos)
        cross(vCross, line1Vec, line2Vec)
        val crossMag = magSqr(vCross)
        if (crossMag < 1E-7) {
            return false
        }
        val tmp: Vector3 = vec3()
        cross(tmp, line2Vec, vCross)
        val t = dotprd(subPos, tmp) / crossMag
        val temp: Vector3 = vec3()
        scalarProd(temp, t, line1Vec)
        add(temp, temp, line1Pos)
        assign(out, temp)
        return true
    }



    /**
     * 수식
     *
     *
     * t = det(pos2 - pos1, vec1, vec1 x vec2) / |vec1 x vec2| ^ 2
     *
     * 를 통해 교점을 구하여
     * 3차원 벡터(Vector3)를 반환함.
     * @return 교점(Vector3)
     */
    public fun getIntersectPoint(out: Vector3, line1: InfStraightLine, line2: InfStraightLine): Boolean {
        val line1Pos: Vector3 = vec3(line1.px, line1.py, line1.pz)
        val line1Vec: Vector3 = vec3(line1.vx, line1.vy, line1.vz)
        val line2Pos: Vector3 = vec3(line2.px, line2.py, line2.pz)
        val line2Vec: Vector3 = vec3(line2.vx, line2.vy, line2.vz)
        return getIntersectPoint(out, line1Vec, line1Pos, line2Vec, line2Pos)
    }

    public fun getIntersectPoint(dot: Vector3, plane: InfPlane): Boolean {
        val p: Vector3 = vec3(plane.px, plane.py, plane.pz)
        val n: Vector3 = vec3(plane.vx, plane.vy, plane.vz)
        val subVec: Vector3 = vec3()
        sub(subVec, p, dot)
        val dotprd = dotprd(subVec, n)
        return -1E-7 < dotprd && dotprd < 1E-7
    }

    public fun getIntersectPoint(out: Vector3, line: InfStraightLine, cylinder: InfCylinder): Boolean {
        setVecScope().use {
            val lpos: Vector3 = vec3(line.px, line.py, line.pz) //line.getPosition();
            val cpos: Vector3 =
                vec3(cylinder.center.px, cylinder.center.py, cylinder.center.pz) //center.getPosition();

            val ldir: Vector3 = vec3(line.vx, line.vy, line.vz)
            val cdir: Vector3 = vec3(cylinder.center.vx, cylinder.center.vy, cylinder.center.vz)

            val a: Vector3 = lpos - cpos
            val u: Vector3 = ldir cross cdir
            //sub(a, lpos, cpos)
            //cross(u, ldir, cdir) // center의 방향벡터와 매개변수 직선의 방향벡터의 외적


            // u 의 크기, 0이 되면 false 반환
            val D = mag(u)

            //분모가 0에 가까운 경우, 두 직선은 사실상 평행하다고 판단한다. (부동소수점 오류 고려)
            if (-1E-7 <= D && D <= 1E-7) {
                return false
            }

            //사영벡터 구하기 -> r벡터 반환.
            //Vec3d r = Vec3d.scrlPrd(u,Vec3d.dotProd(a,u));
            val r: Vector3 = u * (a dot u)

            val distanceSqr = magSqr(r)
            val radius = cylinder.radius
            if (distanceSqr > radius * radius) {
                return false
            }

            //중심 직선을 r 벡터만큼 이동시켜 매개변수 직선(ldir, lpos)과 교점을 구한다.
            val movedDir: Vector3 = vec3()
            val movedPos: Vector3 = r + cpos
            assign(movedDir, cdir)
            return getIntersectPoint(out, movedDir, movedPos, ldir, lpos)
        }
    }

    public fun getIntersectPoint(out: Vector3, line: InfStraightLine, cylinder: Cylinder): Boolean {
        setVecScope().use {
            // === Ray ===
            val O = vec3(line.px, line.py, line.pz)
            val D = vec3(line.vx, line.vy, line.vz)

            // === Cylinder axis ===
            val C = vec3(cylinder.center.px, cylinder.center.py, cylinder.center.pz)
            val A = vec3(
                cylinder.center.vx,
                cylinder.center.vy,
                cylinder.center.vz
            )

            val radius = cylinder.radius
            val height = cylinder.height

            // === r = O - C ===
            val r = O - C

            // ======================================================
            // 1. Directional early reject
            // ======================================================
            if ((r dot D) >= 0.0) {
                return false
            }

            // ======================================================
            // 2. Ray–Axis distance² test
            // ======================================================
            val u = D cross A
            val denom = magSqr(u)
            if (denom < 1e-12) {
                // Ray || axis
                return false
            }

            val dist2 = (r dot u).let { it * it } / denom
            if (dist2 > radius * radius) {
                return false
            }

            // ======================================================
            // 3. Quadratic solve (projected space)
            // ======================================================
            val dPerp = D - A * (D dot A)
            val rPerp = r - A * (r dot A)

            val Aq = dPerp dot dPerp
            val Bq = 2.0 * (dPerp dot rPerp)
            val Cq = (rPerp dot rPerp) - radius * radius

            val disc = Bq * Bq - 4.0 * Aq * Cq
            if (disc < 0.0) {
                return false
            }

            val t = (-Bq - sqrt(disc)) / (2.0 * Aq)
            if (t < 0.0) {
                return false
            }

            // ======================================================
            // 4. Intersection point
            // ======================================================
            val P = O + D * t

            // ======================================================
            // 5. Finite height check
            // ======================================================
            val h = (P - C) dot A
            if (h < 0.0 || h > height) {
                return false
            }

            assign(out, P)
            return true
        }
    }

    public fun fgetIntersectPoint(out: Vector3, line: InfStraightLine, cylinder: Cylinder): Boolean {
        // === Ray 정보 ===
        val ox = line.px
        val oy = line.py
        val oz = line.pz

        val dx = line.vx
        val dy = line.vy
        val dz = line.vz

        // === Cylinder axis 정보 ===
        val cx = cylinder.center.px
        val cy = cylinder.center.py
        val cz = cylinder.center.pz

        val ax = cylinder.center.vx
        val ay = cylinder.center.vy
        val az = cylinder.center.vz

        val radius = cylinder.radius
        val height = cylinder.height

        // === O - C ===
        val rx = ox - cx
        val ry = oy - cy
        val rz = oz - cz

        // ======================================================
        // 1 방향성 early reject (축 기준)
        // ======================================================
        // 축에서 본 ray 시작점 → ray가 멀어지는 중이면 컷
        if (rx * dx + ry * dy + rz * dz >= 0.0) {
            return false
        }

        // ======================================================
        // 2 Ray–Axis 최소 거리^2 검사
        // ======================================================
        // u = d × a
        val ux = dy * az - dz * ay
        val uy = dz * ax - dx * az
        val uz = dx * ay - dy * ax

        val denom = ux * ux + uy * uy + uz * uz
        if (denom < 1e-12) {
            // ray || axis
            return false
        }

        // distance^2 = ((O-C)·u)^2 / |u|^2
        val num = rx * ux + ry * uy + rz * uz
        val dist2 = (num * num) / denom

        if (dist2 > radius * radius) {
            return false
        }

        // ======================================================
        // 3 실제 교차 계산 (2차식)
        // ======================================================
        // d⊥ = d - (d·a)a
        val dDotA = dx * ax + dy * ay + dz * az
        val px = dx - dDotA * ax
        val py = dy - dDotA * ay
        val pz = dz - dDotA * az

        // r⊥ = (O-C) - ((O-C)·a)a
        val rDotA = rx * ax + ry * ay + rz * az
        val qx = rx - rDotA * ax
        val qy = ry - rDotA * ay
        val qz = rz - rDotA * az

        val A = px * px + py * py + pz * pz
        val B = 2.0 * (px * qx + py * qy + pz * qz)
        val C = qx * qx + qy * qy + qz * qz - radius * radius

        val disc = B * B - 4 * A * C
        if (disc < 0.0) {
            return false
        }

        // 가장 가까운 t
        val t = (-B - sqrt(disc)) / (2 * A)
        if (t < 0.0) {
            return false
        }

        // ======================================================
        // 4 교차점 계산
        // ======================================================
        val ix = ox + t * dx
        val iy = oy + t * dy
        val iz = oz + t * dz

        // ======================================================
        // 5 유한 원기둥 높이 검사
        // ======================================================
        val hx = ix - cx
        val hy = iy - cy
        val hz = iz - cz

        val h = hx * ax + hy * ay + hz * az
        if (h < 0.0 || h > height) {
            return false
        }

        // 결과 기록
        assign(out, ix, iy, iz)
        return true
    }

    public fun fgetIntersectPoint(out: Vector3, pos: Vector3, dir: Vector3, cylinder: Cylinder): Boolean {
        // === Ray 정보 ===
        val ox = x(pos);
        val oy = y(pos);
        val oz = z(pos);

        val dx = x(dir);
        val dy = y(dir);
        val dz = z(dir);

        // === Cylinder axis 정보 ===
        val cx = cylinder.center.px
        val cy = cylinder.center.py
        val cz = cylinder.center.pz

        val ax = cylinder.center.vx
        val ay = cylinder.center.vy
        val az = cylinder.center.vz

        val radius = cylinder.radius
        val height = cylinder.height

        // === O - C ===
        val rx = ox - cx
        val ry = oy - cy
        val rz = oz - cz

        // ======================================================
        // 1 방향성 early reject (축 기준)
        // ======================================================
        // 축에서 본 ray 시작점 → ray가 멀어지는 중이면 컷
        if (rx * dx + ry * dy + rz * dz >= 0.0) {
            return false
        }

        // ======================================================
        // 2 Ray–Axis 최소 거리^2 검사
        // ======================================================
        // u = d × a
        val ux = dy * az - dz * ay
        val uy = dz * ax - dx * az
        val uz = dx * ay - dy * ax

        val denom = ux * ux + uy * uy + uz * uz
        if (denom < 1e-12) {
            // ray || axis
            return false
        }

        // distance^2 = ((O-C)·u)^2 / |u|^2
        val num = rx * ux + ry * uy + rz * uz
        val dist2 = (num * num) / denom

        if (dist2 > radius * radius) {
            return false
        }

        // ======================================================
        // 3 실제 교차 계산 (2차식)
        // ======================================================
        // d⊥ = d - (d·a)a
        val dDotA = dx * ax + dy * ay + dz * az
        val px = dx - dDotA * ax
        val py = dy - dDotA * ay
        val pz = dz - dDotA * az

        // r⊥ = (O-C) - ((O-C)·a)a
        val rDotA = rx * ax + ry * ay + rz * az
        val qx = rx - rDotA * ax
        val qy = ry - rDotA * ay
        val qz = rz - rDotA * az

        val A = px * px + py * py + pz * pz
        val B = 2.0 * (px * qx + py * qy + pz * qz)
        val C = qx * qx + qy * qy + qz * qz - radius * radius

        val disc = B * B - 4 * A * C
        if (disc < 0.0) {
            return false
        }

        // 가장 가까운 t
        val t = (-B - sqrt(disc)) / (2 * A)
        if (t < 0.0) {
            return false
        }

        // ======================================================
        // 4 교차점 계산
        // ======================================================
        val ix = ox + t * dx
        val iy = oy + t * dy
        val iz = oz + t * dz

        // ======================================================
        // 5 유한 원기둥 높이 검사
        // ======================================================
        val hx = ix - cx
        val hy = iy - cy
        val hz = iz - cz

        val h = hx * ax + hy * ay + hz * az
        if (h < 0.0 || h > height) {
            return false
        }

        // 결과 기록
        assign(out, ix, iy, iz)
        return true
    }



    companion object {
        const val EPS_DIST: Double = 1e-9 // 거리
        const val EPS_DOT: Double = 1e-12 // dot
        const val EPS_CRSS: Double = 1e-12 // cross
        const val EPS_PARAM: Double = 1e-9 // t 값
    }
}