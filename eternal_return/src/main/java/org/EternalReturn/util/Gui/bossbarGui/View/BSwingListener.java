package org.EternalReturn.util.Gui.bossbarGui.View;

import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.block.Action;
import org.bukkit.event.player.PlayerInteractEvent;

import java.util.List;


public class BSwingListener implements Listener {

    @EventHandler
    public void onPlayerInteraction(PlayerInteractEvent e){
        //플레이어가
        Action action = e.getAction();
        Player p = e.getPlayer();
        if(action.equals(Action.LEFT_CLICK_AIR) || action.equals(Action.LEFT_CLICK_BLOCK)){ //좌클릭 시
            onPlayerRightClicked(p);
        }
    }

    /**
     * 플레이어가 좌클릭을 했을 때 실행되는 함수임. <br>
     * 이 함수를 실행하는 함수 :
     *      @EventHandler void onPlayerInteraction(PlayerInteractEvent e){...} <br>
     * */
    private void onPlayerRightClicked(Player p){
        BSwingPlayer bplayer = BSwingManager.getBSwingPlayer(p);
        BFrame guiFrame = (BFrame)bplayer.opened();

        List<BButton> buttonList = guiFrame.getBButtons();

        if(buttonList.isEmpty() || guiFrame == null){
            return;
        }

        for(BButton btn : buttonList){

            //버튼이 가지고 있는 액션리스너를 사용
            List<BActionListener> actionListeners = btn.getActionListeners();
            if(actionListeners.isEmpty()){
                continue;
            }
            
            //해당 버튼의 액션리스너들을 호출
            for(BActionListener actionListener : actionListeners){
                actionListener.actionPerformed(btn, bplayer);
            }
        }

    }



}
