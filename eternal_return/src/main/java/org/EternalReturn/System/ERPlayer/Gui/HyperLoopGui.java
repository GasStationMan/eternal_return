package org.EternalReturn.System.ERPlayer.Gui;

import org.EternalReturn.System.ERPlayer.ERPlayer;
import org.EternalReturn.Util.Gui.bossbarGui.Model.*;

public class HyperLoopGui extends BossbarGuiFrame {
    public HyperLoopGui(ERPlayer p) {
        super(p);

        BImage hyper_loop = new BImage(800,800,"map/hyper_loop",new BGuiLocation(0,400));
        add(hyper_loop);

        int scaler = 3;
        int dx = -30;

        //버튼추가
        BButton alley = new BButton(150/scaler,124/scaler,"map/alley"                   ,new BGuiLocation(-2 + dx,0));
        BButton gas_station = new BButton(116/scaler,137/scaler,"map/gas_station"       ,new BGuiLocation(29 + dx,12));
        BButton archery_range = new BButton(111/scaler,126/scaler,"map/archery_range"   ,new BGuiLocation(50 + dx,28));
        BButton temple = new BButton(169/scaler,162/scaler,"map/temple"                 ,new BGuiLocation(-28 + dx,37));
        BButton hotel = new BButton(165/scaler,158/scaler,"map/hotel"                   ,new BGuiLocation(70 + dx,70));
        BButton school = new BButton(135/scaler,166/scaler,"map/school"                 ,new BGuiLocation(43 + dx,53));
        BButton fire = new BButton(104/scaler,148/scaler,"map/fire"                     ,new BGuiLocation(2 + dx,49));
        BButton police = new BButton(120/scaler,139/scaler,"map/police"                 ,new BGuiLocation(-5 + dx,32));
        BButton stream = new BButton(129/scaler,143/scaler,"map/stream"                 ,new BGuiLocation(-27 + dx,67));
        BButton pond = new BButton(120/scaler,145/scaler,"map/pond"                     ,new BGuiLocation(-10 + dx,77));
        BImage lab = new BImage(128/scaler,128/scaler,"map/lab"                         ,new BGuiLocation(0,77));
        BButton forest = new BButton(153/scaler,156/scaler,"map/forest"                 ,new BGuiLocation(32 + dx,99));
        BButton cemetery = new BButton(170/scaler,154/scaler,"map/cemetery"             ,new BGuiLocation(-14 + dx,107));
        BButton beach = new BButton(120/scaler,127/scaler,"map/beach"                   ,new BGuiLocation(63 + dx,98));
        BButton village = new BButton(157/scaler,144/scaler,"map/village"               ,new BGuiLocation(52 + dx,126));
        BButton hospital = new BButton(136/scaler,123/scaler,"map/hospital"             ,new BGuiLocation(-46 + dx,89));
        BButton chapel = new BButton(170/scaler,154/scaler,"map/chapel"                 ,new BGuiLocation(-1 + dx,126));
        BButton factory = new BButton(169/scaler,151/scaler,"map/factory"               ,new BGuiLocation(-42 + dx,135));
        BButton storage = new BButton(120/scaler,108/scaler,"map/storage"               ,new BGuiLocation(28 + dx,142));
        BButton port = new BButton(132/scaler,99/scaler,"map/port"                      ,new BGuiLocation(8 + dx,150));


        add(alley);
        add(archery_range);
        add(beach);
        add(cemetery);
        add(chapel);
        add(factory);
        add(fire);
        add(forest);
        add(gas_station);
        add(hospital);
        add(hotel);
        add(police);
        add(pond);
        add(port);
        add(school);
        add(storage);
        add(stream);
        add(temple);
        add(village);
        add(lab);


        //마우스커서 추가
        BComponent cursor = new BImage(14,128,"map/icon",new BGuiLocation(8,200));
        setMouseCursor(cursor);
        add(cursor);

        generate();



    }


}
