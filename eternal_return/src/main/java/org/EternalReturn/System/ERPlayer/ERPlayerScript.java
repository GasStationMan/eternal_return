package org.EternalReturn.System.ERPlayer;

import org.EternalReturn.Util.Gui.bossbarGui.Model.BossbarGuiFrame;
import org.EternalReturn.Util.MathVector.Vec2d;
import org.EternalReturn.Util.ScriptUtill.Script;
import org.EternalReturn.System.SystemManager;
import org.bukkit.Location;
import org.bukkit.entity.Player;

import java.util.HashMap;

public class ERPlayerScript implements Script {
    private HashMap<Player,ERPlayer> erPlayerHashMap;

    public ERPlayerScript(){
        erPlayerHashMap = SystemManager.getInstance().getErPlayerHashMap();
    }

    @Override
    public void update() {

        for(ERPlayer erPlayer : erPlayerHashMap.values()){

            Player p = erPlayer.getPlayer();
            Location location = null;

            //보스바 gui업데이트
            if(erPlayer.isKioskGuiOpened()){
                updateMouseCursor(erPlayer, erPlayer.getKioskGui());
            }
            else if(erPlayer.isHyperloopGuiOpened()){
                updateMouseCursor(erPlayer, erPlayer.getHyperloop());
            }
        }
    }

    /**
     * 마우스커서 위치 업데이트 기능만 따로 뺀 함수 <br>
     * getDegreeDistance(Vec2d secondVector, Vec2d currentVector)함수를 사용함. <br>
     * 디버그 함수 erPlayer.sendMessage()가 주석 처리 되어 있는 지 확인할 것.
     * @return void
     * */
    private void updateMouseCursor(ERPlayer erPlayer, BossbarGuiFrame gui){
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

            gui.moveMousePointer((int)distanceOfAngleX, (int)distanceOfAngleY);

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
