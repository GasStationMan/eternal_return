package org.EternalReturn.Util.dpengine.geometry

import java.lang.AutoCloseable
import kotlin.math.sqrt

/**
 * 진짜 SoA 기반 벡터 연산 모듈
 */
open class SoAModule {

    private var x: DoubleArray
    private var y: DoubleArray
    private var z: DoubleArray
    private var w: DoubleArray

    var vecIdx: Int = 0
        private set

    private var capacity: Int

    constructor(initialCapacity: Int = 512) {
        capacity = initialCapacity
        x = DoubleArray(capacity)
        y = DoubleArray(capacity)
        z = DoubleArray(capacity)
        w = DoubleArray(capacity)
    }

    /* ======================== alloc ======================== */

    private fun alloc(xv: Double, yv: Double, zv: Double): Int {
        if (vecIdx >= capacity) resize()
        val id = vecIdx++
        x[id] = xv
        y[id] = yv
        z[id] = zv
        w[id] = 1.0
        return id
    }

    private fun resize() {
        val newCap = capacity shl 1
        x = x.copyOf(newCap)
        y = y.copyOf(newCap)
        z = z.copyOf(newCap)
        w = w.copyOf(newCap)
        capacity = newCap
    }

    fun vec3(x: Double, y: Double, z: Double): Vector3 =
        Vector3(alloc(x, y, z))

    fun vec3(): Vector3 =
        Vector3(alloc(0.0, 0.0, 0.0))

    /* ======================== access ======================== */

    protected open fun x(v: Vector3) = x[v.__id]
    protected open fun y(v: Vector3) = y[v.__id]
    protected open fun z(v: Vector3) = z[v.__id]
    protected open fun w(v: Vector3) = w[v.__id]

    /* ======================== ops ======================== */

    open fun dotprd(a: Vector3, b: Vector3): Double {
        val i = a.__id
        val j = b.__id
        return x[i] * x[j] + y[i] * y[j] + z[i] * z[j]
    }

    infix fun Vector3.dot(b: Vector3): Double = dotprd(this, b)

    open fun cross(dst: Vector3, a: Vector3, b: Vector3) {
        val i = a.__id
        val j = b.__id
        val d = dst.__id

        val ax = x[i]; val ay = y[i]; val az = z[i]
        val bx = x[j]; val by = y[j]; val bz = z[j]

        x[d] = ay * bz - az * by
        y[d] = az * bx - ax * bz
        z[d] = ax * by - ay * bx
        w[d] = 1.0
    }

    infix fun Vector3.cross(b: Vector3): Vector3 =
        vec3().also { cross(it, this, b) }

    open fun add(dst: Vector3, a: Vector3, b: Vector3) {
        val d = dst.__id
        val i = a.__id
        val j = b.__id
        x[d] = x[i] + x[j]
        y[d] = y[i] + y[j]
        z[d] = z[i] + z[j]
        w[d] = 1.0
    }

    operator fun Vector3.plus(b: Vector3): Vector3 =
        vec3().also { add(it, this, b) }

    open fun sub(dst: Vector3, a: Vector3, b: Vector3) {
        val d = dst.__id
        val i = a.__id
        val j = b.__id
        x[d] = x[i] - x[j]
        y[d] = y[i] - y[j]
        z[d] = z[i] - z[j]
        w[d] = 1.0
    }

    operator fun Vector3.minus(b: Vector3): Vector3 =
        vec3().also { sub(it, this, b) }

    open fun scalarProd(dst: Vector3, s: Double, a: Vector3) {
        val d = dst.__id
        val i = a.__id
        x[d] = s * x[i]
        y[d] = s * y[i]
        z[d] = s * z[i]
        w[d] = 1.0
    }

    operator fun Vector3.times(s: Double): Vector3 =
        vec3().also { scalarProd(it, s, this) }

    operator fun Double.times(v: Vector3): Vector3 =
        vec3().also { scalarProd(it, this, v) }

    /* ======================== length ======================== */

    protected open fun mag(v: Vector3): Double {
        val i = v.__id
        return sqrt(x[i] * x[i] + y[i] * y[i] + z[i] * z[i])
    }

    protected open fun magSqr(v: Vector3): Double {
        val i = v.__id
        return x[i] * x[i] + y[i] * y[i] + z[i] * z[i]
    }

    protected open fun norm(dst: Vector3, src: Vector3) {
        val i = src.__id
        val d = dst.__id
        val inv = 1.0 / sqrt(x[i]*x[i] + y[i]*y[i] + z[i]*z[i])
        x[d] = x[i] * inv
        y[d] = y[i] * inv
        z[d] = z[i] * inv
        w[d] = 1.0
    }

    /* ======================== scope ======================== */

    inner class VecScope internal constructor(
        private val savedIdx: Int
    ) : AutoCloseable {
        override fun close() {
            vecIdx = savedIdx
        }
    }

    fun setVecScope(): VecScope = VecScope(vecIdx)

}

@JvmInline
value class OBB(val __id : Int);

class SoAOBB(val count: Int, vecCapacity: Int = 512) : SoAModule(vecCapacity) {

    val cx = DoubleArray(count); val cy = DoubleArray(count); val cz = DoubleArray(count); val cw = DoubleArray(count);
    val qx = DoubleArray(count); val qy = DoubleArray(count); val qz = DoubleArray(count); val qw = DoubleArray(count);
    val ex = DoubleArray(count); val ey = DoubleArray(count); val ez = DoubleArray(count); val ew = DoubleArray(count);

    val r00 = DoubleArray(count); val r01 = DoubleArray(count); val r02 = DoubleArray(count);
    val r10 = DoubleArray(count); val r11 = DoubleArray(count); val r12 = DoubleArray(count);
    val r20 = DoubleArray(count); val r21 = DoubleArray(count); val r22 = DoubleArray(count);

    private val EPS = 1e-9

    fun calObbCollision(obb0: OBB, obb1: OBB): Boolean {
        val a = obb0.__id; val b = obb1.__id
        // A의 회전행렬 (A의 로컬축이 월드에서 어떻게 보이는지)
        val A00 = r00[a]; val A01 = r01[a]; val A02 = r02[a]
        val A10 = r10[a]; val A11 = r11[a]; val A12 = r12[a]
        val A20 = r20[a]; val A21 = r21[a]; val A22 = r22[a]

        // B의 회전행렬
        val B00 = r00[b]; val B01 = r01[b]; val B02 = r02[b]
        val B10 = r10[b]; val B11 = r11[b]; val B12 = r12[b]
        val B20 = r20[b]; val B21 = r21[b]; val B22 = r22[b]

        // t = Cb - Ca (월드)
        val txw = cx[b] - cx[a]
        val tyw = cy[b] - cy[a]
        val tzw = cz[b] - cz[a]

        // t를 A의 로컬로 투영: tA = [dot(t, A0), dot(t, A1), dot(t, A2)]
        val t0 = txw*A00 + tyw*A01 + tzw*A02
        val t1 = txw*A10 + tyw*A11 + tzw*A12
        val t2 = txw*A20 + tyw*A21 + tzw*A22

        // R = A^T * B  (A 로컬에서 본 B의 축)
        val R00 = A00*B00 + A01*B01 + A02*B02
        val R01 = A00*B10 + A01*B11 + A02*B12
        val R02 = A00*B20 + A01*B21 + A02*B22

        val R10 = A10*B00 + A11*B01 + A12*B02
        val R11 = A10*B10 + A11*B11 + A12*B12
        val R12 = A10*B20 + A11*B21 + A12*B22

        val R20 = A20*B00 + A21*B01 + A22*B02
        val R21 = A20*B10 + A21*B11 + A22*B12
        val R22 = A20*B20 + A21*B21 + A22*B22

        val AbsR00 = kotlin.math.abs(R00) + EPS; val AbsR01 = kotlin.math.abs(R01) + EPS; val AbsR02 = kotlin.math.abs(R02) + EPS
        val AbsR10 = kotlin.math.abs(R10) + EPS; val AbsR11 = kotlin.math.abs(R11) + EPS; val AbsR12 = kotlin.math.abs(R12) + EPS
        val AbsR20 = kotlin.math.abs(R20) + EPS; val AbsR21 = kotlin.math.abs(R21) + EPS; val AbsR22 = kotlin.math.abs(R22) + EPS

        val a0 = ex[a]; val a1 = ey[a]; val a2 = ez[a]
        val b0 = ex[b]; val b1 = ey[b]; val b2 = ez[b]

        var ra: Double
        var rb: Double

        // 1) A0, A1, A2
        ra = a0; rb = b0*AbsR00 + b1*AbsR01 + b2*AbsR02
        if (kotlin.math.abs(t0) > ra + rb) return false

        ra = a1; rb = b0*AbsR10 + b1*AbsR11 + b2*AbsR12
        if (kotlin.math.abs(t1) > ra + rb) return false

        ra = a2; rb = b0*AbsR20 + b1*AbsR21 + b2*AbsR22
        if (kotlin.math.abs(t2) > ra + rb) return false

        // 2) B0, B1, B2 (A 로컬에서)
        ra = a0*AbsR00 + a1*AbsR10 + a2*AbsR20; rb = b0
        if (kotlin.math.abs(t0*R00 + t1*R10 + t2*R20) > ra + rb) return false

        ra = a0*AbsR01 + a1*AbsR11 + a2*AbsR21; rb = b1
        if (kotlin.math.abs(t0*R01 + t1*R11 + t2*R21) > ra + rb) return false

        ra = a0*AbsR02 + a1*AbsR12 + a2*AbsR22; rb = b2
        if (kotlin.math.abs(t0*R02 + t1*R12 + t2*R22) > ra + rb) return false

        // 3) 9개 교차축 Ai x Bj
        // A0 x B0
        ra = a1*AbsR20 + a2*AbsR10
        rb = b1*AbsR02 + b2*AbsR01
        if (kotlin.math.abs(t2*R10 - t1*R20) > ra + rb) return false

        // A0 x B1
        ra = a1*AbsR21 + a2*AbsR11
        rb = b0*AbsR02 + b2*AbsR00
        if (kotlin.math.abs(t2*R11 - t1*R21) > ra + rb) return false

        // A0 x B2
        ra = a1*AbsR22 + a2*AbsR12
        rb = b0*AbsR01 + b1*AbsR00
        if (kotlin.math.abs(t2*R12 - t1*R22) > ra + rb) return false

        // A1 x B0
        ra = a0*AbsR20 + a2*AbsR00
        rb = b1*AbsR12 + b2*AbsR11
        if (kotlin.math.abs(t0*R20 - t2*R00) > ra + rb) return false

        // A1 x B1
        ra = a0*AbsR21 + a2*AbsR01
        rb = b0*AbsR12 + b2*AbsR10
        if (kotlin.math.abs(t0*R21 - t2*R01) > ra + rb) return false

        // A1 x B2
        ra = a0*AbsR22 + a2*AbsR02
        rb = b0*AbsR11 + b1*AbsR10
        if (kotlin.math.abs(t0*R22 - t2*R02) > ra + rb) return false

        // A2 x B0
        ra = a0*AbsR10 + a1*AbsR00
        rb = b1*AbsR22 + b2*AbsR21
        if (kotlin.math.abs(t1*R00 - t0*R10) > ra + rb) return false

        // A2 x B1
        ra = a0*AbsR11 + a1*AbsR01
        rb = b0*AbsR22 + b2*AbsR20
        if (kotlin.math.abs(t1*R01 - t0*R11) > ra + rb) return false

        // A2 x B2
        ra = a0*AbsR12 + a1*AbsR02
        rb = b0*AbsR21 + b1*AbsR20
        if (kotlin.math.abs(t1*R02 - t0*R12) > ra + rb) return false

        return true
    }

    fun calObbCollisionDeep(obb0: OBB, obb1: OBB): Boolean {
        val a = obb0.__id; val b = obb1.__id
        // A의 회전행렬 (A의 로컬축이 월드에서 어떻게 보이는지)
        val A00 = r00[a]; val A01 = r01[a]; val A02 = r02[a]
        val A10 = r10[a]; val A11 = r11[a]; val A12 = r12[a]
        val A20 = r20[a]; val A21 = r21[a]; val A22 = r22[a]

        // B의 회전행렬
        val B00 = r00[b]; val B01 = r01[b]; val B02 = r02[b]
        val B10 = r10[b]; val B11 = r11[b]; val B12 = r12[b]
        val B20 = r20[b]; val B21 = r21[b]; val B22 = r22[b]

        // t = Cb - Ca (월드)
        val txw = cx[b] - cx[a]
        val tyw = cy[b] - cy[a]
        val tzw = cz[b] - cz[a]

        // t를 A의 로컬로 투영: tA = [dot(t, A0), dot(t, A1), dot(t, A2)]
        val t0 = txw*A00 + tyw*A01 + tzw*A02
        val t1 = txw*A10 + tyw*A11 + tzw*A12
        val t2 = txw*A20 + tyw*A21 + tzw*A22

        // R = A^T * B  (A 로컬에서 본 B의 축)
        val R00 = A00*B00 + A01*B01 + A02*B02
        val R01 = A00*B10 + A01*B11 + A02*B12
        val R02 = A00*B20 + A01*B21 + A02*B22

        val R10 = A10*B00 + A11*B01 + A12*B02
        val R11 = A10*B10 + A11*B11 + A12*B12
        val R12 = A10*B20 + A11*B21 + A12*B22

        val R20 = A20*B00 + A21*B01 + A22*B02
        val R21 = A20*B10 + A21*B11 + A22*B12
        val R22 = A20*B20 + A21*B21 + A22*B22

        val AbsR00 = kotlin.math.abs(R00) + EPS; val AbsR01 = kotlin.math.abs(R01) + EPS; val AbsR02 = kotlin.math.abs(R02) + EPS
        val AbsR10 = kotlin.math.abs(R10) + EPS; val AbsR11 = kotlin.math.abs(R11) + EPS; val AbsR12 = kotlin.math.abs(R12) + EPS
        val AbsR20 = kotlin.math.abs(R20) + EPS; val AbsR21 = kotlin.math.abs(R21) + EPS; val AbsR22 = kotlin.math.abs(R22) + EPS

        val a0 = ex[a]; val a1 = ey[a]; val a2 = ez[a]
        val b0 = ex[b]; val b1 = ey[b]; val b2 = ez[b]

        var ra: Double
        var rb: Double

        // 1) A0, A1, A2
        ra = a0; rb = b0*AbsR00 + b1*AbsR01 + b2*AbsR02
        if (kotlin.math.abs(t0) > ra + rb) return false

        ra = a1; rb = b0*AbsR10 + b1*AbsR11 + b2*AbsR12
        if (kotlin.math.abs(t1) > ra + rb) return false

        ra = a2; rb = b0*AbsR20 + b1*AbsR21 + b2*AbsR22
        if (kotlin.math.abs(t2) > ra + rb) return false

        // 2) B0, B1, B2 (A 로컬에서)
        ra = a0*AbsR00 + a1*AbsR10 + a2*AbsR20; rb = b0
        if (kotlin.math.abs(t0*R00 + t1*R10 + t2*R20) > ra + rb) return false

        ra = a0*AbsR01 + a1*AbsR11 + a2*AbsR21; rb = b1
        if (kotlin.math.abs(t0*R01 + t1*R11 + t2*R21) > ra + rb) return false

        ra = a0*AbsR02 + a1*AbsR12 + a2*AbsR22; rb = b2
        if (kotlin.math.abs(t0*R02 + t1*R12 + t2*R22) > ra + rb) return false

        var separated = true;

        // 3) 9개 교차축 Ai x Bj
        // A0 x B0
        ra = a1*AbsR20 + a2*AbsR10
        rb = b1*AbsR02 + b2*AbsR01
        separated = separated or (kotlin.math.abs(t2*R10 - t1*R20) > ra + rb)

        // A0 x B1
        ra = a1*AbsR21 + a2*AbsR11
        rb = b0*AbsR02 + b2*AbsR00
        separated = separated or (kotlin.math.abs(t2*R11 - t1*R21) > ra + rb)

        // A0 x B2
        ra = a1*AbsR22 + a2*AbsR12
        rb = b0*AbsR01 + b1*AbsR00
        separated = separated or (kotlin.math.abs(t2*R12 - t1*R22) > ra + rb)

        // A1 x B0
        ra = a0*AbsR20 + a2*AbsR00
        rb = b1*AbsR12 + b2*AbsR11
        separated = separated or (kotlin.math.abs(t0*R20 - t2*R00) > ra + rb)

        // A1 x B1
        ra = a0*AbsR21 + a2*AbsR01
        rb = b0*AbsR12 + b2*AbsR10
        separated = separated or (kotlin.math.abs(t0*R21 - t2*R01) > ra + rb)

        // A1 x B2
        ra = a0*AbsR22 + a2*AbsR02
        rb = b0*AbsR11 + b1*AbsR10
        separated = separated or (kotlin.math.abs(t0*R22 - t2*R02) > ra + rb)

        // A2 x B0
        ra = a0*AbsR10 + a1*AbsR00
        rb = b1*AbsR22 + b2*AbsR21
        separated = separated or (kotlin.math.abs(t1*R00 - t0*R10) > ra + rb)

        // A2 x B1
        ra = a0*AbsR11 + a1*AbsR01
        rb = b0*AbsR22 + b2*AbsR20
        separated = separated or (kotlin.math.abs(t1*R01 - t0*R11) > ra + rb)

        // A2 x B2
        ra = a0*AbsR12 + a1*AbsR02
        rb = b0*AbsR21 + b1*AbsR20
        separated = separated or (kotlin.math.abs(t1*R02 - t0*R12) > ra + rb)

        return separated
    }

    private fun getRotMatrix(id: Int) {
        val x = qx[id]; val y = qy[id]; val z = qz[id]; val w = qw[id]

        val xx = x*x; val yy = y*y; val zz = z*z
        val xy = x*y; val xz = x*z; val yz = y*z
        val wx = w*x; val wy = w*y; val wz = w*z

        r00[id] = 1.0 - 2.0*(yy + zz)
        r01[id] = 2.0*(xy - wz)
        r02[id] = 2.0*(xz + wy)

        r10[id] = 2.0*(xy + wz)
        r11[id] = 1.0 - 2.0*(xx + zz)
        r12[id] = 2.0*(yz - wx)

        r20[id] = 2.0*(xz - wy)
        r21[id] = 2.0*(yz + wx)
        r22[id] = 1.0 - 2.0*(xx + yy)
    }

    var obbID : Int = 0;
    fun createOBB(pos: Vector3, axis: Vector3, angleRad: Double, halfBox: Vector3): OBB {
        val id = obbID

        // center
        cx[id] = x(pos)
        cy[id] = y(pos)
        cz[id] = z(pos)

        // half extents
        ex[id] = x(halfBox)
        ey[id] = y(halfBox)
        ez[id] = z(halfBox)

        // axis -> quaternion (안전 처리)
        val ax = x(axis); val ay = y(axis); val az = z(axis)
        val len2 = ax*ax + ay*ay + az*az

        if (len2 < 1e-24 || angleRad == 0.0) {
            // identity rotation
            qx[id] = 0.0; qy[id] = 0.0; qz[id] = 0.0; qw[id] = 1.0
        } else {
            val invLen = 1.0 / kotlin.math.sqrt(len2)
            val nx = ax * invLen
            val ny = ay * invLen
            val nz = az * invLen

            val half = angleRad * 0.5
            val s = kotlin.math.sin(half)

            qx[id] = nx * s
            qy[id] = ny * s
            qz[id] = nz * s
            qw[id] = kotlin.math.cos(half)
        }

        // quaternion 저장했으면 회전행렬도 즉시 캐시
        getRotMatrix(id)

        obbID++
        return OBB(id)
    }

    fun rand(min: Double, max: Double): Double =
        min + Math.random() * (max - min)

    fun test(N : Int) {
        val obbs = ArrayList<OBB>(N)

        // OBB 100개 생성
        repeat(N) {
            setVecScope().use{
                val pos = vec3(
                    rand(-1.0, 1.0),
                    rand(-1.0, 1.0),
                    rand(-1.0, 1.0)
                )

                val axis = vec3(
                    rand(-1.0, 1.0),
                    rand(-1.0, 1.0),
                    rand(-1.0, 1.0)
                )

                val angle = rand(0.0, Math.PI * 2.0)

                val half = vec3(
                    rand(0.5, 0.5),
                    rand(0.5, 0.5),
                    rand(0.5, 0.5)
                )
                obbs += createOBB(pos, axis, angle, half)
            }
        }

        // pairwise 테스트
        var collideCount = 0
        var testCount = 0
        val start = System.nanoTime()
        for (i in 0 until N) {
            for (j in i + 1 until N) {
                testCount++
                if (calObbCollisionDeep(obbs[i], obbs[j])) {
                    collideCount++
                }
            }
        }

        println("OBB count       = $N")
        println("Pair tested     = $testCount")
        println("Collision count = $collideCount")


        val end = System.nanoTime()

        val timeMs = (end - start) / 1_000_000.0
        println("Single-thread time = ${"%.3f".format(timeMs)} ms")
    }

}


fun main(){

    SoAOBB(64, 4096).test(64)
    //val aos = MatVecCalculator()


}