package org.EternalReturn.Util.Gui.Inventory.InventoryGui;

import org.EternalReturn.System.ERPlayer.ERPlayer;
import org.bukkit.Bukkit;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.ItemStack;

public class InventoryGui{

    protected Inventory gui;
    protected ERPlayer erPlayer;

    public void free() {
        gui.clear();
        gui = null;
        erPlayer = null;
    }

    public InventoryGui(ERPlayer erPlayer, int size){
        this.gui = Bukkit.createInventory(erPlayer.getPlayer(),size);
        this.erPlayer = erPlayer;
    }

    public InventoryGui(int size){
        gui = Bukkit.createInventory(null,size);
    }

    public void setItemOnGui(int x, int y, ItemStack item){

        try{
            int index = GuiPos.getPos(x,y);
            if(index >= gui.getSize()){
                throw new Exception("리스트의 경계를 넘었습니다! 입력된 길이 : " + index + "/ 리스트의 길이 : " + gui.getSize());
            }
            gui.setItem(GuiPos.getPos(x,y),item);
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    public Inventory getGui(){
        return gui;
    }



    public ERPlayer getERPlayer() {
        return erPlayer;
    }
}