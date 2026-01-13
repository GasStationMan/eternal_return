package org.EternalReturn.ERPlayer.Gui.Inventory.UpgradeSystem.Model;

import org.bukkit.enchantments.Enchantment;

public class EnchantBlock {
    protected Enchantment enchantment;
    protected int level;
    public void free(){
        enchantment = null;
    }

    public EnchantBlock(){
        this.enchantment = null;
        this.level = 0;
    }

    public EnchantBlock(Enchantment enchantment, int level){
        this.enchantment = enchantment;
        this.level = level;
    }
    //getter
    public Enchantment getEnchantment(){
        return enchantment;
    }
    public int getLevel(){
        return level;
    }

    //setter
    public void setEnchantment(Enchantment enchantment){
        this.enchantment = enchantment;
    }
    public void setLevel(int level){
        this.level = level;
    }

}

