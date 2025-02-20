package org.EternalReturn.System.ERPlayer.Gui;

import org.EternalReturn.System.ERPlayer.ERPlayer;
import org.EternalReturn.Util.Gui.bossbarGui.Model.*;

public class HyperLoopGui extends BossbarGuiFrame {
    public HyperLoopGui(ERPlayer p) {
        super(p);

        BImage hyper_loop = new BImage(800,800,"map/hyperloop/background/hyper_loop",new BGuiLocation(0,400));
        add(hyper_loop);

        int scaler = 3;
        int dx = -30;

        BImage lab = new BImage(128/scaler,128/scaler, "map/hyperloop/default/lab", new BGuiLocation(0,77));

        //버튼추가
        HBButton alley = new HBButton(150/scaler,124/scaler, new BGuiLocation(-2 + dx,0),   "alley");
        HBButton gas_station = new HBButton(116/scaler,137/scaler, new BGuiLocation(29 + dx,12),  "gas_station");
        HBButton archery_range = new HBButton(111/scaler,126/scaler, new BGuiLocation(50 + dx,28),  "archery_range");
        HBButton temple = new HBButton(169/scaler,162/scaler, new BGuiLocation(-28 + dx,37), "temple");
        HBButton hotel = new HBButton(165/scaler,158/scaler, new BGuiLocation(70 + dx,70),  "hotel");
        HBButton school = new HBButton(135/scaler,166/scaler, new BGuiLocation(43 + dx,53),  "school");
        HBButton fire = new HBButton(104/scaler,148/scaler, new BGuiLocation(2 + dx,49),   "fire");
        HBButton police = new HBButton(120/scaler,139/scaler, new BGuiLocation(-5 + dx,32),  "police");
        HBButton stream = new HBButton(129/scaler,143/scaler, new BGuiLocation(-27 + dx,67), "stream");
        HBButton pond = new HBButton(120/scaler,145/scaler, new BGuiLocation(-10 + dx,77), "pond");
        HBButton forest = new HBButton(153/scaler,156/scaler, new BGuiLocation(32 + dx,99),  "forest");
        HBButton cemetery = new HBButton(170/scaler,154/scaler, new BGuiLocation(-14 + dx,107),"cemetery");
        HBButton beach = new HBButton(120/scaler,127/scaler, new BGuiLocation(63 + dx,98),  "beach");
        HBButton village = new HBButton(157/scaler,144/scaler, new BGuiLocation(52 + dx,126), "village");
        HBButton hospital = new HBButton(136/scaler,123/scaler, new BGuiLocation(-46 + dx,89), "hospital");
        HBButton chapel = new HBButton(170/scaler,154/scaler, new BGuiLocation(-1 + dx,126), "chapel");
        HBButton factory = new HBButton(169/scaler,151/scaler, new BGuiLocation(-42 + dx,135),"factory");
        HBButton storage = new HBButton(120/scaler,108/scaler, new BGuiLocation(28 + dx,142), "storage");
        HBButton port = new HBButton(132/scaler,99/scaler, new BGuiLocation(8 + dx,150),  "port");

        alley.setButtonPolygon(new BDot[]{
                new BDot(-6,80), new BDot(-40,110), new BDot(-31,119), new BDot(-23,113),
                new BDot(-9,127), new BDot(7,110), new BDot(0,102), new BDot(9,93)
        });
        gas_station.setButtonPolygon(new BDot[]{
                new BDot(9,93), new BDot(0,102), new BDot(7,110), new BDot(-9,127),
                new BDot(2,138), new BDot(27,113)
        });
        archery_range.setButtonPolygon(new BDot[]{
                new BDot(55,139), new BDot(30,110), new BDot(17,125), new BDot(27,135),
                new BDot(23,139), new BDot(39,156)
        });
        hotel.setButtonPolygon(new BDot[]{
                new BDot(76,168), new BDot(55,139), new BDot(20,173), new BDot(42,196),
                new BDot(55,190)
        });
        school.setButtonPolygon(new BDot[]{
                new BDot(17,125), new BDot(-6,149), new BDot(1,155), new BDot(-4,160),
                new BDot(15,179), new BDot(39,156), new BDot(23,139), new BDot(27,135)
        });
        fire.setButtonPolygon(new BDot[]{
                new BDot(-9,127), new BDot(-28,145), new BDot(-31,149), new BDot(-27,153),
                new BDot(-17,173), new BDot(1,155), new BDot(-6,149), new BDot(2,138)
        });
        police.setButtonPolygon(new BDot[]{
                new BDot(-9,127), new BDot(-23,113), new BDot(-47,136), new BDot(-42,141), new BDot(-48,147),
                new BDot(-36,158), new BDot(-33,156), new BDot(-27,153), new BDot(-31,149),
                new BDot(-28,145)
        });
        temple.setButtonPolygon(new BDot[]{
                new BDot(-31,119), new BDot(-48,101), new BDot(-89,148), new BDot(-72,163),
                new BDot(-57,148), new BDot(-53,151), new BDot(-42,141), new BDot(-47,136)
        });
        beach.setButtonPolygon(new BDot[]{
                new BDot(77,192), new BDot(63,181), new BDot(55,190), new BDot(42,196),
                new BDot(39,193), new BDot(27,205), new BDot(46,224)
        });
        forest.setButtonPolygon(new BDot[]{
                new BDot(39, 193), new BDot(20, 173), new BDot(-11, 208), new BDot(7, 225)
        });
        cemetery.setButtonPolygon(new BDot[]{
                new BDot(-5, 201), new BDot(-23, 182), new BDot(-59,216), new BDot(-43, 232),
                new BDot(-43, 232), new BDot(-25, 222), new BDot(-29, 218)
        });
        pond.setButtonPolygon(new BDot[]{
                new BDot(-17, 173), new BDot(-33, 156), new BDot(-46, 169), new BDot(-43, 171),
                new BDot(-43, 171), new BDot(-43, 180), new BDot(-54, 192), new BDot(-44, 202)
        });
        stream.setButtonPolygon(new BDot[]{
                new BDot(-36, 158), new BDot(-48, 147), new BDot(-53, 151), new BDot(-57, 148),
                new BDot(-80, 171), new BDot(-68, 182), new BDot(-65, 178), new BDot(-59, 183),
                new BDot(-61, 185), new BDot(-54, 192), new BDot(-43, 180), new BDot(-43, 171),
                new BDot(-49, 169)
        });
        village.setButtonPolygon(new BDot[]{
                new BDot(46, 224), new BDot(27, 205), new BDot(7, 225), new BDot(-2, 230),
                new BDot(-20, 248), new BDot(4, 242), new BDot(6, 238), new BDot(19, 252),
        });
        chapel.setButtonPolygon(new BDot[]{
                new BDot(7, 225), new BDot(-11, 208), new BDot(-25, 222), new BDot(-29, 218),
                new BDot(-43, 232), new BDot(-23, 251), new BDot(2, 230)
        });
        hospital.setButtonPolygon(new BDot[]{
                new BDot(-44, 202), new BDot(-61, 185), new BDot(-59, 183), new BDot(-65, 178),
                new BDot(-68, 182), new BDot(-80, 171), new BDot(-90, 190), new BDot(-66, 214),
                new BDot(-64, 211), new BDot(-59, 216)
        });
        storage.setButtonPolygon(new BDot[]{
                new BDot(19, 252), new BDot(6, 238), new BDot(4, 242), new BDot(-20, 248),
                new BDot(-20, 248), new BDot(3, 269)
        });
        port.setButtonPolygon(new BDot[]{
                new BDot(3, 269), new BDot(-20, 248), new BDot(-23, 251), new BDot(-31, 244),
                new BDot(-39, 253), new BDot(-6, 282)
        });
        factory.setButtonPolygon(new BDot[]{
                new BDot(-31, 244), new BDot(-63, 202), new BDot(-85, 236), new BDot(-53, 266)
        });

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
        BComponent cursor = new BImage(14,128,"map/cursor/icon",new BGuiLocation(8,200));
        setMouseCursor(cursor);
        add(cursor);

        generate();



    }


}
