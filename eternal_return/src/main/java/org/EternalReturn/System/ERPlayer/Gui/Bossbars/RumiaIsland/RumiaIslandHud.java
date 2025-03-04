package org.EternalReturn.System.ERPlayer.Gui.Bossbars.RumiaIsland;

import org.EternalReturn.System.AreaSystem.AreaGraph;
import org.EternalReturn.System.AreaSystem.AreaNode;
import org.EternalReturn.System.ERPlayer.ERPlayer;
import org.EternalReturn.System.SystemManager;
import org.EternalReturn.Util.Gui.bossbarGui.Model.*;
import org.jetbrains.annotations.NotNull;

import java.util.List;
import org.EternalReturn.System.ERPlayer.Gui.Bossbars.RumiaIsland.extBComponent.HBImage;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BLocation;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BImage;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BFrame;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BPanel;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class RumiaIslandHud extends BFrame {

    private AreaGraph areaGraph;
    private List<HBImage> areaImages;
    protected Map<String , BPanel> names;

    public void free(){
        super.free();
        areaGraph = null;
        areaImages.clear();
        areaImages = null;
    }

    public RumiaIslandHud(ERPlayer erPlayer, @NotNull String name) {
        super(erPlayer, name);

        names = new HashMap<>(20);
        areaGraph = SystemManager.getAreaGraph();
        areaImages = new ArrayList<>(20);

        int scaler = 3;
        int dx = -60;
        BImage lab = new BImage(128/scaler,128/scaler, "map/hyperloop/background/lab", new BLocation(30 + dx,77));

        //버튼추가
        HBImage alley = new HBImage(150/scaler,124/scaler, new BLocation(-2 + dx,0),"alley");
        HBImage gas_station = new HBImage(116/scaler,137/scaler, new BLocation(29 + dx,12),"gas_station");
        HBImage archery_range = new HBImage(111/scaler,126/scaler, new BLocation(50 + dx,28),"archery_range");
        HBImage temple = new HBImage(169/scaler,162/scaler, new BLocation(-28 + dx,37),"temple");
        HBImage hotel = new HBImage(165/scaler,158/scaler, new BLocation(70 + dx,70),"hotel");
        HBImage school = new HBImage(135/scaler,166/scaler, new BLocation(43 + dx,53),"school");
        HBImage fire = new HBImage(104/scaler,148/scaler, new BLocation(2 + dx,49),"fire");
        HBImage police = new HBImage(120/scaler,139/scaler, new BLocation(-5 + dx,32),"police");
        HBImage stream = new HBImage(129/scaler,143/scaler, new BLocation(-27 + dx,67),"stream");
        HBImage pond = new HBImage(120/scaler,145/scaler, new BLocation(-10 + dx,77),"pond");
        HBImage forest = new HBImage(153/scaler,156/scaler, new BLocation(32 + dx,99),"forest");
        HBImage cemetery = new HBImage(170/scaler,154/scaler, new BLocation(-14 + dx,107),"cemetery");
        HBImage beach = new HBImage(120/scaler,127/scaler, new BLocation(63 + dx,98),"beach");
        HBImage village = new HBImage(157/scaler,144/scaler, new BLocation(52 + dx,126),"village");
        HBImage hospital = new HBImage(136/scaler,123/scaler, new BLocation(-46 + dx,89),"hospital");
        HBImage chapel = new HBImage(170/scaler,154/scaler, new BLocation(-1 + dx,126),"chapel");
        HBImage factory = new HBImage(169/scaler,151/scaler, new BLocation(-42 + dx,135),"factory");
        HBImage storage = new HBImage(120/scaler,108/scaler, new BLocation(28 + dx,142),"storage");
        HBImage port = new HBImage(132/scaler,99/scaler, new BLocation(8 + dx,150),"port");

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
            List<AreaNode> areaNodes = areaGraph.getAreaNodes();

            int hbButtonListSize = areaImages.size();
          int areaGraphListSize = areaNodes.size();

            if(hbButtonListSize != areaGraphListSize){
                throw new ArrayIndexOutOfBoundsException(
                        "두 리스트의 인덱스가 일치하지 않습니다. : (hbButtonListSize == "+ hbButtonListSize +") != (areaGraphListSize == " + areaGraphListSize + ")");
            }

            //버튼의 인덱스 상 위치와 areaNode의 인덱스 상 위치는 일치함.
            for(int i = 0 ; i < areaGraphListSize ; i ++){
                HBImage currentHBButton = areaImages.get(i);
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
