package org.EternalReturn.System.ERPlayer.Gui.Bossbars.RumiaIsland.extendsRumiaIslandGui;

import org.EternalReturn.System.ERPlayer.ERPlayer;
import org.EternalReturn.System.ERPlayer.Gui.Bossbars.RumiaIsland.RumiaIslandGui;
import org.EternalReturn.System.SystemManager;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BImage;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BLocation;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BPanel;
import org.jetbrains.annotations.NotNull;

import java.util.HashMap;
import java.util.Map;

public class HyperLoopGui extends RumiaIslandGui {

    public void free(){
        super.free();
    }

    public HyperLoopGui(ERPlayer p, @NotNull String name) {
        super(p, name);
        names = new HashMap<>(20);

        int dx = 0;
        int dy = 0;
        int nameScale = 5;

        BPanel alley  = new BPanel(new BLocation(-2 + dx,0 + dy));
        names.put(SystemManager.AREASTRING_alley,alley);
        alley.add(new BImage(110/nameScale,50/nameScale,"map/hyperloop/name/alley",new BLocation(0,0)));

        BPanel gas_station = new BPanel(new BLocation(29 + dx,12 + dy));
        names.put(SystemManager.AREASTRING_gas_station,gas_station);
        gas_station.add(new BImage(110/nameScale,50/nameScale,"map/hyperloop/name/gas_station",new BLocation(0,0)));

        BPanel archery_range = new BPanel(new BLocation(50 + dx,28 + dy));
        names.put(SystemManager.AREASTRING_archery_range,archery_range);
        archery_range.add(new BImage(110/nameScale,50/nameScale,"map/hyperloop/name/archery_range",new BLocation(0,0)));

        BPanel temple = new BPanel(new BLocation(-28 + dx,37 + dy));
        names.put(SystemManager.AREASTRING_temple,temple);
        temple.add(new BImage(50/nameScale,50/nameScale,"map/hyperloop/name/temple",new BLocation(0,0)));

        BPanel hotel = new BPanel(new BLocation(70 + dx,70 + dy));
        names.put(SystemManager.AREASTRING_hotel,hotel);
        hotel.add(new BImage(80/nameScale,50/nameScale,"map/hyperloop/name/hotel",new BLocation(0,0)));

        BPanel school = new BPanel(new BLocation(43 + dx,53 + dy));
        names.put(SystemManager.AREASTRING_school,school);
        school.add(new BImage(80/nameScale,50/nameScale,"map/hyperloop/name/school",new BLocation(0,0)));

        BPanel fire = new BPanel(new BLocation(2 + dx,49 + dy));
        names.put(SystemManager.AREASTRING_fire,fire);
        fire.add(new BImage(110/nameScale,50/nameScale,"map/hyperloop/name/fire",new BLocation(0,0)));

        BPanel police = new BPanel(new BLocation(-5 + dx,32 + dy));
        names.put(SystemManager.AREASTRING_police,police);
        police.add(new BImage(110/nameScale,50/nameScale,"map/hyperloop/name/police",new BLocation(0,0)));

        BPanel stream = new BPanel(new BLocation(-27 + dx,67 + dy));
        names.put(SystemManager.AREASTRING_stream,stream);
        stream.add(new BImage(80/nameScale,50/nameScale,"map/hyperloop/name/stream",new BLocation(0,0)));

        BPanel pond = new BPanel(new BLocation(-10 + dx,77 + dy));
        names.put(SystemManager.AREASTRING_pond,pond);
        pond.add(new BImage(80/nameScale,50/nameScale,"map/hyperloop/name/pond",new BLocation(0,0)));

        BPanel forest = new BPanel(new BLocation(32 + dx,99 + dy));
        names.put(SystemManager.AREASTRING_forest,forest);
        forest.add(new BImage(50/nameScale,50/nameScale,"map/hyperloop/name/forest",new BLocation(0,0)));

        BPanel cemetery = new BPanel(new BLocation(-14 + dx,107 + dy));
        names.put(SystemManager.AREASTRING_cemetery,cemetery);
        cemetery.add(new BImage(80/nameScale,50/nameScale,"map/hyperloop/name/cemetery",new BLocation(0,0)));

        BPanel beach = new BPanel(new BLocation(63 + dx,98 + dy));
        names.put(SystemManager.AREASTRING_beach,beach);
        beach.add(new BImage(140/nameScale,50/nameScale,"map/hyperloop/name/beach",new BLocation(0,0)));

        BPanel village = new BPanel(new BLocation(52 + dx,126 + dy));
        names.put(SystemManager.AREASTRING_village,village);
        village.add(new BImage(190/nameScale,50/nameScale,"map/hyperloop/name/village",new BLocation(0,0)));

        BPanel hospital = new BPanel(new BLocation(-46 + dx,89 + dy));
        names.put(SystemManager.AREASTRING_hospital,hospital);
        hospital.add(new BImage(80/nameScale,50/nameScale,"map/hyperloop/name/hospital",new BLocation(0,0)));

        BPanel chapel = new BPanel(new BLocation(-1 + dx,126 + dy));
        names.put(SystemManager.AREASTRING_chapel,chapel);
        chapel.add(new BImage(80/nameScale,50/nameScale,"map/hyperloop/name/chapel",new BLocation(0,0)));

        BPanel factory = new BPanel(new BLocation(-42 + dx,135 + dy));
        names.put(SystemManager.AREASTRING_factory,factory);
        factory.add(new BImage(80/nameScale,50/nameScale,"map/hyperloop/name/factory",new BLocation(0,0)));

        BPanel storage = new BPanel(new BLocation(28 + dx,142 + dy));
        names.put(SystemManager.AREASTRING_storage,storage);
        storage.add(new BImage(80/nameScale,50/nameScale,"map/hyperloop/name/storage",new BLocation(0,0)));

        BPanel port = new BPanel(new BLocation(8 + dx,150 + dy));
        names.put(SystemManager.AREASTRING_port,port);
        port.add(new BImage(80/nameScale,50/nameScale,"map/hyperloop/name/port",new BLocation(0,0)));

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
