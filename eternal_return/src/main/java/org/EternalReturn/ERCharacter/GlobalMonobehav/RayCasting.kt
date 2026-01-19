package org.EternalReturn.ERCharacter.GlobalMonobehav

import org.EternalReturn.ERCharacter.ERCharacterMonobehaviour
import org.EternalReturn.ERCharacter.Event.CharacterLeftClickEvent
import org.EternalReturn.EREntity.EREntity
import org.EternalReturn.Util.Monobehaviour.MonobehaviourEvent
import org.EternalReturn.Util.physics.Geometry.Cylinder
import org.EternalReturn.Util.physics.Geometry.InfCylinder
import org.EternalReturn.Util.physics.Geometry.InfStraightLine
import org.EternalReturn.Util.physics.Geometry.MatVecCalculator.Vector3
import org.EternalReturn.Util.physics.Geometry.PhysicsEngine
import org.bukkit.entity.Entity


public class RayCasting : ERCharacterMonobehaviour<CharacterLeftClickEvent>() {

    override fun start(event: CharacterLeftClickEvent) {
        val pdir = getDir(getPlayer() as Entity);
        val pPos = getPos(getPlayer() as Entity);

        val poi = physicsEngine.vec3();

        for(erEntity in getMonobehavActorList()){
            if(erEntity !is EREntity){
                continue;
            }

            val collider = erEntity.collider;

            if(collider is Cylinder){
                physicsEngine.fgetIntersectPoint(poi, pPos, pdir, collider);
            }

        }

    }

    override fun update(eventList: MutableList<MonobehaviourEvent>) {

    }
}