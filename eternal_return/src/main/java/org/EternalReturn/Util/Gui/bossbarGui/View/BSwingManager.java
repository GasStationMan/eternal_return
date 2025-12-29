package org.EternalReturn.Util.Gui.bossbarGui.View;

import org.bukkit.entity.Player;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;



public class BSwingManager {

    private static HashMap<Player, BSwingPlayer> playerMap = new HashMap<>();
    private static List<BFrame> bFrames = new ArrayList<>(); //일단 임시로 이렇게 하자 -> 나중에 BComponentManager로 바꾸고, MouseManager도 따로 뺄 것.

    private BSwingManager instance;

    private BSwingManager(){

    }

    public BSwingManager getInstance(){
        if(instance == null){
            instance = new BSwingManager();
        }
        return instance;
    }

    public static BSwingPlayer getBSwingPlayer(Player p){

        if(!playerMap.containsKey(p)){
            playerMap.put(p, new BSwingPlayer(p));
        }

        return playerMap.get(p);
    }

    public static void runTick(){
        for(BFrame bframe : bFrames){
            //일단 임시로 BFrame만 적용되게
            bframe.updateMouseCursor(4);

        }
    }

}
