package org.EternalReturn.Util.Gui.bossbarGui.Controller;

import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BButton;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BComponent;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BGuiLocation;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BossbarGuiFrame;
import org.bukkit.plugin.Plugin;

import java.util.ArrayList;
import java.util.List;

public class BMouseCursorObserver implements Runnable{

    private static BMouseCursorObserver instance;
    private Plugin plugin;
    private List<BossbarGuiFrame> guiList;

    private BMouseCursorObserver(Plugin plugin){
        this.plugin = plugin;
        this.guiList = new ArrayList<>(16);
    }

    public void registerBossbarGui(BossbarGuiFrame gui){
        guiList.add(gui);
    }

    /**
     * 첫 번째 호출 시에는 싱글톤 객체를 만들고 <br>
     * 두 번째 호출부터는 싱글톤 객체를 반환함. <br>
     * 두 번째부터는 getInstance()메소드를 호출함이 바람직함.
     * */
    public static BMouseCursorObserver initialize(Plugin plugin){
        if(instance == null){
            instance = new BMouseCursorObserver(plugin);
        }
        return instance;
    }

    public static BMouseCursorObserver getInstance(){
        return instance;
    }

    @Override
    public void run() {

        for(BossbarGuiFrame bossbarGuiFrame : guiList){

            if(!bossbarGuiFrame.isOpen()){//안 열려 있으면 옵저버 대상에서 제외
                continue;
            }

            BComponent cursor = bossbarGuiFrame.getMouseCursor();
            if(cursor == null){
                continue;
            }

            BGuiLocation mloc = cursor.getLocation();
            if(mloc == null){
                continue;
            }

            for(BButton bButton : bossbarGuiFrame.getBButtons()){

                if(bButton.dotInPoly(mloc,300)){
                    PluginInstance.getServerInstance().getLogger().info(mloc.getX() + " , " + mloc.getY());
                    bButton.print();
                    break;
                }
            }
        }
    }
}
