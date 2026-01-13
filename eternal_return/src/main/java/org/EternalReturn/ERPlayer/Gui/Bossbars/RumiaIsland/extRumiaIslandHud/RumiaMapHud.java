package org.EternalReturn.ERPlayer.Gui.Bossbars.RumiaIsland.extRumiaIslandHud;

import org.EternalReturn.ERPlayer.ERPlayer;
import org.EternalReturn.ERPlayer.Gui.Bossbars.RumiaIsland.RumiaIslandHud;
import org.jetbrains.annotations.NotNull;

public class RumiaMapHud extends RumiaIslandHud {

    public void free(){
        super.free();
    }

    public RumiaMapHud(ERPlayer erPlayer, @NotNull String name) {
        super(erPlayer, name);
        generate();
    }

}
