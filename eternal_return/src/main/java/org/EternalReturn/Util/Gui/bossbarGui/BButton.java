package org.EternalReturn.Util.Gui.bossbarGui;

import net.kyori.adventure.key.Key;
import net.kyori.adventure.text.Component;

import java.util.ArrayList;
import java.util.List;

public class BButton extends BComponent {


    private List<BButtonDot> buttonPolygon;

    public BButton(int sizeX, int sizeY, String font, BGuiLocation location){
        super(sizeX, sizeY, font, location);
    }

    public void setButtonPolygon(BButtonDot[] dots){
        buttonPolygon = new ArrayList<>(List.of(dots));
    }

    public void setButtonPolygonAsRect(int width, int height){
        buttonPolygon = new ArrayList<>(4);

        int posX = location.getX();
        int posY = location.getY();

        buttonPolygon.add(new BButtonDot(posX - width/2, posY - height/2));
        buttonPolygon.add(new BButtonDot(posX + width/2, posY - height/2));
        buttonPolygon.add(new BButtonDot(posX + width/2, posY + height/2));
        buttonPolygon.add(new BButtonDot(posX - width/2, posY + height/2));
    }

}
