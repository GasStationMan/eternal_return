package org.EternalReturn.System.KioskSystem;

import net.kyori.adventure.key.Key;
import net.kyori.adventure.text.Component;
import org.EternalReturn.System.ERPlayer.ERPlayer;
import org.EternalReturn.Util.Gui.bossbarGui.*;
import org.bukkit.entity.Player;

import java.util.ArrayList;

public class KioskGui extends BossbarGui {
    public KioskGui(ERPlayer p) {
        super(p);

        add(new BImage(800,800,"map/hyper_loop",new BGuiLocation(0,400)));
        add(new BButton(137 * 100 / 182,100,"map/kioskslot",new BGuiLocation(0,200)));

        //마우스커서 추가
        BComponent cursor = new BImage(7,7,"map/icon",new BGuiLocation(0,400));
        setMouseCursor(cursor);
        add(cursor);

        generate();

    }

}
