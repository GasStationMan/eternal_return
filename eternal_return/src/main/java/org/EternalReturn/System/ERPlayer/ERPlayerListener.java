package org.EternalReturn.System.ERPlayer;

import org.EternalReturn.System.ERPlayer.Gui.Bossbars.RumiaIsland.extendsBComponent.HBButton;
import org.EternalReturn.System.SystemManager;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BButton;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BFrame;
import org.bukkit.Sound;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.block.Action;
import org.bukkit.event.player.PlayerInteractEvent;
import org.bukkit.event.player.PlayerJoinEvent;
import org.bukkit.event.player.PlayerQuitEvent;

import java.util.HashMap;
import java.util.Set;

public class ERPlayerListener implements Listener {
    private SystemManager systemManager;
    private HashMap<Player,ERPlayer> playerHashMap;

    public ERPlayerListener(SystemManager manager) {
        this.systemManager = manager;
        this.playerHashMap = systemManager.getErPlayerHashMap();
    }

    /**
     * 플레이어가 좌클릭을 했을 때 실행되는 함수임. <br>
     * 이 함수를 실행하는 함수 :
     *      @EventHandler void onPlayerInteraction(PlayerInteractEvent e){...} <br>
     * */
    private void onPlayerRightClicked(Player p){
        ERPlayer erPlayer = playerHashMap.get(p);
        BFrame guiFrame = erPlayer.getCurrentOpened();

        //열린 상황이 아니라면 & 마우스 커서 밑에 BButton 객체가 없다면
        BButton selectedButton = null;
        if(guiFrame == null || (selectedButton = guiFrame.getCurrentButtonUnderCursor()) == null){
            return;
        }

        String bGuiName = guiFrame.getName();
        Set<String> tags = p.getScoreboardTags();


        if(bGuiName.equals("hyperloop")){
            HBButton hbButton = (HBButton) selectedButton;
            if(hbButton.getZoneState() == SystemManager.GREEN_ZONE || hbButton.getZoneState() == SystemManager.YELLOW_ZONE){
                tags.add("warp");
                tags.add(selectedButton.getBButton());
                tags.remove(erPlayer.closeCurrentOpenedGui());
                p.playSound(p.getLocation(), Sound.BLOCK_AMETHYST_BLOCK_BREAK, 1.0F, 1.0F);
            }
        }

        else if(bGuiName.equals("kiosk")){
            tags.add(selectedButton.getBButton());
            tags.remove(erPlayer.closeCurrentOpenedGui());
            p.playSound(p.getLocation(), Sound.BLOCK_AMETHYST_BLOCK_BREAK, 1.0F, 1.0F);
        }

        //debug
        //p.sendMessage(selectedButton.getBButton());
    }

    @EventHandler public void onPlayerInteraction(PlayerInteractEvent e){

        //플레이어가
        Action action = e.getAction();
        Player p = e.getPlayer();
        if(action.equals(Action.LEFT_CLICK_AIR) || action.equals(Action.LEFT_CLICK_BLOCK)){ //좌클릭 시
            onPlayerRightClicked(p);
        }
    }

    @EventHandler public void onPlayerJoin(PlayerJoinEvent e){
        Player p = e.getPlayer();
        systemManager.addPlayer(p);
        System.out.println("플레이어가 업데이트되었습니다. : ");
        p.sendMessage("당신이 리스트에 추가되었습니다.");
    }

    @EventHandler public void onPlayerLeave(PlayerQuitEvent e){
        Player p = e.getPlayer();
        systemManager.removePlayer(p);
        System.out.println("플레이어가 업데이트되었습니다. : ");
        p.sendMessage("플레이어가 게임을 떠났습니다.");
    }

}
