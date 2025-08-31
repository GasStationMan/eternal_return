package org.EternalReturn.System.ERAnimal;

import org.EternalReturn.System.ERPlayer.ERPlayer;
import org.EternalReturn.System.SystemManager;
import org.EternalReturn.Util.AnimatedJAVAEntity.AJEntity;
import org.EternalReturn.Util.Physics.Geometry.Collider;
import org.EternalReturn.Util.Physics.MathVector.Vec3d;
import org.bukkit.Location;
import org.bukkit.World;
import org.bukkit.entity.*;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;




public abstract class ERAnimal extends AJEntity {

    private boolean isHit = false;

    private Husk actor;

    private @NotNull Collider collider;

    private TextDisplay bar;

    public ERAnimal(String name, @NotNull Collider hitbox) {
        super(name);
        this.collider = hitbox;
    }

    @Override
    protected void afterSummoning(Location location) {
        World world = location.getWorld();
        if(world == null){
            throw new NullPointerException("전달된 매개변수 Location에 World 정보가 없습니다.");
        }
        actor = (Husk) world.spawnEntity(location, EntityType.HUSK);
        actor.setAI(false);
        actor.setInvisible(true);
        actor.setSilent(true);
    }

    @Override
    protected void afterSpawnEvent(Entity rootEntity){
        if(actor == null){
            throw new NullPointerException("ACTOR가 null입니다.");
        }
        actor.addPassenger(rootEntity);
    }


    //getter
    /**
     * 해당 객체의 ACTOR을 얻어온다. <br>
     * @ACTOR : 해당 객체가 참조하는 AJEntity의 rootEntity를 passenger로 삼는 엔티티를 말한다.
     * */
    public Entity getActor(){
        return this.actor;
    }

    /**
     * 해당 ER Animal의 Collider를 가져온다.
     * */
    public @NotNull Collider getCollider(){
        return this.collider;
    }

    /**
     * 해당 ER Animal의 Bar(체력, 이름, 레벨 등을 표시하는 막대)를 가져온다.
     * */
    public TextDisplay getBar(){
        return this.bar;
    }

    /**
     * 선형탐색을 통해 범위 내의 플레이어를 가져옴 O(N)
     * */
    protected List<ERPlayer> getPlayersInRange(double radius) {
        double r2 = radius * radius;

        List<ERPlayer> list = new ArrayList<>(32);
        List<ERPlayer> epList = SystemManager.getERPlayerList();

        for(ERPlayer ep : epList){
            if(getDistSq(ep) < r2){
                list.add(ep);
            }
        }
        return list;
    }

    public Vec3d getPos(){
        return new Vec3d(actor.getLocation());
    }

    /**
     * 플레이어와의 거리의 제곱을 구하는 클래스.
     * */
    private double getDistSq(ERPlayer ep){
        return Vec3d.getSquareDistance(ep.getPos(), new Vec3d(actor.getLocation()));
    }

    public boolean isHit(){
        return this.isHit;
    }

}
