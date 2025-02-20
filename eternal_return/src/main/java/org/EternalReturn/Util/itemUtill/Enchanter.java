package org.EternalReturn.Util.itemUtill;

import org.EternalReturn.System.PluginInstance;
import org.bukkit.Material;
import org.bukkit.enchantments.Enchantment;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.EnchantmentStorageMeta;
import org.bukkit.inventory.meta.ItemMeta;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.List;

class EnchantBlock {
    private Enchantment enchantment;
    private int level;

    public EnchantBlock(Enchantment enchantment, int level){
        this.enchantment = enchantment;
        this.level = level;
    }

    public Enchantment getEnchantment(){
        return enchantment;
    }

    public int getLevel(){
        return level;
    }

}

//인챈트 북 & 인챈트를 가져와 복사하는 클래스
public class Enchanter {

    private ItemStack item;
    private List<EnchantBlock> enchantmentBlockList;

    public Enchanter(@NotNull ItemStack item, ItemStack enchantBook){
        this.item = item;

        ItemMeta enchantbookMeta = null;
        EnchantmentStorageMeta enchantmentStorageMeta = null;
        if(enchantBook == null || (enchantbookMeta = enchantBook.getItemMeta()) == null){
            return;
        }

        enchantmentBlockList = new ArrayList<>();
        enchantmentStorageMeta = (EnchantmentStorageMeta)enchantbookMeta;

        //인챈트 블록 리스트를 생성
        for(Enchantment enchantment : enchantmentStorageMeta.getStoredEnchants().keySet()){
            int level = enchantmentStorageMeta.getStoredEnchantLevel(enchantment);
            enchantmentBlockList.add(new EnchantBlock(enchantment, level));
        }

    }

    /**
     * 인챈트 리스트가 없는 경우 -> false 반환
     * 인챈트 리스트와 도구가 match하는 경우 -> true 반환
     * 그 외 -> true
     * */
    public boolean canEnchant(){
        if(enchantmentBlockList == null){
            return false;
        }

        if(isArmor()){
            for(EnchantBlock enchantmentBlock : enchantmentBlockList){
                Enchantment enchantment = enchantmentBlock.getEnchantment();
                if(enchantment.equals(Enchantment.PROTECTION)
                        || enchantment.equals(Enchantment.PROJECTILE_PROTECTION)
                        || enchantment.equals(Enchantment.BLAST_PROTECTION)
                        || enchantment.equals(Enchantment.FIRE_PROTECTION)){
                    return true;
                }
            }
        }

        if(isBow()){
            for(EnchantBlock enchantmentBlock : enchantmentBlockList){
                Enchantment enchantment = enchantmentBlock.getEnchantment();
                if(enchantment.equals(Enchantment.POWER)
                        || enchantment.equals(Enchantment.PUNCH)
                        || enchantment.equals(Enchantment.INFINITY)
                        || enchantment.equals(Enchantment.FLAME)){
                    return true;
                }
            }
        }

        if(isSword()){
            for(EnchantBlock enchantmentBlock : enchantmentBlockList){
                Enchantment enchantment = enchantmentBlock.getEnchantment();
                if(enchantment.equals(Enchantment.SMITE)
                        || enchantment.equals(Enchantment.INFINITY)
                        || enchantment.equals(Enchantment.SHARPNESS)
                        || enchantment.equals(Enchantment.KNOCKBACK)
                        || enchantment.equals(Enchantment.FIRE_ASPECT)){
                    return true;
                }
            }
        }

        return false;

    }

    private boolean isBow(){
        try{
            Material type = item.getType();
            return type.equals(Material.BOW)
                    || type.equals(Material.CROSSBOW);
        }catch (NullPointerException e){
            e.printStackTrace();
            return false;
        }
    }

    private boolean isSword(){
        try{
            Material type = item.getType();
            return type.equals(Material.IRON_SWORD)
                    || type.equals(Material.DIAMOND_SWORD)
                    || type.equals(Material.NETHERITE_SWORD);
        }catch (NullPointerException e){
            e.printStackTrace();
            return false;
        }
    }

    private boolean isArmor(){
        try{
            Material type = item.getType();
            return type.equals(Material.IRON_HELMET)
                    || type.equals(Material.IRON_CHESTPLATE)
                    || type.equals(Material.IRON_LEGGINGS)
                    || type.equals(Material.IRON_BOOTS)
                    || type.equals(Material.DIAMOND_HELMET)
                    || type.equals(Material.DIAMOND_CHESTPLATE)
                    || type.equals(Material.DIAMOND_LEGGINGS)
                    || type.equals(Material.DIAMOND_BOOTS)
                    || type.equals(Material.NETHERITE_HELMET)
                    || type.equals(Material.NETHERITE_CHESTPLATE)
                    || type.equals(Material.NETHERITE_LEGGINGS)
                    || type.equals(Material.NETHERITE_BOOTS);
        }catch (NullPointerException e){
            e.printStackTrace();
            return false;
        }

    }

    /**
     * item이 null이면 -> null 반환 <br>
     * enchantment가 null이면 -> item 반환 <br>
     * 조건을 모두 만족하면 -> 인챈트 된 item 반환
     * */
    public ItemStack enchant(){

        if(item == null){
            return null;
        }
        
        if(enchantmentBlockList == null){
            return item;
        }

        for(EnchantBlock enchant : enchantmentBlockList){
            ItemMeta itemMeta = item.getItemMeta();
            itemMeta.addEnchant(enchant.getEnchantment(),enchant.getLevel(),false);
            item.setItemMeta(itemMeta);
        }

        return item;
    }
}
