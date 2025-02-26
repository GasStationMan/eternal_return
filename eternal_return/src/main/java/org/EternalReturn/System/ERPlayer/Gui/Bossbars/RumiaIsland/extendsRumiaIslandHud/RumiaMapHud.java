package org.EternalReturn.System.ERPlayer.Gui.Bossbars.RumiaIsland.extendsRumiaIslandHud;

import org.EternalReturn.System.ERPlayer.ERPlayer;
import org.EternalReturn.System.ERPlayer.Gui.Bossbars.RumiaIsland.RumiaIslandHud;
import org.EternalReturn.System.ERPlayer.Gui.Bossbars.RumiaIsland.extendsBComponent.HBImage;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BPanel;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class RumiaMapHud extends RumiaIslandHud {

    public void free(){
        super.free();
    }

    public RumiaMapHud(ERPlayer erPlayer, @NotNull String name) {
        super(erPlayer, name);
        generate();
    }

}
