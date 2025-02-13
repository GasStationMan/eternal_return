package org.EternalReturn.Util.Gui.bossbarGui;

import org.bukkit.plugin.Plugin;

import java.util.ArrayList;
import java.util.List;

public class BMouseCursorObserver implements Runnable{

    private static BMouseCursorObserver instance;
    private Plugin plugin;
    private List<BossbarGui> guiList;

    private BMouseCursorObserver(){
        this.guiList = new ArrayList<>(16);
    }

    public void registerBossbarGui(BossbarGui gui){
        guiList.add(gui);
    }

    public BMouseCursorObserver getInstance(){
        if(instance == null){
            instance = new BMouseCursorObserver();
        }
        return instance;
    }

    @Override
    public void run() {

        for(BossbarGui bossbarGui : guiList){

            BGuiLocation mloc = bossbarGui.getMousePointerLocation();

            for(BButton bButton : bossbarGui.getBButtons()){



            }
        }

    }
}
