package org.EternalReturn.System.ERPlayer.Gui.Bossbars.Kiosk;

import org.EternalReturn.System.ERPlayer.ERPlayer;
import org.EternalReturn.Util.Gui.bossbarGui.View.*;
import org.jetbrains.annotations.NotNull;

public class KioskGui extends BFrame {
    public KioskGui(ERPlayer p, @NotNull String name) {
        super(p.getPlayer(),name);
        //버튼추가

        BButton meteorite = new BButton(140/2,182/2,
                "map/kiosk/default/turned_on/meteorite",
                "map/kiosk/hover/turned_on/meteorite", new BLocation(90,100), "meteorite");
        meteorite.setButtonPolygonAsRect(-4, 35);

        BButton mythril = new BButton(140/2,182/2,
                "map/kiosk/default/turned_on/mythril",
                "map/kiosk/hover/turned_on/mythril", new BLocation(0,100), "mythril");
        mythril.setButtonPolygonAsRect(-4, 35);

        BButton treeOfLife = new BButton(140/2,182/2,
                "map/kiosk/default/turned_on/tree_of_life",
                "map/kiosk/hover/turned_on/tree_of_life", new BLocation(-90,100), "tree_of_life");
        treeOfLife.setButtonPolygonAsRect(-4, 35);


        BButton forceCore = new BButton(140/2,182/2,
                "map/kiosk/default/turned_on/force_core",
                "map/kiosk/hover/turned_on/force_core", new BLocation(90,200), "force_core");
        forceCore.setButtonPolygonAsRect(-4, 35);

        BButton tacSkillModule = new BButton(140/2,182/2,
                "map/kiosk/default/turned_on/random",
                "map/kiosk/hover/turned_on/random", new BLocation(-90,200), "random");
        tacSkillModule.setButtonPolygonAsRect(-4, 35);

        BButton vfBloodSample = new BButton(140/2,182/2,
                "map/kiosk/default/turned_on/vf_blood_sample",
                "map/kiosk/hover/turned_on/vf_blood_sample", new BLocation(0,200), "vf_blood_sample");
        vfBloodSample.setButtonPolygonAsRect(-4, 35);


        add(meteorite);
        add(mythril);
        add(treeOfLife);
        add(forceCore);
        add(vfBloodSample);
        add(tacSkillModule);


        //마우스커서 추가
        BComponent cursor = new BImage(14,128,"map/cursor/icon",new BLocation(8,200));
        setMouseCursor(cursor);
        add(cursor);

        generate();

    }

}
