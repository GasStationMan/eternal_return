package org.EternalReturn.System.KioskSystem;

import net.kyori.adventure.key.Key;
import net.kyori.adventure.text.Component;
import org.EternalReturn.Util.Gui.bossbarGui.BComponent;
import org.EternalReturn.Util.Gui.bossbarGui.BGuiLocation;
import org.EternalReturn.Util.Gui.bossbarGui.BImage;
import org.EternalReturn.Util.Gui.bossbarGui.BossbarGui;
import org.bukkit.entity.Player;

import java.util.ArrayList;

public class KioskGui extends BossbarGui {
    public KioskGui(Player p) {
        super(p);

        add(new BImage(800,800,"map/hyper_loop",new BGuiLocation(0,0)));

        //마우스커서 추가
        //BComponent cursor = new BCursor();
        BComponent cursor = new BImage(7,7,"map/icon",new BGuiLocation(0,0));
        setMouseCursor(cursor);
        add(cursor);

        generate();

    }

}
