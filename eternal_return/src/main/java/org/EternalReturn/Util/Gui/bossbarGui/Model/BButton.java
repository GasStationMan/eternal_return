package org.EternalReturn.Util.Gui.bossbarGui.Model;

import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.Util.Gui.bossbarGui.Exception.ButtonPolyNullException;

import java.util.ArrayList;
import java.util.List;

/**
 * BButton 클래스 <br>
 * Made by TDanfung <br>
 * BossbarGui에서 버튼 기능을 하는 객체를 생성함.
 * */
public class BButton extends BComponent {


    private List<BDot> buttonPolygon;
    private int maxX;
    private int minX;
    private int maxY;
    private int minY;
    private boolean isUnderCursor;

    private String buttonName;
    private String fontWhenHovering;

    @Override
    public void free(){
        super.free();
        if(!buttonPolygon.isEmpty()){
            buttonPolygon.clear();
        }
        buttonPolygon = null;
    }

    /**
     * BButton을 생성하는 함수 extends BComponent
     * @param sizeX            : font가 가리키는 이미지의 공백을 제거한 x픽셀 수
     * @param sizeY            : font가 가리키는 이미지의 y픽셀 수
     * @param font             : 리소스팩의 font의 위치
     * @param fontWhenHovering : 리소스팩의 font의 위치 (커서가 올라갈 때 바뀔 이미지를 지정하는 font의 위치)
     * @param location         : BComponent의 위치 정보를 담는 객체
     * */
    public BButton(int sizeX, int sizeY, String font, String fontWhenHovering, BGuiLocation location, String buttonName){
        super(sizeX, sizeY, font, location);
        this.buttonPolygon = new ArrayList<>(4);
        this.fontWhenHovering = fontWhenHovering;
        this.isUnderCursor = false;
        this.buttonName = buttonName;
    }

    public BButton(float sizeX, float sizeY, String font, BGuiLocation location){
        super((int)sizeX, (int)sizeY, font, location);
    }


    public List<BDot> getButtonPolygon(){
        return buttonPolygon;
    }

    public String getBButton(){
        return buttonName;
    }

    public void setButtonPolygon(BDot[] dots){
        buttonPolygon = new ArrayList<>(List.of(dots));

        int minX, minY, maxX, maxY;

        minX = buttonPolygon.getFirst().x;
        maxX = buttonPolygon.getFirst().x;
        minY = buttonPolygon.getFirst().y;
        maxY = buttonPolygon.getFirst().y;


        for(BDot dot : buttonPolygon){
            if(dot.x >= maxX){
                maxX = dot.x;
            }

            if(dot.x < minX){
                minX = dot.x;
            }

            if(dot.y >= maxY){
                maxY = dot.y;
            }

            if(dot.y < minY) {
                minY = dot.y;
            }
        }

        this.minX = minX;
        this.minY = minY;
        this.maxX = maxX;
        this.maxY = maxY;

    }

    public void setButtonPolygonAsRect(){
        buttonPolygon = new ArrayList<>(4);

        int posX = location.getX();
        int posY = location.getY();

        buttonPolygon.add(new BDot(posX - sizeX/2, posY));
        buttonPolygon.add(new BDot(posX + sizeX/2, posY));
        buttonPolygon.add(new BDot(posX + sizeX/2, posY + sizeY));
        buttonPolygon.add(new BDot(posX - sizeX/2, posY + sizeY));

        this.minX = posX - sizeX/2;
        this.maxX = posX + sizeX/2;
        this.minY = posY;
        this.maxY = posY + sizeY;

    }

    public void setButtonPolygonAsRect(int width, int height){
        buttonPolygon = new ArrayList<>(4);

        int posX = location.getX();
        int posY = location.getY();

        buttonPolygon.add(new BDot(posX - width/2, posY));
        buttonPolygon.add(new BDot(posX + width/2, posY));
        buttonPolygon.add(new BDot(posX + width/2, posY + height));
        buttonPolygon.add(new BDot(posX - width/2, posY + height));
    }

    /**
     * true인 경우 hover 이미지를 띄우고
     * false인 경우 default 이미지를 띄움
     * */
    public void setHoverState(boolean b){
        if(b){
            updateComponent(fontWhenHovering);
            isUnderCursor = true;
        }
        else{
            updateComponent(font);
            isUnderCursor = false;
        }
    }

    public boolean getHoverState(){
        return isUnderCursor;
    }

    public boolean dotInPoly(BGuiLocation location, int laserLength){

        int length = buttonPolygon.size();

        long x = location.getX();
        long y = location.getY();
        int cnt = 0;
        if((minX <= x && x <= maxX) && (minY <= y && y <= maxY)){
            for(int i = 0 ; i < length ; i ++){
                BDot d1 = buttonPolygon.get(i % length);
                BDot d2 = buttonPolygon.get((i + 1) % length);
                if(d1.y == d2.y){
                    continue;
                }
                //x축과 평행한 반직선이기 때문에, y의 최대 최소값을 통해 위치를 고려해야 함.
                if(Math.min(d1.y, d2.y) < y && y <= Math.max(d1.y, d2.y)){
                    long dx = d2.x - d1.x;
                    long dy = d2.y - d1.y;
                    long check = ((y - d2.y) * dx - ((x - d2.x              ) * dy)) *
                                 ((y - d2.y) * dx - ((x - d2.x - laserLength) * dy));

                    if(check < 0){
                        cnt ++;
                    }
                }
            }
        }
        isUnderCursor = (cnt % 2 == 1);
        return isUnderCursor;
    }



}
