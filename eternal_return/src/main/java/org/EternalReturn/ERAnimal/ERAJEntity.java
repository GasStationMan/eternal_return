package org.EternalReturn.ERAnimal;

import org.EternalReturn.EREntity.EREntity;
import org.EternalReturn.ERPlayer.ERPlayer;
import org.EternalReturn.System.SystemManager;
import org.EternalReturn.util.AJEntity.AJEntity;
import org.EternalReturn.util.AJEntity.AJEntityManager;
import org.EternalReturn.util.Geometry.MathVector.Vec3d;
import org.bukkit.Color;
import org.bukkit.Location;
import org.bukkit.World;
import org.bukkit.entity.*;

import java.util.ArrayList;
import java.util.List;




public class ERAJEntity extends AJEntity {

    /**
     * afterSpawnEvent 이후 entity 필드 초기화됨
     * 그때까지는 erEntity.entity == null
     * */
    protected EREntity erEntity;

    protected boolean isHit;

    protected boolean isShown;

    protected Husk actor;

    private TextDisplay hpbar;
    
    /**
     * 해당 엔티티가 얼마나 많은 플레이어에게 보여지고 있는지 저장
     * */
    private int refCount;

    public void resetRefCount(){
        this.refCount = 0;
    }

    public void addRefCount() {
        this.refCount++;
    }

    public void decreaseRefCount(){
        this.refCount--;
    }

    public int getRefCount() {
        return this.refCount;
    }

    public void summon() {
        AJEntityManager.summon(this, location);
    }


    public enum AnimalState{
        READY,
        ATTACK,
        MOVE,
        DEAD
    }

    public ERAJEntity(String name, Location location) {
        super(name, location);
        this.refCount = 0;
        this.isShown = false;
        this.isHit = false;
    }

    @Override
    protected void afterSummoning() {
        World world = location.getWorld();
        if(world == null){
            throw new NullPointerException("전달된 매개변수 Location에 World 정보가 없습니다.");
        }

        //해당 AJEntity를 조종할 엔티티를 Actor라고 한다.
        //해당 Actor 위에 AJEntity를 태운다.
        actor = (Husk) world.spawnEntity(location, EntityType.HUSK);
        actor.setAdult();
        actor.setAI(false);
        actor.setInvisible(true);
        actor.setSilent(true);

        hpbar = (TextDisplay) world.spawnEntity(location, EntityType.TEXT_DISPLAY);

        //TextComponent textComponent = Component.text("").font("");
        //hpbar.setText(textComponent.content());

        hpbar.setBillboard(Display.Billboard.CENTER);
        hpbar.setBackgroundColor(Color.fromARGB(0,0,0,0));

    }

    /**
     * AJEntity 제거 뿐만 아니라 Actor까지 함께 제거한다.
     */
    @Override
    public void remove() {
        if(rootEntity != null){
            super.remove();
            this.actor.remove();
        }
    }

    @Override
    protected void afterSpawnEvent(Entity spawnedRootEntity){
        if(actor == null){
            throw new NullPointerException("ACTOR가 null입니다.");
        }

        ///actor(CraftHusk)에 2개 이상의 엔티티를 태우려고 시도 시에는 전부 다 내려지는 버그가 있음.
        //

        rootEntity = spawnedRootEntity;
        rootEntity.addPassenger(hpbar);
        actor.addPassenger(rootEntity);
        erEntity.setEntity(actor);
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
     * 해당 ER Animal의 Bar(체력, 이름, 레벨 등을 표시하는 막대)를 가져온다.
     * */
    public TextDisplay getBar(){
        return this.hpbar;
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

    /**
     * 한번 호출 시 isHit의 반환값은 false가 됨.
     * 여러 번 호출하지 말 것.
     * */
    public boolean isHit(){
        return this.isHit;
    }

    public void setHit() {
        this.isHit = true;
    }

    public boolean isShown(){
        return this.isShown;
    }

    public void setShown(boolean bool){
        this.isShown = bool;
    }
}
