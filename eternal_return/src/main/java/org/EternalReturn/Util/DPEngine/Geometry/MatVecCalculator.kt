package org.EternalReturn.Util.DPEngine.Geometry

import java.lang.AutoCloseable
import kotlin.math.sqrt

/**
 * 벡터 계산, 행렬 계산 구현체
 */
public open class MatVecCalculator {
    private var vecs: DoubleArray
    private val mats: DoubleArray
    var vecIdx: Int = 0
    private var __VECBUFFSIZE = 0
    var matIdx: Int = 0
    private var __MATBUFFSIZE = 0

    private val vecStack = IntArray(64)
    private var vecStackIdx = 0
    private val matStack = IntArray(64)
    private var matStackIdx = 0

    fun debugStack() {
        println(
            ("Current vector stack pointer : " + this.vecStackIdx
                    + "\nCurrent vector buffer nextAllocIdx : " + this.vecIdx
                    + "\nCurrent matrix stack pointer : " + this.matStackIdx
                    + "\nCurrent matrix buffer nextAllocIdx : " + this.matIdx)
        )
    }

    /**
     * 필요한 만큼의 버퍼를 미리 생성
     */
    constructor(BUFFSIZE4: Int) {
        this.vecs = DoubleArray(BUFFSIZE4 * 4)
        this.mats = DoubleArray(BUFFSIZE4 * 16)
        this.__VECBUFFSIZE = BUFFSIZE4 * 4
        this.__MATBUFFSIZE = BUFFSIZE4 * 16
    }

    constructor() {
        this.vecs = DoubleArray(128)
        this.mats = DoubleArray(512)
        this.__VECBUFFSIZE = 128
        this.__MATBUFFSIZE = 512
    }

    /**
     * 내적 연산
     */
    open fun dotprd(src0: Vector3, src1: Vector3): Double {
        return (vecs[src0.__id] * vecs[src1.__id] + vecs[src0.__id + 1] * vecs[src1.__id + 1] + vecs[src0.__id + 2] * vecs[src1.__id + 2])
    }

    infix fun Vector3.dot(b: Vector3): Double {
        return dotprd(b, this)
    }

    /**
     * 외적 연산, 순서에 주의 (dst = src0 x src1)
     */
    open fun cross(dst: Vector3, src0: Vector3, src1: Vector3) {
        val x0: Double
        val y0: Double
        val z0: Double
        val x1: Double
        val y1: Double
        val z1: Double
        x0 = vecs[src0.__id]
        y0 = vecs[src0.__id + 1]
        z0 = vecs[src0.__id + 2]
        x1 = vecs[src1.__id]
        y1 = vecs[src1.__id + 1]
        z1 = vecs[src1.__id + 2]


        // i  j  k
        // x0 y0 z0
        // x1 y1 z1
        vecs[dst.__id] = y0 * z1 - z0 * y1
        vecs[dst.__id + 1] = z0 * x1 - x0 * z1
        vecs[dst.__id + 2] = x0 * y1 - y0 * x1
    }

    infix fun Vector3.cross(b: Vector3): Vector3 {
        val out = vec3()
        cross(out, b, this)
        return out
    }


    /**
     * 벡터 덧셈 연산
     */
    open fun add(dst: Vector3, src0: Vector3, src1: Vector3): MatVecCalculator {
        vecs[dst.__id] = vecs[src0.__id] + vecs[src1.__id]
        vecs[dst.__id + 1] = vecs[src0.__id + 1] + vecs[src1.__id + 1]
        vecs[dst.__id + 2] = vecs[src0.__id + 2] + vecs[src1.__id + 2]
        vecs[dst.__id + 3] = 1.0
        return this
    }

    operator fun Vector3.plus(b: Vector3): Vector3 {
        val out = vec3()
        add(out, this, b)
        return out
    }

    /**
     * 벡터 대입 연산
     */
    open fun assign(dst: Vector3, src0: Vector3): MatVecCalculator {
        vecs[dst.__id] = vecs[src0.__id]
        vecs[dst.__id + 1] = vecs[src0.__id + 1]
        vecs[dst.__id + 2] = vecs[src0.__id + 2]
        vecs[dst.__id + 3] = 1.0
        return this
    }

    protected open fun assign(dst: Vector3, x: Double, y: Double, z: Double): MatVecCalculator {
        vecs[dst.__id] = x
        vecs[dst.__id + 1] = y
        vecs[dst.__id + 2] = z
        vecs[dst.__id + 3] = 1.0
        return this
    }


    /**
     * 벡터 뺄셈 연산
     */
    open fun sub(dst: Vector3, src0: Vector3, src1: Vector3): MatVecCalculator {
        vecs[dst.__id] = vecs[src0.__id] - vecs[src1.__id]
        vecs[dst.__id + 1] = vecs[src0.__id + 1] - vecs[src1.__id + 1]
        vecs[dst.__id + 2] = vecs[src0.__id + 2] - vecs[src1.__id + 2]
        vecs[dst.__id + 3] = 1.0
        return this
    }

    operator fun Vector3.minus(b: Vector3): Vector3 {
        val out = vec3()
        sub(out, this, b)
        return out
    }

    /**
     * 벡터 스칼라 연산
     */
    open fun scalarProd(dst: Vector3, scl: Double, src1: Vector3): MatVecCalculator {
        vecs[dst.__id] = scl * vecs[src1.__id]
        vecs[dst.__id + 1] = scl * vecs[src1.__id + 1]
        vecs[dst.__id + 2] = scl * vecs[src1.__id + 2]
        vecs[dst.__id + 3] = 1.0
        return this
    }

    operator fun Vector3.times(scalar: Double): Vector3 {
        val out = vec3()
        scalarProd(out, scalar, this)
        return out
    }

    operator fun Double.times(vector: Vector3): Vector3 {
        val out = vec3()
        scalarProd(out, this, vector)
        return out
    }

    operator fun Vector3.unaryMinus(): Vector3 {
        val out = vec3()
        scalarProd(out, -1.0, this)
        return out
    }

    /**
     * +=, -= 부분
     * */
    operator fun Vector3.plusAssign(b: Vector3) {
        add(this, this, b)
    }

    operator fun Vector3.minusAssign(b: Vector3) {
        sub(this, this, b)
    }

    /**
     * 새롭게 벡터를 만드는 함수 [x, y, z, 1]
     */
    public fun vec3(x : Double, y: Double, z: Double): Vector3 {
        val id = __allocVector4(x, y, z)
        return Vector3(id)
    }

    /**
     * 새롭게 벡터를 만드는 함수 [0, 0, 0, 1]
     */
    public fun vec3(): Vector3 {
        val id = __allocVector4(0.0, 0.0, 0.0)
        return Vector3(id)
    }

    protected open fun x(v: Vector3): Double {
        return vecs[v.__id + 0]
    }

    protected open fun y(v: Vector3): Double {
        return vecs[v.__id + 1]
    }

    protected open fun z(v: Vector3): Double {
        return vecs[v.__id + 2]
    }

    protected open fun w(v: Vector3): Double {
        return vecs[v.__id + 3]
    }

    /**
     * 벡터의 크기를 구하는 함수
     */
    protected open fun mag(v: Vector3): Double {
        val o = v.__id
        return sqrt(vecs[o] * vecs[o] + vecs[o + 1] * vecs[o + 1] + vecs[o + 2] * vecs[o + 2])
    }

    protected open fun magSqr(v: Vector3): Double {
        val o = v.__id
        return vecs[o] * vecs[o] + vecs[o + 1] * vecs[o + 1] + vecs[o + 2] * vecs[o + 2]
    }

    /**
     * 벡터를 크기가 1이고 방향은 그대로인 벡터로 normalize하는 함수
     * `
     * Vector3 v = vec3(1,1,1);
     * norm(v,v); -> [0.5773, 0.5773, 0.5773, 1]
    ` *
     */
    protected open fun norm(dst: Vector3, src: Vector3) {
        val o = src.__id
        val out = dst.__id
        val invMag = 1 / sqrt(vecs[o] * vecs[o] + vecs[o + 1] * vecs[o + 1] + vecs[o + 2] * vecs[o + 2])
        vecs[out] = vecs[o] * invMag
        vecs[out + 1] = vecs[o + 1] * invMag
        vecs[out + 2] = vecs[o + 2] * invMag
    }

    /**
     * Linear Transform 선형 변환
     */
    protected open fun LT(mat: Mat4x4, dst: Vector3) {
        val m00: Double
        val m01: Double
        val m02: Double
        val m03: Double
        val m10: Double
        val m11: Double
        val m12: Double
        val m13: Double
        val m20: Double
        val m21: Double
        val m22: Double
        val m23: Double
        val m30: Double
        val m31: Double
        val m32: Double
        val m33: Double

        val mo = mat.__id
        val vo = dst.__id

        m00 = mats[mo + 0]
        m01 = mats[mo + 1]
        m02 = mats[mo + 2]
        m03 = mats[mo + 3]
        m10 = mats[mo + 4]
        m11 = mats[mo + 5]
        m12 = mats[mo + 6]
        m13 = mats[mo + 7]
        m20 = mats[mo + 8]
        m21 = mats[mo + 9]
        m22 = mats[mo + 10]
        m23 = mats[mo + 11]
        m30 = mats[mo + 12]
        m31 = mats[mo + 13]
        m32 = mats[mo + 14]
        m33 = mats[mo + 15]

        val x: Double
        val y: Double
        val z: Double
        val w: Double
        x = vecs[vo]
        y = vecs[vo + 1]
        z = vecs[vo + 2]
        w = vecs[vo + 3]

        vecs[vo] = x * m00 + y * m01 + z * m02 + w * m03
        vecs[vo + 1] = x * m10 + y * m11 + z * m12 + w * m13
        vecs[vo + 2] = x * m20 + y * m21 + z * m22 + w * m23
        vecs[vo + 3] = x * m30 + y * m31 + z * m32 + w * m33
    }

    /**
     * determinant 구하기 (3x3)
     */
    protected open fun det(mat: Mat4x4): Double {
        val o = mat.__id

        // 상단 3x3 로드
        val m00 = mats[o + 0]
        val m01 = mats[o + 1]
        val m02 = mats[o + 2]
        val m10 = mats[o + 4]
        val m11 = mats[o + 5]
        val m12 = mats[o + 6]
        val m20 = mats[o + 8]
        val m21 = mats[o + 9]
        val m22 = mats[o + 10]

        // determinant
        return m00 * (m11 * m22 - m12 * m21) + m01 * (m12 * m20 - m10 * m22) + m02 * (m10 * m21 - m11 * m20)
    }

    /**
     * 새롭게 4x4 행렬을 만드는 함수
     */
    protected open fun mat4x4(
        x0: Double, x1: Double, x2: Double,
        y0: Double, y1: Double, y2: Double,
        z0: Double, z1: Double, z2: Double
    ): Mat4x4 {
        val id = __allocMat4x4(
            x0, x1, x2, 0.0,
            y0, y1, y2, 0.0,
            z0, z1, z2, 0.0,
            0.0, 0.0, 0.0, 1.0
        )
        return Mat4x4(id)
    }

    protected open fun I(): Mat4x4 {
        val id = __allocMat4x4(
            1.0, 0.0, 0.0, 0.0,
            0.0, 1.0, 0.0, 0.0,
            0.0, 0.0, 1.0, 0.0,
            0.0, 0.0, 0.0, 1.0
        )
        return Mat4x4(id)
    }

    /**
     * 새롭게 4x4 행렬을 만드는 함수
     * [v0, v1, v2, 0]
     * [v0, v1, v2, 0]
     * [v0, v1, v2, 0]
     * [0 , 0 , 0 , 1]
     * 과 같은 행렬이 완성됨.
     */
    protected open fun mat4x4(v0: Vector3, v1: Vector3, v2: Vector3): Mat4x4 {
        val id = __allocMat4x4(
            vecs[v0.__id + 0], vecs[v1.__id + 0], vecs[v2.__id + 0], 0.0,
            vecs[v0.__id + 1], vecs[v1.__id + 1], vecs[v2.__id + 1], 0.0,
            vecs[v0.__id + 2], vecs[v1.__id + 2], vecs[v2.__id + 2], 0.0,
            0.0, 0.0, 0.0, 1.0
        )
        return Mat4x4(id)
    }

    protected open fun str(v: Vector3): String {
        return "[" + vecs[v.__id] + ", " + vecs[v.__id + 1] + ", " + vecs[v.__id + 2] + ", " + vecs[v.__id + 3] + "]"
    }

    protected open fun str(m: Mat4x4): String {
        return ("[" + mats[m.__id + 0] + ", " + mats[m.__id + 1] + ", " + mats[m.__id + 2] + ", " + mats[m.__id + 3] + "]\n"
                + "[" + mats[m.__id + 4] + ", " + mats[m.__id + 5] + ", " + mats[m.__id + 6] + ", " + mats[m.__id + 7] + "]\n"
                + "[" + mats[m.__id + 8] + ", " + mats[m.__id + 9] + ", " + mats[m.__id + 10] + ", " + mats[m.__id + 11] + "]\n"
                + "[" + mats[m.__id + 12] + ", " + mats[m.__id + 13] + ", " + mats[m.__id + 14] + ", " + mats[m.__id + 15] + "]\n")
    }

    /**
     * [x, y, z, 1] 반환
     */
    private fun __allocVector4(x: Double, y: Double, z: Double): Int {
        if (this.vecIdx >= this.__VECBUFFSIZE) {
            __resizeVECSIZE()
        }
        val id = vecIdx
        vecs[vecIdx++] = x
        vecs[vecIdx++] = y
        vecs[vecIdx++] = z
        vecs[vecIdx++] = 1.0
        return id
    }

    private fun __resizeVECSIZE() {
        val new__VECBUFFSIZE = this.__VECBUFFSIZE shl 1
        val newVecs = DoubleArray(new__VECBUFFSIZE)
        System.arraycopy(this.vecs, 0, newVecs, 0, this.__VECBUFFSIZE)
        this.vecs = newVecs
        this.__VECBUFFSIZE = new__VECBUFFSIZE
    }

    /**
     * [x, y, z, 1] 반환
     */
    private fun __allocMat4x4(
        x0: Double, x1: Double, x2: Double, x3: Double,
        y0: Double, y1: Double, y2: Double, y3: Double,
        z0: Double, z1: Double, z2: Double, z3: Double,
        w0: Double, w1: Double, w2: Double, w3: Double
    ): Int {
        if (this.matIdx + 4 >= this.__MATBUFFSIZE) {
            __resizeMATSIZE()
        }
        val id = matIdx
        mats[matIdx++] = x0; mats[matIdx++] = x1; mats[matIdx++] = x2; mats[matIdx++] = x3;
        mats[matIdx++] = y0; mats[matIdx++] = y1; mats[matIdx++] = y2; mats[matIdx++] = y3;
        mats[matIdx++] = z0; mats[matIdx++] = z1; mats[matIdx++] = z2; mats[matIdx++] = z3;
        mats[matIdx++] = w0; mats[matIdx++] = w1; mats[matIdx++] = w2; mats[matIdx++] = w3;
        return id
    }

    private fun __resizeMATSIZE() {
        val new__MATBUFFSIZE = this.__MATBUFFSIZE shl 1
        val newMats = DoubleArray(new__MATBUFFSIZE)
        System.arraycopy(this.mats, 0, newMats, 0, this.__MATBUFFSIZE)
        this.vecs = newMats
        this.__MATBUFFSIZE = new__MATBUFFSIZE
    }



    public class VecScope internal constructor(mc: MatVecCalculator) : AutoCloseable {
        private val mc: MatVecCalculator?
        private val v: Int

        init {
            this.mc = mc
            this.v = mc.vecIdx
        }

        override fun close() {
            mc!!.vecIdx = v
        }
    }

    fun setVecScope(): VecScope {
        return VecScope(this)
    }

    public class MatScope(mc: MatVecCalculator) : AutoCloseable {
        private val mc: MatVecCalculator?
        private val m: Int

        init {
            this.mc = mc
            this.m = mc.vecIdx
        }

        override fun close() {
            mc!!.vecIdx = m
        }
    }

    fun setMatScope(): MatScope {
        return MatScope(this)
    }

}


/**
 * Vector3 객체를 표현하기 위한 View.
 * 해당 객체는 절대 외부로 반환하지 말 것.
 * 해당 객체를 이용하고자 한다면 다음처럼 사용할 것.
 * try(VecScope scope - setVecScope()) {..Vector3객체 이용..}
 */
@JvmInline
value class Vector3(val __id: Int)

@JvmInline
value class Mat4x4(val __id: Int)