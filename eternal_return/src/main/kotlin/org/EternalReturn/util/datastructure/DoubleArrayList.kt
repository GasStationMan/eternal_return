package org.EternalReturn.util.datastructure

import kotlin.times

class DoubleArrayList {

    private var array: DoubleArray
    private var idx: Int = 0
    private var __BUFFERSIZE = 0

    constructor(BUFFSIZE: Int) {
        this.array = DoubleArray(BUFFSIZE);
        this.__BUFFERSIZE = BUFFSIZE;
    }

    fun __resize() {
        val new__BUFFSIZE = this.__BUFFERSIZE shl 1
        val newArray = DoubleArray(new__BUFFSIZE)
        System.arraycopy(this.array, 0, newArray, 0, this.__BUFFERSIZE)
        this.array = newArray
        this.__BUFFERSIZE = new__BUFFSIZE
    }

    operator fun get(index : Int): Double{
        return array[index]
    }

    operator fun set(index : Int, value : Double){
        array[index] = value;
    }

    fun setf(index : Int, value : Double){
        if(idx >= __BUFFERSIZE){
            __resize();
        }
        array[index] = value;
    }

    fun getf(index : Int) : Double{
        if(idx >= __BUFFERSIZE){
            throw RuntimeException("Array out of range error");
        }
        return array[index];
    }

}