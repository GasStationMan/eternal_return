package org.EternalReturn.ERPlayer.Gui.Bossbars.RumiaIsland;

import org.EternalReturn.Area.ERAreaGraph;
import org.EternalReturn.Area.AreaNode;
import org.EternalReturn.ERPlayer.ERPlayer;
import org.EternalReturn.ERPlayer.Gui.Bossbars.RumiaIsland.extBComponent.HBButton;
import org.EternalReturn.System.SystemManager;
import org.EternalReturn.Util.Gui.bossbarGui.View.*;
import org.jetbrains.annotations.NotNull;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RumiaIslandGui extends BFrame {

    private ERAreaGraph erAreaGraph;
    protected Map<String , BPanel> names;

    public void free(){
        super.free();
        erAreaGraph = null;
        names.clear();
        names = null;
    }

    public RumiaIslandGui(ERPlayer p, @NotNull String name) {
        super(p.getPlayer(), name);

        erAreaGraph = SystemManager.getAreaGraph();
        names = new HashMap<>(20);

        BImage hyper_loop = new BImage(800,800,"map/hyperloop/background/hyper_loop",new BLocation(0,400));
        add(hyper_loop);

        int scaler = 3;
        int dx = -15;
        int buttonDx = 15;
        BImage lab = new BImage(128/scaler,128/scaler, "map/hyperloop/background/lab", new BLocation(30 + dx,77));

        //버튼추가
        HBButton alley = new HBButton(150/scaler,124/scaler, new BLocation(-2 + dx,0),"alley");
        HBButton gas_station = new HBButton(116/scaler,137/scaler, new BLocation(29 + dx,12),"gas_station");
        HBButton archery_range = new HBButton(111/scaler,126/scaler, new BLocation(50 + dx,28),"archery_range");
        HBButton temple = new HBButton(169/scaler,162/scaler, new BLocation(-28 + dx,37),"temple");
        HBButton hotel = new HBButton(165/scaler,158/scaler, new BLocation(70 + dx,70),"hotel");
        HBButton school = new HBButton(135/scaler,166/scaler, new BLocation(43 + dx,53),"school");
        HBButton fire = new HBButton(104/scaler,148/scaler, new BLocation(2 + dx,49),"fire");
        HBButton police = new HBButton(120/scaler,139/scaler, new BLocation(-5 + dx,32),"police");
        HBButton stream = new HBButton(129/scaler,143/scaler, new BLocation(-27 + dx,67),"stream");
        HBButton pond = new HBButton(120/scaler,145/scaler, new BLocation(-10 + dx,77),"pond");
        HBButton forest = new HBButton(153/scaler,156/scaler, new BLocation(32 + dx,99),"forest");
        HBButton cemetery = new HBButton(170/scaler,154/scaler, new BLocation(-14 + dx,107),"cemetery");
        HBButton beach = new HBButton(120/scaler,127/scaler, new BLocation(63 + dx,98),"beach");
        HBButton village = new HBButton(157/scaler,144/scaler, new BLocation(52 + dx,126),"village");
        HBButton hospital = new HBButton(136/scaler,123/scaler, new BLocation(-46 + dx,89),"hospital");
        HBButton chapel = new HBButton(170/scaler,154/scaler, new BLocation(-1 + dx,126),"chapel");
        HBButton factory = new HBButton(169/scaler,151/scaler, new BLocation(-42 + dx,135),"factory");
        HBButton storage = new HBButton(120/scaler,108/scaler, new BLocation(28 + dx,142),"storage");
        HBButton port = new HBButton(132/scaler,99/scaler, new BLocation(8 + dx,150),"port");

        alley.setButtonPolygon(new BDot[]{
                new BDot(-6,80), new BDot(-40,110), new BDot(-31,119), new BDot(-23,113),
                new BDot(-9,127), new BDot(7,110), new BDot(0,102), new BDot(9,93)
        }).moveButtonPolygon(buttonDx,0);

        gas_station.setButtonPolygon(new BDot[]{
                new BDot(9,93), new BDot(0,102), new BDot(7,110), new BDot(-9,127),
                new BDot(2,138), new BDot(27,113)
        }).moveButtonPolygon(buttonDx,0);

        archery_range.setButtonPolygon(new BDot[]{
                new BDot(55,139), new BDot(30,110), new BDot(17,125), new BDot(27,135),
                new BDot(23,139), new BDot(39,156)
        }).moveButtonPolygon(buttonDx,0);

        hotel.setButtonPolygon(new BDot[]{
                new BDot(76,168), new BDot(55,139), new BDot(20,173), new BDot(42,196),
                new BDot(55,190)
        }).moveButtonPolygon(buttonDx,0);

        school.setButtonPolygon(new BDot[]{
                new BDot(17,125), new BDot(-6,149), new BDot(1,155), new BDot(-4,160),
                new BDot(15,179), new BDot(39,156), new BDot(23,139), new BDot(27,135)
        }).moveButtonPolygon(buttonDx,0);

        fire.setButtonPolygon(new BDot[]{
                new BDot(-9,127), new BDot(-28,145), new BDot(-31,149), new BDot(-27,153),
                new BDot(-17,173), new BDot(1,155), new BDot(-6,149), new BDot(2,138)
        }).moveButtonPolygon(buttonDx,0);

        police.setButtonPolygon(new BDot[]{
                new BDot(-9,127), new BDot(-23,113), new BDot(-47,136), new BDot(-42,141), new BDot(-48,147),
                new BDot(-36,158), new BDot(-33,156), new BDot(-27,153), new BDot(-31,149),
                new BDot(-28,145)
        }).moveButtonPolygon(buttonDx,0);

        temple.setButtonPolygon(new BDot[]{
                new BDot(-31,119), new BDot(-48,101), new BDot(-89,148), new BDot(-72,163),
                new BDot(-57,148), new BDot(-53,151), new BDot(-42,141), new BDot(-47,136)
        }).moveButtonPolygon(buttonDx,0);

        beach.setButtonPolygon(new BDot[]{
                new BDot(77,192), new BDot(63,181), new BDot(55,190), new BDot(42,196),
                new BDot(39,193), new BDot(27,205), new BDot(46,224)
        }).moveButtonPolygon(buttonDx,0);

        forest.setButtonPolygon(new BDot[]{
                new BDot(39, 193), new BDot(20, 173), new BDot(-11, 208), new BDot(7, 225)
        }).moveButtonPolygon(buttonDx,0);

        cemetery.setButtonPolygon(new BDot[]{
                new BDot(-5, 201), new BDot(-23, 182), new BDot(-59,216), new BDot(-43, 232),
                new BDot(-43, 232), new BDot(-25, 222), new BDot(-29, 218)
        }).moveButtonPolygon(buttonDx,0);

        pond.setButtonPolygon(new BDot[]{
                new BDot(-17, 173), new BDot(-33, 156), new BDot(-46, 169), new BDot(-43, 171),
                new BDot(-43, 171), new BDot(-43, 180), new BDot(-54, 192), new BDot(-44, 202)
        }).moveButtonPolygon(buttonDx,0);

        stream.setButtonPolygon(new BDot[]{
                new BDot(-36, 158), new BDot(-48, 147), new BDot(-53, 151), new BDot(-57, 148),
                new BDot(-80, 171), new BDot(-68, 182), new BDot(-65, 178), new BDot(-59, 183),
                new BDot(-61, 185), new BDot(-54, 192), new BDot(-43, 180), new BDot(-43, 171),
                new BDot(-49, 169)
        }).moveButtonPolygon(buttonDx,0);

        village.setButtonPolygon(new BDot[]{
                new BDot(46, 224), new BDot(27, 205), new BDot(7, 225), new BDot(-2, 230),
                new BDot(-20, 248), new BDot(4, 242), new BDot(6, 238), new BDot(19, 252),
        }).moveButtonPolygon(buttonDx,0);

        chapel.setButtonPolygon(new BDot[]{
                new BDot(7, 225), new BDot(-11, 208), new BDot(-25, 222), new BDot(-29, 218),
                new BDot(-43, 232), new BDot(-23, 251), new BDot(2, 230)
        }).moveButtonPolygon(buttonDx,0);

        hospital.setButtonPolygon(new BDot[]{
                new BDot(-44, 202), new BDot(-61, 185), new BDot(-59, 183), new BDot(-65, 178),
                new BDot(-68, 182), new BDot(-80, 171), new BDot(-90, 190), new BDot(-66, 214),
                new BDot(-64, 211), new BDot(-59, 216)
        }).moveButtonPolygon(buttonDx,0);

        storage.setButtonPolygon(new BDot[]{
                new BDot(19, 252), new BDot(6, 238), new BDot(4, 242), new BDot(-20, 248),
                new BDot(-20, 248), new BDot(3, 269)
        }).moveButtonPolygon(buttonDx,0);

        port.setButtonPolygon(new BDot[]{
                new BDot(3, 269), new BDot(-20, 248), new BDot(-23, 251), new BDot(-31, 244),
                new BDot(-39, 253), new BDot(-6, 282)
        }).moveButtonPolygon(buttonDx,0);

        factory.setButtonPolygon(new BDot[]{
                new BDot(-31, 244), new BDot(-63, 202), new BDot(-85, 236), new BDot(-53, 266)
        }).moveButtonPolygon(buttonDx,0);


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
        BComponent cursor = new BImage(14,128,"map/cursor/icon",new BLocation(8,200));
        setMouseCursor(cursor);
        add(cursor);

    }

    /**
     * 그래프의 연산 결과에 따른 AreaNode의 변경 결과를 HBButton에 반영하기 위한 함수.
     * */
    public void updateAreaState(){
        try{
            List<BButton> buttonList = super.getBButtons();
            List<AreaNode> areaNodes = erAreaGraph.getAreaNodes();

            int hbButtonListSize = buttonList.size();
            int areaGraphListSize = areaNodes.size();

            if(hbButtonListSize != areaGraphListSize){
                throw new ArrayIndexOutOfBoundsException(
                        "두 리스트의 인덱스가 일치하지 않습니다. : (hbButtonListSize == "+ hbButtonListSize +") != (areaGraphListSize == " + areaGraphListSize + ")");
            }

            //버튼의 인덱스 상 위치와 areaNode의 인덱스 상 위치는 일치함.
            for(int i = 0 ; i < areaGraphListSize ; i ++){
                HBButton currentHBButton = (HBButton) buttonList.get(i);
                AreaNode currentAreaNode = areaNodes.get(i);

                int buttonZoneState = currentHBButton.getZoneState();
                int areaNodeZoneState = currentAreaNode.getZoneState();

                //기준이 되는 AreaNode의 state와 버튼의 state가 다른 경우 areaNode의 state로 button의 state를 변경
                if(areaNodeZoneState != buttonZoneState){
                    currentHBButton.setZoneState(areaNodeZoneState);
                }
            }
            repaint();
        }
        catch(ArrayIndexOutOfBoundsException e){
            e.printStackTrace();
        }

    }

}
