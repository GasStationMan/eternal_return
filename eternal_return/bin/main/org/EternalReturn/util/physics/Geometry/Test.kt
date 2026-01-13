package org.EternalReturn.util.physics.Geometry

import org.EternalReturn.Util.Physics.Geometry.MatVecCalculator
import org.joml.Vector3f
import sun.misc.Unsafe
import java.lang.invoke.MethodHandles
import java.lang.invoke.VarHandle
import java.nio.ByteOrder
import javax.print.DocFlavor

typealias Vector3 = MatVecCalculator.Vector3


class TestClass : MatVecCalculator(){



    fun runTest(){

        for(i in 0..31){
            println(i);
            val vec3 : Vector3 = vec3();
        }

        val vec3 = vec3();

        println("test")

    }
}


fun main(){
    //val test = TestClass()
    //test.runTest()

}




