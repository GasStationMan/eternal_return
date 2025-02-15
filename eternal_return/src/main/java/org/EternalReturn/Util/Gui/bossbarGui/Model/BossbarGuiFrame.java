package org.EternalReturn.Util.Gui.bossbarGui.Model;

import org.EternalReturn.System.ERPlayer.ERPlayer;
import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.Util.Gui.bossbarGui.Controller.BMouseCursorObserver;
import org.EternalReturn.Util.MathVector.Vec2d;
import org.bukkit.Location;
import org.bukkit.entity.Player;

import net.kyori.adventure.audience.Audience;
import net.kyori.adventure.bossbar.BossBar;
import net.kyori.adventure.text.Component;

import java.util.ArrayList;
import java.util.List;

public class BossbarGuiFrame {

    private BossBar bufferShower;
    private Audience audience;
    private List<Component> components;
    private List<BComponent> bComponents;
    private List<BButton> bButtons;
    private Player player;
    private ERPlayer erPlayer;
    private BComponent cursor;
    private boolean isOpen;

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
    }

    public BossbarGuiFrame(ERPlayer erPlayer){
        this.player = erPlayer.getPlayer();
        this.erPlayer = erPlayer;
        this.isOpen = false;
        this.components = new ArrayList<>(16);
        this.bComponents = new ArrayList<>(16);
        this.bButtons = new ArrayList<>(16);
        this.audience = PluginInstance.adventure().player(player);

        BMouseCursorObserver.getInstance().registerBossbarGui(this);
    }

    //getter
    public BGuiLocation getMousePointerLocation(){
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

    //setter
    public void generate(){
        repaint();
        Component buffer = Component.text("").children(components);
        this.bufferShower = BossBar.bossBar(buffer,0, BossBar.Color.BLUE, BossBar.Overlay.PROGRESS);
    }

    public void add(BComponent bComponent){
        bComponents.add(bComponent);
        if(bComponent instanceof BButton){
            bButtons.add((BButton)bComponent);
        }
    }

    /**
     * BossbarGui객체가 가지고 있는 bComponent 리스트를 kyori component리스트로 바꾸어 <br>
     * 다시 보스바의 이름 버퍼로 표시하는 함수
     * */
    private void repaint(){
        int length = bComponents.size();

        //널체크 + 비우기
        if(components != null){
            components.clear();
        }

        components = new ArrayList<>(64);

        for(int i = 0 ; i < length ; i ++){
            components.add(bComponents.get(i).getComponent());
        }

    }

    /**
     * 마우스커서 위치를 옮기는 함수
     * @param dx 마우스 x방향 변위
     * @param dy 마우스 y방향 변위
     * */
    public void moveMousePointer(int dx, int dy){
        BGuiLocation loc = cursor.getLocation();
        Location pLoc = player.getLocation();

        int xToModify = loc.getX() + dx;
        int yToModify = loc.getY() - dy / 2;


        if((-350 <= xToModify && xToModify <= 350) && (0 <= yToModify && yToModify <= 400)){

            //erPlayer.sendMessage("( " + xToModify + " , " + yToModify + " )");

            cursor.setLocation(xToModify,yToModify);
            repaint();
            bufferShower.name(Component.text("").children(components));
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

    public boolean isOpen() {
        return isOpen;
    }

    /**
     * 마우스커서 위치 업데이트 기능만 따로 뺀 함수 <br>
     * getDegreeDistance(Vec2d secondVector, Vec2d currentVector)함수를 사용함. <br>
     * 디버그 함수 erPlayer.sendMessage()가 주석 처리 되어 있는 지 확인할 것.
     * @return void
     * */
    public void updateMouseCursor(ERPlayer erPlayer){
        Player p = erPlayer.getPlayer();
        Location location = p.getLocation();
        float yaw = location.getYaw();
        float pitch = location.getPitch() * 4;

        Vec2d currentVecX = erPlayer.getRot2dVecX();
        Vec2d secondVecX = new Vec2d(
                Math.cos(Math.toRadians(yaw)),
                Math.sin(Math.toRadians(yaw))
        );
        double distanceOfAngleX = getDegreeDistance(secondVecX,currentVecX);

        Vec2d currentVecY = erPlayer.getRot2dVecY();
        Vec2d secondVecY = new Vec2d(
                Math.cos(Math.toRadians(pitch)),
                Math.sin(Math.toRadians(pitch))
        );
        double distanceOfAngleY = getDegreeDistance(secondVecY,currentVecY);

        if(0.0009765625d <= Math.abs(distanceOfAngleX) || 0.0009765625d <= Math.abs(distanceOfAngleY)){

            moveMousePointer((int)distanceOfAngleX, (int)distanceOfAngleY);

            if(Math.abs(pitch) == 360){
                location.setPitch(-pitch);
                p.teleport(location);
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

}
