package org.EternalReturn.System.ERPlayer.Gui.Bossbars.RumiaIsland.extRumiaIslandGui;

import org.EternalReturn.System.ERPlayer.ERPlayer;
import org.EternalReturn.System.ERPlayer.Gui.Bossbars.RumiaIsland.RumiaIslandGui;
import org.EternalReturn.System.SystemManager;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BLocation;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BImage;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BPanel;
import org.jetbrains.annotations.NotNull;

import java.util.HashMap;

public class ResurrectionGui extends RumiaIslandGui {

    public void free(){
        super.free();
    }

    public ResurrectionGui(ERPlayer p, @NotNull String name) {
        super(p, name);
        names = new HashMap<>(20);

        int dx = -30;
        int nameScale = 10;

        BPanel alley  = new BPanel(new BLocation(-2 + dx,0));
        names.put(SystemManager.AREASTRING_alley,alley);
        alley.add(new BImage(110/nameScale,50/nameScale,"map/hyperloop/name/alley",new BLocation(0,0)));

        BPanel gas_station = new BPanel(new BLocation(29 + dx,12));
        names.put(SystemManager.AREASTRING_gas_station,gas_station);
        alley.add(new BImage(110/nameScale,50/nameScale,"map/hyperloop/name/gas_station",new BLocation(0,0)));

        BPanel archery_range = new BPanel(new BLocation(50 + dx,28));
        names.put(SystemManager.AREASTRING_archery_range,archery_range);
        alley.add(new BImage(110/nameScale,50/nameScale,"map/hyperloop/name/archery_range",new BLocation(0,0)));

        BPanel temple = new BPanel(new BLocation(-28 + dx,37));
        names.put(SystemManager.AREASTRING_temple,temple);
        alley.add(new BImage(50/nameScale,50/nameScale,"map/hyperloop/name/temple",new BLocation(0,0)));

        BPanel hotel = new BPanel(new BLocation(70 + dx,70));
        names.put(SystemManager.AREASTRING_hotel,hotel);
        alley.add(new BImage(80/nameScale,50/nameScale,"map/hyperloop/name/hotel",new BLocation(0,0)));

        BPanel school = new BPanel(new BLocation(43 + dx,53));
        names.put(SystemManager.AREASTRING_school,school);
        alley.add(new BImage(80/nameScale,50/nameScale,"map/hyperloop/name/school",new BLocation(0,0)));

        BPanel fire = new BPanel(new BLocation(2 + dx,49));
        names.put(SystemManager.AREASTRING_fire,fire);
        alley.add(new BImage(110/nameScale,50/nameScale,"map/hyperloop/name/fire",new BLocation(0,0)));

        BPanel police = new BPanel(new BLocation(-5 + dx,32));
        names.put(SystemManager.AREASTRING_police,police);
        alley.add(new BImage(110/nameScale,50/nameScale,"map/hyperloop/name/police",new BLocation(0,0)));

        BPanel stream = new BPanel(new BLocation(-27 + dx,67));
        names.put(SystemManager.AREASTRING_stream,stream);
        alley.add(new BImage(80/nameScale,50/nameScale,"map/hyperloop/name/stream",new BLocation(0,0)));

        BPanel pond = new BPanel(new BLocation(-10 + dx,77));
        names.put(SystemManager.AREASTRING_pond,pond);
        alley.add(new BImage(80/nameScale,50/nameScale,"map/hyperloop/name/pond",new BLocation(0,0)));

        BPanel forest = new BPanel(new BLocation(32 + dx,99));
        names.put(SystemManager.AREASTRING_forest,forest);
        alley.add(new BImage(50/nameScale,50/nameScale,"map/hyperloop/name/forest",new BLocation(0,0)));

        BPanel cemetery = new BPanel(new BLocation(-14 + dx,107));
        names.put(SystemManager.AREASTRING_cemetery,cemetery);
        alley.add(new BImage(80/nameScale,50/nameScale,"map/hyperloop/name/cemetery",new BLocation(0,0)));

        BPanel beach = new BPanel(new BLocation(63 + dx,98));
        names.put(SystemManager.AREASTRING_beach,beach);
        alley.add(new BImage(140/nameScale,50/nameScale,"map/hyperloop/name/beach",new BLocation(0,0)));

        BPanel village = new BPanel(new BLocation(52 + dx,126));
        names.put(SystemManager.AREASTRING_village,village);
        alley.add(new BImage(190/nameScale,50/nameScale,"map/hyperloop/name/village",new BLocation(0,0)));

        BPanel hospital = new BPanel(new BLocation(-46 + dx,89));
        names.put(SystemManager.AREASTRING_hospital,hospital);
        alley.add(new BImage(80/nameScale,50/nameScale,"map/hyperloop/name/hospital",new BLocation(0,0)));

        BPanel chapel = new BPanel(new BLocation(-1 + dx,126));
        names.put(SystemManager.AREASTRING_chapel,chapel);
        alley.add(new BImage(80/nameScale,50/nameScale,"map/hyperloop/name/chapel",new BLocation(0,0)));

        BPanel factory = new BPanel(new BLocation(-42 + dx,135));
        names.put(SystemManager.AREASTRING_factory,factory);
        alley.add(new BImage(80/nameScale,50/nameScale,"map/hyperloop/name/factory",new BLocation(0,0)));

        BPanel storage = new BPanel(new BLocation(28 + dx,142));
        names.put(SystemManager.AREASTRING_storage,storage);
        alley.add(new BImage(80/nameScale,50/nameScale,"map/hyperloop/name/storage",new BLocation(0,0)));

        BPanel port = new BPanel(new BLocation(8 + dx,150));
        names.put(SystemManager.AREASTRING_port,port);
        alley.add(new BImage(80/nameScale,50/nameScale,"map/hyperloop/name/port",new BLocation(0,0)));

        //add(alley);
        //add(archery_range);
        //add(beach);
        //add(cemetery);
        //add(chapel);
        //add(factory);
        //add(fire);
        //add(forest);
        //add(gas_station);
        //add(hospital);
        //add(hotel);
        //add(police);
        //add(pond);
        //add(port);
        //add(school);
        //add(storage);
        //add(stream);
        //add(temple);
        //add(village);

        generate();
    }
}
