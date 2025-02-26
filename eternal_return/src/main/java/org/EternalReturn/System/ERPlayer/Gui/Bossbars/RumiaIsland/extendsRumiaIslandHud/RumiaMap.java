package org.EternalReturn.System.ERPlayer.Gui.Bossbars.RumiaIsland.extendsRumiaIslandHud;

import org.EternalReturn.System.AreaSystem.AreaGraph;
import org.EternalReturn.System.ERPlayer.ERPlayer;
import org.EternalReturn.System.ERPlayer.Gui.Bossbars.RumiaIsland.RumiaIslandHud;
import org.EternalReturn.System.ERPlayer.Gui.Bossbars.RumiaIsland.extendsBComponent.HBImage;
import org.jetbrains.annotations.NotNull;

import java.util.List;

public class RumiaMap extends RumiaIslandHud {

    private AreaGraph areaGraph;
    private List<HBImage> areaImages;

    public RumiaMap(ERPlayer erPlayer, @NotNull String name) {
        super(erPlayer, name);

        generate();
    }

}
