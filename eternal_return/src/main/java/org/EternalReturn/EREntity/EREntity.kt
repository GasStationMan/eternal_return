package org.EternalReturn.EREntity

import org.EternalReturn.EREntity.GlobalMonobehav.Stun
import org.EternalReturn.System.PluginInstance
import org.EternalReturn.util.dpengine.behaviour.MonobehaviourActor
import org.EternalReturn.util.dpengine.geometry.Collider
import org.EternalReturn.util.dpengine.geometry.GeometryModule
import org.EternalReturn.util.dpengine.geometry.Vector3
import org.EternalReturn.util.dpengine.behaviour.Monobehaviour
import org.EternalReturn.util.dpengine.behaviour.MonobehaviourEvent
import org.EternalReturn.util.dpengine.command.SetSpigotEntityPosition
import org.EternalReturn.util.dpengine.command.SetSpigotEntityVelocity
import org.bukkit.entity.Entity
import kotlin.math.cos
import kotlin.math.sin

/**
 * 모든 EREntity의 Subclass에게 동시에 통용되는 성질을 저장하는 곳.
 *  - 생성자에 위험한 구문이 껴 있음. 그것만큼은 알아둘 것.
 *  - Entity는 처음에 init 되어있지 않음. 수동적으로 set 해주어야 함.
 */
abstract class EREntity( // extends MonobehaviourActor()

    /**
     * 해당 MonobehaviourActor의 Collider 설정
     */
    val collider: Collider

) : MonobehaviourActor() {

    /**
     * 해당 MonobehaviourActor의 MNS 객체 설정
     */
    var entity: Entity? = null

    val geometryModule : GeometryModule;

    init {


        /**이거 존나 위험한 구문임. 나중에 어떻게든 수정해야 할 것. */
        val monobehaviourModule = PluginInstance.getEREngine().monobehaviourModule;
        monobehaviourModule.registerMonobehaviourActor(this);
        this.monobehaviourModule = monobehaviourModule;
        geometryModule = monobehaviourModule.dpEngine.geometryModule;
        /**이거 존나 위험한 구문임. 나중에 어떻게든 수정해야 할 것.
         * 해당 구문의 책임은 DPEngine에게 위임해야 할 것.
         * */

        //Monobehaviour 등록
        this.registerMonobehaviour(Stun() as Monobehaviour<out MonobehaviourEvent>)
    }

    /**
     * 플레이어의 위치벡터 + 방향벡터를 얻어온다.
     * No Scoping
     */

    fun getDirection(): Vector3 {
        val location = entity!!.location
        val radX = Math.toRadians(location.yaw.toDouble())
        val radY = Math.toRadians(location.pitch.toDouble())
        val xz = cos(radY)
        return this.geometryModule.vec3(-xz * sin(radX), -sin(radY), xz * cos(radX));
    }

    fun getPosition(): Vector3 {
        val location = entity!!.location
        return this.geometryModule.vec3(location.x, location.y, location.z)
    }

    fun setPosition(pos : Vector3) {
        val x = geometryModule.x(pos);
        val y = geometryModule.y(pos);
        val z = geometryModule.z(pos);
        this.geometryModule.dpEngine.appendCommandQueue(SetSpigotEntityPosition(entity!!, x, y, z))
    }

    fun setVelocity(pos : Vector3){
        val x = geometryModule.x(pos);
        val y = geometryModule.y(pos);
        val z = geometryModule.z(pos);
        this.geometryModule.dpEngine.appendCommandQueue(SetSpigotEntityVelocity(entity!!, x, y, z))
    }


}