
/**
 * 물리 엔진 구현체
 * 벡터 계산, 행렬 계산, 레이캐스팅
 */
public class PhysicsEngine {
    
    private double[] vecs;
    private double[] mats;
    private int vecIdx = 0;
    private int __VECBUFFSIZE = 0;
    private int matIdx = 0;
    private int __MATBUFFSIZE = 0;

    /**
     * 필요한 만큼의 버퍼를 미리 생성
     */
    public PhysicsEngine(int max__VECBUFFSIZE4){
        this.vecs = new double[max__VECBUFFSIZE4 * 4];
        this.mats = new double[max__VECBUFFSIZE4 * 16];
    }

    public PhysicsEngine(){
        this.vecs = new double[128];
        this.vecs = new double[512];
        this.__VECBUFFSIZE = 512;
    }

    /**
     * 벡터들이 쌓인 곳을 전부 치우는 함수.
     * @apiNote
     *  해당 함수 호출 후에 이전까지 할당된 모든 벡터는 유효하지 않게 됨.
     *  유의하여 사용할 것.
     */
    protected void flushVecs(){
        this.vecIdx = 0;
    }

    /**
     * 행렬들이 쌓인 곳을 전부 치우는 함수.
     * @apiNote
     *  해당 함수 호출 후에 이전까지 할당된 모든 행렬은 유효하지 않게 됨.
     *  유의하여 사용할 것.
     */
    protected void flushMats(){
        this.matIdx = 0;
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
    protected PhysicsEngine add(Vector3 dst, Vector3 src0, Vector3 src1){
        vecs[dst.__id]     = vecs[src0.__id]     + vecs[src1.__id];
        vecs[dst.__id + 1] = vecs[src0.__id + 1] + vecs[src1.__id + 1];
        vecs[dst.__id + 2] = vecs[src0.__id + 2] + vecs[src1.__id + 2];
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
     * Linear Transform 선형 변환
     */
    protected void LT(Mat4x4 mat, Vector3 dst){
        double m00, m01, m02, m03;
        double m10, m11, m12, m13;
        double m20, m21, m22, m23;
        double m30, m31, m32, m33;

        m00 = mats[mat.__id + 0 ]; m01 = mats[mat.__id + 1 ]; m02 = mats[mat.__id + 2 ]; m03 = mats[mat.__id + 3 ];
        m10 = mats[mat.__id + 4 ]; m11 = mats[mat.__id + 5 ]; m12 = mats[mat.__id + 6 ]; m13 = mats[mat.__id + 7 ];
        m20 = mats[mat.__id + 8 ]; m21 = mats[mat.__id + 9 ]; m22 = mats[mat.__id + 10]; m23 = mats[mat.__id + 11];
        m30 = mats[mat.__id + 12]; m31 = mats[mat.__id + 13]; m32 = mats[mat.__id + 14]; m33 = mats[mat.__id + 15];
        
        double x, y, z, w;
        x = vecs[dst.__id]; y = vecs[dst.__id + 1]; z = vecs[dst.__id + 2]; w = vecs[dst.__id + 3];

        vecs[dst.__id    ] = x * m00 + y * m01 + z * m02 + w * m03;
        vecs[dst.__id + 1] = x * m10 + y * m11 + z * m12 + w * m13;
        vecs[dst.__id + 2] = x * m20 + y * m21 + z * m22 + w * m23;
        vecs[dst.__id + 3] = x * m30 + y * m31 + z * m32 + w * m33;
    }


    /**
     * 새롭게 4x4 행렬을 만드는 함수    
     */
    protected Mat4x4 mat4x4(
        double x0, double x1, double x2, double x3, 
        double y0, double y1, double y2, double y3,
        double z0, double z1, double z2, double z3
    ){
        int id = __allocMat4x4(
            x0, x1, x2, x3, 
            y0, y1, y2, y3,
            z0, z1, z2, z3);
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
}


