package org.EternalReturn.Util.InventoryGui;

import org.bukkit.Bukkit;
import org.bukkit.entity.Player;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.ItemStack;

public class InventoryGuiGenerator implements GuiGenerator{

    protected Inventory gui;
    protected Player player;

    public InventoryGuiGenerator(Player p, int size){
        gui = Bukkit.createInventory(p,size);
        player = p;
    }

    public InventoryGuiGenerator(int size){
        gui = Bukkit.createInventory(null,size);
    }

    public void setItemOnGui(int x, int y, ItemStack item){

        try{
            int index = GuiPos.getPositionOnInventory(x,y);
            if(index >= gui.getSize()){
                throw new Exception("리스트의 경계를 넘었습니다! 입력된 길이 : " + index + "/ 리스트의 길이 : " + gui.getSize());
            }
            gui.setItem(GuiPos.getPositionOnInventory(x,y),item);
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    public void free() {
        gui = null;
        player = null;
    }

    @Override
    public Inventory generateGui() {
        return gui;
    }
}