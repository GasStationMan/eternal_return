package org.EternalReturn.System.ERPlayer.Gui;

import org.EternalReturn.System.ERPlayer.ERPlayer;
import org.EternalReturn.Util.Gui.bossbarGui.Model.*;

public class KioskGui extends BossbarGuiFrame {
    public KioskGui(ERPlayer p) {
        super(p);
        
        //버튼추가
        BButton kioskSlot = new BButton(137 * 100 / 182,100,"map/kioskslot",new BGuiLocation(0,100));
        kioskSlot.setButtonPolygonAsRect();
        add(kioskSlot);
        
        //마우스커서 추가
        BComponent cursor = new BImage(7,128,"map/icon",new BGuiLocation(0,128));
        setMouseCursor(cursor);
        add(cursor);

        generate();

    }

}
