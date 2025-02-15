package org.EternalReturn.Util.Gui.bossbarGui.Model;

import java.util.ArrayList;
import java.util.List;

/**
 * BButton 클래스 <br>
 * Made by TDanfung <br>
 * BossbarGui에서 버튼 기능을 하는 객체를 생성함.
 * */
public class BButton extends BComponent {


    private List<BButtonDot> buttonPolygon;
    private int maxX;
    private int minX;
    private int maxY;
    private int minY;

    @Override
    public void free(){
        super.free();
        if(!buttonPolygon.isEmpty()){
            buttonPolygon.clear();
        }
        buttonPolygon = null;
    }

    public BButton(int sizeX, int sizeY, String font, BGuiLocation location){
        super(sizeX, sizeY, font, location);
        buttonPolygon = new ArrayList<>(4);
    }

    public BButton(float sizeX, float sizeY, String font, BGuiLocation location){
        super((int)sizeX, (int)sizeY, font, location);
    }

    public void setButtonPolygon(BButtonDot[] dots){
        buttonPolygon = new ArrayList<>(List.of(dots));
    }

    public boolean dotInPoly(BGuiLocation location, int laserLength){

        int length = buttonPolygon.size();

        int x = location.getX();
        int y = location.getY();

        if((minX <= x && x <= maxX) && (minY <= y && y <= maxY)){
            int cnt = 0;

            for(int i = 0 ; i < length ; i ++){
                BButtonDot d1 = buttonPolygon.get(i % length);
                BButtonDot d2 = buttonPolygon.get((i + 1) % length);
                if(d1.y == d2.y){
                    continue;
                }

                int dx = d2.x - d1.x;
                int dy = d2.y - d1.y;

                if(((x - d1.x) - (y - d1.y) * dx / dy) * ((x - d1.x - laserLength) - (y - d1.y) * dx / dy) < 0){
                    cnt ++;
                }

            }
            return cnt % 2 == 1;
        }
        return false;
    }

    public void setButtonPolygonAsRect(){
        buttonPolygon = new ArrayList<>(4);

        int posX = location.getX();
        int posY = location.getY();

        buttonPolygon.add(new BButtonDot(posX - sizeX/2, posY));
        buttonPolygon.add(new BButtonDot(posX + sizeX/2, posY));
        buttonPolygon.add(new BButtonDot(posX + sizeX/2, posY + sizeY));
        buttonPolygon.add(new BButtonDot(posX - sizeX/2, posY + sizeY));

        this.minX = posX - sizeX/2;
        this.maxX = posX + sizeX/2;
        this.minY = posY;
        this.maxY = posY + sizeY;

    }

    public void setButtonPolygonAsRect(int width, int height){
        buttonPolygon = new ArrayList<>(4);

        int posX = location.getX();
        int posY = location.getY();

        buttonPolygon.add(new BButtonDot(posX - width/2, posY));
        buttonPolygon.add(new BButtonDot(posX + width/2, posY));
        buttonPolygon.add(new BButtonDot(posX + width/2, posY + height));
        buttonPolygon.add(new BButtonDot(posX - width/2, posY + height));
    }

}
