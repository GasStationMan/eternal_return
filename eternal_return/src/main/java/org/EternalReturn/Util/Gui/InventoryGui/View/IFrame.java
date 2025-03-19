package org.EternalReturn.Util.Gui.InventoryGui.View;

import org.bukkit.Bukkit;
import org.bukkit.entity.Player;
import org.bukkit.event.inventory.InventoryClickEvent;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.ItemStack;

import java.util.ArrayList;
import java.util.List;

public class IFrame {

    protected Inventory gui;
    protected Player player;
    protected int row;
    protected String name;

    protected List<IComponent> components;

    public void free() {
        gui.clear();
        gui = null;
        player = null;
    }

    public IFrame(Player player, int row){
        this.row = row;
        this.gui = Bukkit.createInventory(player,row * 9);
        this.player = player;
        this.components = new ArrayList<>(16);
    }

    //setter
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

    public void add(IComponent component){
        components.add(component);
        component.setIFrame(this);
    }

    //getter
    public Inventory getGui(){
        return gui;
    }

    public int getRow(){
        return row;
    }

    public void getClicked(InventoryClickEvent e, GuiPos clickedPos){
        for(IComponent c : components){
            if(c.isUnder(clickedPos)){
                if(c instanceof IButton){
                    e.setCancelled(true);
                }
                //...


            }
        }
    }

    public Player getPlayer() {
        return player;
    }
}