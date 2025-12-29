import java.lang.foreign.MemorySegment.Scope;

/**
 * 벡터 계산, 행렬 계산 구현체
 */
public class MatVecCalculator {
    
    private double[] vecs;
    private double[] mats;
    int vecIdx = 0;
    private int __VECBUFFSIZE = 0;
    int matIdx = 0;
    private int __MATBUFFSIZE = 0;

    private int[] vecStack = new int[64];
    private int vecStackIdx = 0;
    private int[] matStack = new int[64];
    private int matStackIdx = 0;

    public void debugStack(){
        System.out.println(
            "Current vector stack pointer : " + this.vecStackIdx
            + "\nCurrent vector buffer nextAllocIdx : " + this.vecIdx
            + "\nCurrent matrix stack pointer : " + this.matStackIdx
            + "\nCurrent matrix buffer nextAllocIdx : " + this.matIdx
        );
    }

    public int vecIdx(){return this.vecIdx;}

    public int matIdx(){return this.matIdx;}

    /**
     * 필요한 만큼의 버퍼를 미리 생성
     */
    public MatVecCalculator(int BUFFSIZE4){
        this.vecs = new double[BUFFSIZE4 * 4];
        this.mats = new double[BUFFSIZE4 * 16];
        this.__VECBUFFSIZE = BUFFSIZE4 * 4;
        this.__MATBUFFSIZE = BUFFSIZE4 * 16;
    }

    public MatVecCalculator(){
        this.vecs = new double[128];
        this.mats = new double[512];
        this.__VECBUFFSIZE = 128;
        this.__MATBUFFSIZE = 512;
    }

    /**
     * 벡터들이 쌓인 곳을 전부 치우는 함수.
     * @apiNote
     *  해당 함수 호출 후에 이전까지 할당된 모든 벡터는 유효하지 않게 됨.
     *  유의하여 사용할 것.
     */
    protected void flushVecs(){
        this.vecIdx = 0;
        this.vecStackIdx = 0;
    }

    protected void pushVec(){
        if (this.vecStackIdx == 64)
            throw new IllegalStateException("vec stack overflow");
        this.vecStack[this.vecStackIdx++] = this.vecIdx;
    }

    protected void popVec(){
        if (this.vecStackIdx == 0)
            throw new IllegalStateException("vec stack underflow");
        this.vecIdx = this.vecStack[--this.vecStackIdx];
    }

    /**
     * 행렬들이 쌓인 곳을 전부 치우는 함수.
     * @apiNote
     *  해당 함수 호출 후에 이전까지 할당된 모든 행렬은 유효하지 않게 됨.
     *  유의하여 사용할 것.
     */
    protected void flushMats(){
        this.matIdx = 0;
        this.matStackIdx = 0;
    }

    protected void pushMat(){
        if (this.matStackIdx == 64)
            throw new IllegalStateException("mat stack overflow");
        this.matStack[this.matStackIdx++] = this.matIdx;
    }

    protected void popMat(){
        if (this.matStackIdx == 0)
            throw new IllegalStateException("mat stack underflow");
        this.matIdx = this.matStack[--this.matStackIdx];
    }

    /**
     * 내적 연산
     */
    protected double dot(Vector3 src0, Vector3 src1){
        return vecs[src0.__id] * vecs[src1.__id] 
        + vecs[src0.__id + 1] * vecs[src1.__id + 1] 
        + vecs[src0.__id + 2] * vecs[src1.__id + 2];
    }

    /**
     * 외적 연산, 순서에 주의 (dst = src0 x src1)
     */
    protected void cross(Vector3 dst, Vector3 src0, Vector3 src1){

        double x0, y0, z0, x1, y1, z1;  
        x0 = vecs[src0.__id]; y0 = vecs[src0.__id + 1]; z0 = vecs[src0.__id + 2];
        x1 = vecs[src1.__id]; y1 = vecs[src1.__id + 1]; z1 = vecs[src1.__id + 2];
        
        // i  j  k
        // x0 y0 z0
        // x1 y1 z1
        vecs[dst.__id    ] = y0 * z1 - z0 * y1;
        vecs[dst.__id + 1] = z0 * x1 - x0 * z1;
        vecs[dst.__id + 2] = x0 * y1 - y0 * x1;

    }

    /**
     * 벡터 덧셈 연산
     */
    protected MatVecCalculator add(Vector3 dst, Vector3 src0, Vector3 src1){
        vecs[dst.__id]     = vecs[src0.__id]     + vecs[src1.__id];
        vecs[dst.__id + 1] = vecs[src0.__id + 1] + vecs[src1.__id + 1];
        vecs[dst.__id + 2] = vecs[src0.__id + 2] + vecs[src1.__id + 2];
        vecs[dst.__id + 3] = 1;
        return this;
    }

    /**
     * 벡터 대입 연산
     */
    protected MatVecCalculator set(Vector3 dst, Vector3 src0){
        vecs[dst.__id]     = vecs[src0.__id]    ;
        vecs[dst.__id + 1] = vecs[src0.__id + 1];
        vecs[dst.__id + 2] = vecs[src0.__id + 2];
        vecs[dst.__id + 3] = 1;
        return this;
    }

    /**
     * 벡터 뺄셈 연산
     */
    protected MatVecCalculator sub(Vector3 dst, Vector3 src0, Vector3 src1){
        vecs[dst.__id]     = vecs[src0.__id]     - vecs[src1.__id];
        vecs[dst.__id + 1] = vecs[src0.__id + 1] - vecs[src1.__id + 1];
        vecs[dst.__id + 2] = vecs[src0.__id + 2] - vecs[src1.__id + 2];
        vecs[dst.__id + 3] = 1;
        return this;
    }

    /**
     * 벡터 스칼라 연산
     */
    protected MatVecCalculator scalarProd(Vector3 dst, double scl, Vector3 src1){
        vecs[dst.__id]     = scl * vecs[src1.__id];
        vecs[dst.__id + 1] = scl * vecs[src1.__id + 1];
        vecs[dst.__id + 2] = scl * vecs[src1.__id + 2];
        vecs[dst.__id + 3] = 1;
        return this;
    }

    /**
     * 새롭게 벡터를 만드는 함수 [x, y, z, 1]
     */
    protected Vector3 vec3(double x, double y, double z){
        int id = __allocVector4(x, y, z);
        return new Vector3(id);
    }

    /**
     * 새롭게 벡터를 만드는 함수 [0, 0, 0, 1]
     */
    protected Vector3 vec3(){
        int id = __allocVector4(0, 0, 0);
        return new Vector3(id);
    }

    /**
     * 벡터의 크기를 구하는 함수
     */
    protected double mag(Vector3 v){
        int o = v.__id;
        return Math.sqrt(vecs[o]*vecs[o] + vecs[o + 1]*vecs[o + 1] + vecs[o + 2]*vecs[o + 2]);
    }

    protected double magSqr(Vector3 v){
        int o = v.__id;
        return vecs[o]*vecs[o] + vecs[o + 1]*vecs[o + 1] + vecs[o + 2]*vecs[o + 2];
    }

    /**
     * 벡터의 크기를 구하는 함수
     */
    protected void norm(Vector3 dst, Vector3 src){
        int o = src.__id;
        int out = dst.__id;
        double invMag = 1 / Math.sqrt(vecs[o]*vecs[o] + vecs[o + 1]*vecs[o + 1] + vecs[o + 2]*vecs[o + 2]);
        vecs[out    ] = vecs[o    ] * invMag;
        vecs[out + 1] = vecs[o + 1] * invMag;
        vecs[out + 2] = vecs[o + 2] * invMag; 
    }

    /**
     * Linear Transform 선형 변환
     */
    protected void LT(Mat4x4 mat, Vector3 dst){
        double m00, m01, m02, m03;
        double m10, m11, m12, m13;
        double m20, m21, m22, m23;
        double m30, m31, m32, m33;

        int mo = mat.__id;
        int vo = dst.__id;

        m00 = mats[mo + 0 ]; m01 = mats[mo + 1 ]; m02 = mats[mo + 2 ]; m03 = mats[mo + 3 ];
        m10 = mats[mo + 4 ]; m11 = mats[mo + 5 ]; m12 = mats[mo + 6 ]; m13 = mats[mo + 7 ];
        m20 = mats[mo + 8 ]; m21 = mats[mo + 9 ]; m22 = mats[mo + 10]; m23 = mats[mo + 11];
        m30 = mats[mo + 12]; m31 = mats[mo + 13]; m32 = mats[mo + 14]; m33 = mats[mo + 15];
        
        double x, y, z, w;
        x = vecs[vo]; y = vecs[vo + 1]; z = vecs[vo + 2]; w = vecs[vo + 3];

        vecs[vo    ] = x * m00 + y * m01 + z * m02 + w * m03;
        vecs[vo + 1] = x * m10 + y * m11 + z * m12 + w * m13;
        vecs[vo + 2] = x * m20 + y * m21 + z * m22 + w * m23;
        vecs[vo + 3] = x * m30 + y * m31 + z * m32 + w * m33;
    }

    /**
     * determinant 구하기 (3x3)
     */
    protected double det(Mat4x4 mat){
        int o = mat.__id;

        // 상단 3x3 로드
        double m00 = mats[o + 0 ], m01 = mats[o + 1], m02 = mats[o + 2 ];
        double m10 = mats[o + 4 ], m11 = mats[o + 5], m12 = mats[o + 6 ];
        double m20 = mats[o + 8 ], m21 = mats[o + 9], m22 = mats[o + 10];

        // determinant
        return m00 * (m11 * m22 - m12 * m21) + m01 * (m12 * m20 - m10 * m22) + m02 * (m10 * m21 - m11 * m20);
    }

    /**
     * 새롭게 4x4 행렬을 만드는 함수   
     */
    protected Mat4x4 mat4x4(
        double x0, double x1, double x2, 
        double y0, double y1, double y2,
        double z0, double z1, double z2
    ){
        int id = __allocMat4x4(
            x0, x1, x2, 0, 
            y0, y1, y2, 0,
            z0, z1, z2, 0,
            0, 0, 0, 1);
        return new Mat4x4(id);
    }

    protected Mat4x4 I(){
        int id = __allocMat4x4(
            1, 0, 0, 0, 
            0, 1, 0, 0,
            0, 0, 1, 0,
            0, 0, 0, 1);
        return new Mat4x4(id);
    }

    /**
     * 새롭게 4x4 행렬을 만드는 함수 <p>
     *      [v0, v1, v2, 0] <p>
     *      [v0, v1, v2, 0] <p>
     *      [v0, v1, v2, 0] <p>
     *      [0 , 0 , 0 , 1] <p>
     * 과 같은 행렬이 완성됨.
     */
    protected Mat4x4 mat4x4(Vector3 v0, Vector3 v1, Vector3 v2){
        int id = __allocMat4x4(
            vecs[v0.__id + 0], vecs[v1.__id + 0], vecs[v2.__id + 0], 0,
            vecs[v0.__id + 1], vecs[v1.__id + 1], vecs[v2.__id + 1], 0,
            vecs[v0.__id + 2], vecs[v1.__id + 2], vecs[v2.__id + 2], 0,
            0, 0, 0, 1);
        return new Mat4x4(id);
    }

    protected String str(Vector3 v){
        return "[" + vecs[v.__id] + ", " + vecs[v.__id + 1] + ", " + vecs[v.__id + 2] + ", " + vecs[v.__id + 3] +"]";
    }

    protected String str(Mat4x4 m){
        return 
              "[" + mats[m.__id + 0 ] + ", " + mats[m.__id + 1 ] + ", " + mats[m.__id + 2 ] + ", " + mats[m.__id + 3 ] + "]\n" 
            + "[" + mats[m.__id + 4 ] + ", " + mats[m.__id + 5 ] + ", " + mats[m.__id + 6 ] + ", " + mats[m.__id + 7 ] + "]\n" 
            + "[" + mats[m.__id + 8 ] + ", " + mats[m.__id + 9 ] + ", " + mats[m.__id + 10] + ", " + mats[m.__id + 11] + "]\n"
            + "[" + mats[m.__id + 12] + ", " + mats[m.__id + 13] + ", " + mats[m.__id + 14] + ", " + mats[m.__id + 15] + "]\n";
    }

    /**
     * [x, y, z, 1] 반환
     */
    private int __allocVector4(double x, double y, double z){
        if(this.vecIdx + 4 > this.__VECBUFFSIZE){
            __resizeVECSIZE();
        }
        int id = vecIdx;
        vecs[vecIdx++] = x;
        vecs[vecIdx++] = y;
        vecs[vecIdx++] = z;
        vecs[vecIdx++] = 1;
        return id;
    }

    private void __resizeVECSIZE(){
        int new__VECBUFFSIZE = this.__VECBUFFSIZE << 1;
        double[] newVecs = new double[this.__VECBUFFSIZE];
        System.arraycopy(this.vecs, 0, newVecs, 0, this.__VECBUFFSIZE);
        this.vecs = newVecs;
        this.__VECBUFFSIZE = new__VECBUFFSIZE;
    }

    /**
     * [x, y, z, 1] 반환
     */
    private int __allocMat4x4(
        double x0, double x1, double x2, double x3, 
        double y0, double y1, double y2, double y3,
        double z0, double z1, double z2, double z3,
        double w0, double w1, double w2, double w3
    ){
        if(this.matIdx + 4 > this.__MATBUFFSIZE){
            __resizeMATSIZE();
        }
        int id = matIdx;
        mats[matIdx++] = x0; mats[matIdx++] = x1; mats[matIdx++] = x2; mats[matIdx++] = x3;
        mats[matIdx++] = y0; mats[matIdx++] = y1; mats[matIdx++] = y2; mats[matIdx++] = y3;
        mats[matIdx++] = z0; mats[matIdx++] = z1; mats[matIdx++] = z2; mats[matIdx++] = z3;
        mats[matIdx++] = w0; mats[matIdx++] = w1; mats[matIdx++] = w2; mats[matIdx++] = w3;
        return id;
    }

    private void __resizeMATSIZE(){
        int new__MATBUFFSIZE = this.__MATBUFFSIZE << 1;
        double[] newMats = new double[this.__MATBUFFSIZE];
        System.arraycopy(this.mats, 0, newMats, 0, this.__MATBUFFSIZE);
        this.vecs = newMats;
        this.__MATBUFFSIZE = new__MATBUFFSIZE;
    }

    public final class Vector3 {
        private final int __id;
        public Vector3(int vecsvecIdxID){this.__id = vecsvecIdxID;}
    }

    public final class Mat4x4{
        private final int __id;
        public Mat4x4(int matIdxID){this.__id = matIdxID;}
    }

    final class VecScope implements AutoCloseable{
        
        private final MatVecCalculator mc;
        private final int v;

        VecScope(MatVecCalculator mc) {
            this.mc = mc;
            this.v = mc.vecIdx;
        }

        @Override
        public void close() {
            mc.vecIdx = v;
        }
    
    }

    protected VecScope setVecScope() {
        return new VecScope(this);
    }

    final class MatScope implements AutoCloseable{
        
        private final MatVecCalculator mc;
        private final int m;

        MatScope(MatVecCalculator mc) {
            this.mc = mc;
            this.m = mc.vecIdx;
        }

        @Override
        public void close() {
            mc.vecIdx = m;
        }
    
    }

    protected MatScope setMatScope() {
        return new MatScope(this);
    }

}


