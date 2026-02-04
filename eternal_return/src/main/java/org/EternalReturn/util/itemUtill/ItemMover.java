package org.EternalReturn.util.itemUtill;

import org.bukkit.inventory.ItemStack;

public class ItemMover{
    private ItemStack item;
    private int index;

    public ItemMover(ItemStack item, int index){
        this.item = item;
        this.index = index;
    }

    public int getIndex() {
        return index;
    }

    public ItemStack getItemStack(){
        return item;
    }
}
