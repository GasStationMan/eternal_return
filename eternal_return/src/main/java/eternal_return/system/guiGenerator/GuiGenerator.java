package eternal_return.system.guiGenerator;

import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.ItemStack;

public class GuiGenerator {

    private Inventory gui;

    public GuiGenerator(Player p, int size){
        gui = Bukkit.createInventory(p,size);
    }

    public GuiGenerator(int size){
        gui = Bukkit.createInventory(null,size);
    }

    public Inventory setContents(ItemStack[] menuItems){
        setMenuGui(menuItems);
        return gui;
    }

    private void setMenuGui(ItemStack[] menuItems){

        try{
            if(menuItems.length != gui.getSize()){
                throw new Exception("매개변수 menuItem의 크기가 gui크기와 다릅니다.");
            }

            int sizeOfGui = gui.getSize();
            for(int i = 0 ; i < sizeOfGui; i ++){

                //비어있는 부분(null)인 경우 GRAY_STAINED_GLASS_PANE으로 채운다.
                if(menuItems[i] == null){
                    gui.setItem(i,new ItemStack(Material.GRAY_STAINED_GLASS_PANE));
                }
                else{ //아니면 원래 아이템을 채워 넣는다.
                    gui.setItem(i,menuItems[i]);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}