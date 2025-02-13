package org.EternalReturn.System.ERPlayer.Gui;

import org.EternalReturn.System.ERPlayer.ERPlayer;
import org.EternalReturn.Util.Gui.bossbarGui.*;

public class KioskGui extends BossbarGui {
    public KioskGui(ERPlayer p) {
        super(p);

        add(new BImage(800,800,"map/hyper_loop",new BGuiLocation(0,500)));
        
        //버튼추가
        BButton kioskSlot = new BButton(137 * 100 / 182,100,"map/kioskslot",new BGuiLocation(0,100));
        kioskSlot.setButtonPolygonAsRect();
        add(kioskSlot);

        //add(new BImage(128,128,"map/beach",new BGuiLocation(-100,100)));
        
        //마우스커서 추가
        BComponent cursor = new BImage(7,128,"map/icon",new BGuiLocation(0,128));
        setMouseCursor(cursor);
        add(cursor);

        generate();

    }

}
