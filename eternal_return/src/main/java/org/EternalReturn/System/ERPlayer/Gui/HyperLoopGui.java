package org.EternalReturn.System.ERPlayer.Gui;

import org.EternalReturn.System.ERPlayer.ERPlayer;
import org.EternalReturn.Util.Gui.bossbarGui.*;

public class HyperLoopGui extends BossbarGui {
    public HyperLoopGui(ERPlayer p) {
        super(p);

        BImage hyper_loop = new BImage(800,800,"map/hyper_loop",new BGuiLocation(0,400));
        add(hyper_loop);

        int scaler = 3;

        //버튼추가
        BButton alley = new BButton(150/scaler,124/scaler,"map/alley"                   ,new BGuiLocation(0,0));
        BButton gas_station = new BButton(116/scaler,137/scaler,"map/gas_station"       ,new BGuiLocation(28,12));
        BButton archery_range = new BButton(111/scaler,126/scaler,"map/archery_range"   ,new BGuiLocation(53,27));
        BButton temple = new BButton(169/scaler,162/scaler,"map/temple"                 ,new BGuiLocation(-36,37));
        BButton hotel = new BButton(165/scaler,158/scaler,"map/hotel"                   ,new BGuiLocation(68,70));
        BButton school = new BButton(135/scaler,166/scaler,"map/school"                 ,new BGuiLocation(39,52));
        BButton fire = new BButton(104/scaler,148/scaler,"map/fire"                     ,new BGuiLocation(4,48));

        //to modify
        BButton police = new BButton(120/scaler,139/scaler,"map/police"                 ,new BGuiLocation(0,100));

        BButton beach = new BButton(120/scaler,127/scaler,"map/beach"                   ,new BGuiLocation(0,100));
        BButton cemetery = new BButton(170/scaler,154/scaler,"map/cemetery"             ,new BGuiLocation(0,100));
        BButton chapel = new BButton(170/scaler,154/scaler,"map/chapel"                 ,new BGuiLocation(0,100));
        BButton factory = new BButton(169/scaler,151/scaler,"map/factory"               ,new BGuiLocation(0,100));
        BButton forest = new BButton(153/scaler,156/scaler,"map/forest"                 ,new BGuiLocation(0,100));
        BButton hospital = new BButton(136/scaler,123/scaler,"map/hospital"             ,new BGuiLocation(0,100));
        BButton lab = new BButton(128/scaler,128/scaler,"map/lab"                       ,new BGuiLocation(0,100));
        BButton pond = new BButton(120/scaler,145/scaler,"map/pond"                     ,new BGuiLocation(0,100));
        BButton port = new BButton(132/scaler,99/scaler,"map/port"                      ,new BGuiLocation(0,100));
        BButton storage = new BButton(120/scaler,108/scaler,"map/storage"               ,new BGuiLocation(0,100));
        BButton stream = new BButton(129/scaler,143/scaler,"map/stream"                 ,new BGuiLocation(0,100));
        BButton village = new BButton(157/scaler,144/scaler,"map/village"               ,new BGuiLocation(0,100));


        add(alley);
        add(archery_range);
        //add(beach);
        //add(cemetery);
        //add(chapel);
        //add(factory);
        add(fire);
        //add(forest);
        add(gas_station);
        //add(hospital);
        add(hotel);
        //add(lab);
        //add(police);
        //add(pond);
        //add(port);
        add(school);
        //add(storage);
        //add(stream);
        add(temple);
        //add(village);


        //마우스커서 추가
        BComponent cursor = new BImage(14,128,"map/icon",new BGuiLocation(8,200));
        setMouseCursor(cursor);
        add(cursor);

        generate();



    }


}
