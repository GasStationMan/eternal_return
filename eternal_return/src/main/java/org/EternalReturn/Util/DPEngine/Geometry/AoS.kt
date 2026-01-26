package org.EternalReturn.Util.DPEngine.Geometry

open class AoS {

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

}