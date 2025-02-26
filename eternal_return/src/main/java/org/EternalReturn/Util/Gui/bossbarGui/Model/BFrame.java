package org.EternalReturn.Util.Gui.bossbarGui.Model;

import org.EternalReturn.System.ERPlayer.ERPlayer;
import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.Util.Physics.MathVector.Vec2d;
import org.bukkit.Location;
import org.bukkit.entity.Player;

import net.kyori.adventure.audience.Audience;
import net.kyori.adventure.bossbar.BossBar;
import net.kyori.adventure.text.Component;
import org.jetbrains.annotations.NotNull;

import java.util.*;

public class BFrame implements BComponentManager{

    private BossBar bufferShower;
    private Audience audience;
    private List<Component> components;
    private List<BComponent> bComponents;
    private List<BButton> bButtons;
    private Player player;
    private ERPlayer erPlayer;
    private BComponent cursor;
    private boolean isOpen;
    private String name;

    private BButton currentButtonUnderCursor;

    public void free() {
        bufferShower.removeViewer(audience);

        if(!components.isEmpty()){
            components.clear();
        }
        if(!bComponents.isEmpty()){
            for(BComponent bcmp : bComponents){
                bcmp.free();
            }
            bComponents.clear();
        }
        if(!bButtons.isEmpty()){
            bButtons.clear();
        }
        components = null;
        bComponents = null;
        bufferShower = null;
        audience = null;
        player = null;
        erPlayer = null;
        cursor = null;
        currentButtonUnderCursor = null;
    }

    public BFrame(ERPlayer erPlayer, @NotNull String name){
        this.player = erPlayer.getPlayer();
        this.erPlayer = erPlayer;
        this.isOpen = false;
        this.components = new ArrayList<>(16);
        this.bComponents = new ArrayList<>(16);
        this.bButtons = new ArrayList<>(16);
        this.audience = PluginInstance.adventure().player(player);
        this.currentButtonUnderCursor = null;
        this.name = name;
    }

    //getter
    public BLocation getMousePointerLocation(){
        if(cursor == null){
            return null;
        }
        return cursor.getLocation();
    }

    public BComponent getMouseCursor(){
        return cursor;
    }

    public List<BButton> getBButtons(){
        return bButtons;
    }

    public BButton getCurrentButtonUnderCursor(){
        return currentButtonUnderCursor;
    }

    @Override
    public List<BComponent> getBComponents() {
        return bComponents;
    }

    public boolean isOpen(){
        return isOpen;
    }

    //setter
    protected void generate(){
        Component buffer = Component.text("");
        this.bufferShower = BossBar.bossBar(buffer,0, BossBar.Color.BLUE, BossBar.Overlay.PROGRESS);
        repaint();
    }

    public void add(BComponent bComponent){
        bComponent.setBComponentManager(this);
        bComponents.add(bComponent);
        if(bComponent instanceof BButton){
            bButtons.add((BButton)bComponent);
        }
    }

    /**
     * BossbarGui객체가 가지고 있는 bComponent 리스트를 kyori component리스트로 바꾸어 <br>
     * 다시 보스바의 이름 버퍼로 표시하는 함수<br>
     * BFS를 베이스로 구현
     * 
     * */
    public void repaint(){

        //널체크 + 비우기
        if(components != null){
            components.clear();
        }

        Queue<BComponentManager> bCmpStackFrame = new LinkedList<>();
        bCmpStackFrame.add(this);

        components = new ArrayList<>(64);

        while(!bCmpStackFrame.isEmpty()){
            BComponentManager curBCmpManager = bCmpStackFrame.remove();
            List<BComponent> bCmps = curBCmpManager.getBComponents();

            for(BComponent bComponent : bCmps){
                if(bComponent instanceof BFontComponent){
                    components.add(((BFontComponent)bComponent).getComponent());
                }

                //BComponentManager라면 스택에 넣는다.
                else if(bComponent instanceof BComponentManager){

                    bCmpStackFrame.add((BComponentManager) bComponent);
                }
            }
        }
        bufferShower.name(Component.text("").children(components));
    }

    /**
     * 마우스커서 위치를 옮기는 함수
     * @param dx 마우스 x방향 변위
     * @param dy 마우스 y방향 변위
     * */
    public void moveMousePointer(int dx, int dy){
        BLocation loc = cursor.getLocation();
        Location pLoc = player.getLocation();

        int xToModify;
        int yToModify;

        xToModify = loc.getX() + dx / 2;
        yToModify = loc.getY() - dy / 2;
        if((-350 <= xToModify && xToModify <= 350) && (0 <= yToModify && yToModify <= 400)){
            cursor.setLocation(xToModify,yToModify);
            repaint();
        }
    }

    protected void setMouseCursor(BComponent mouseCursor){
        this.cursor = mouseCursor;
    }

    public void open() {
        isOpen = true;
        bufferShower.addViewer(audience);
    }

    public void close(){
        erPlayer.setRot2dVecX(new Vec2d(Math.cos(0),Math.sin(0)));
        erPlayer.setRot2dVecY(new Vec2d(Math.cos(0),Math.sin(0)));
        isOpen = false;
        bufferShower.removeViewer(audience);
    }

    /**
     * 마우스커서 위치 업데이트 기능 & 또한 커서가 버튼 위에 있는지 확인하는 기능 <br>
     * getDegreeDistance(Vec2d secondVector, Vec2d currentVector)함수를 사용함. <br>
     * */
    public void updateMouseCursor(ERPlayer erPlayer){
        Player p = erPlayer.getPlayer();
        Location location = p.getLocation();
        float yaw = location.getYaw() * 2;
        float pitch = location.getPitch() * 4;

        Vec2d secondVecX ;
        double distanceOfAngleX = getDegreeDistance(
                secondVecX = new Vec2d(
                        Math.cos(Math.toRadians(yaw)),
                        Math.sin(Math.toRadians(yaw))
                ),erPlayer.getRot2dVecX());


        Vec2d secondVecY;
        double distanceOfAngleY = getDegreeDistance(
                secondVecY = new Vec2d(
                        Math.cos(Math.toRadians(pitch)),
                        Math.sin(Math.toRadians(pitch))
        ),erPlayer.getRot2dVecY());



        if(0 < Math.abs(distanceOfAngleX) || 0 < Math.abs(distanceOfAngleY)){

            moveMousePointer(
                    (int)distanceOfAngleX,
                    (int)distanceOfAngleY
            );

            if(Math.abs(pitch) == 360){
                location.setPitch(-pitch);
                p.teleport(location);
            }
            
            //버튼이 있는 경우 마우스 커서 위치와 버튼의 경계를 감지
            if(!bButtons.isEmpty()){
                detectButtonUnderCursor();
            }

            erPlayer.setRot2dVecX(secondVecX);
            erPlayer.setRot2dVecY(secondVecY);

        }

    }

    /**
     * 두 벡터의 각도의 크기와 방향을 같이 반환.
     * @return 두 벡터간 Degree 값 * 외적방향
     * */
    private double getDegreeDistance(Vec2d secondVector, Vec2d currentVector){
        double direction = currentVector.crossProd(secondVector);
        double distanceOfAngle = Math.toDegrees(Vec2d.getAngleOfVectors(secondVector, currentVector));
        return direction > 0 ? distanceOfAngle : -distanceOfAngle;
    }

    public void detectButtonUnderCursor() {
        BComponent cursor = this.getMouseCursor();
        if(cursor == null){
            return;
        }
        BLocation mloc = cursor.getLocation();

        boolean cursorIsOutOfButton = true;

        for(BButton bButton : this.getBButtons()){
            if(bButton.getButtonPolygon() == null){
                continue;
            }

            if(bButton.dotInPoly(mloc,700)){
                bButton.setHoverState(true);
                currentButtonUnderCursor = bButton;
                cursorIsOutOfButton = false;
            }
            else{
                bButton.setHoverState(false);
            }
        }

        if(cursorIsOutOfButton){
            currentButtonUnderCursor = null;
        }

    }

    public String getName() {
        return name;
    }
}
