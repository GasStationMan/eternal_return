package org.EternalReturn.Util.itemUtill;

import org.bukkit.enchantments.Enchantment;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.EnchantmentStorageMeta;
import org.bukkit.inventory.meta.ItemMeta;

import java.util.Set;

public class ItemModifier {

    private final ItemStack itemToMdf;

    public ItemModifier(ItemStack itemToMdf){
        this.itemToMdf = itemToMdf;
    }

    public ItemModifier addItemEnchantsFromEnchantBook(EnchantmentStorageMeta enchantmentStorageMeta){
        ItemMeta toBeEnchantedItemMeta = null;
        if(enchantmentStorageMeta == null
                || itemToMdf == null
                || (toBeEnchantedItemMeta = itemToMdf.getItemMeta()) == null){
            return this;
        }

        Set<Enchantment> enchantments = enchantmentStorageMeta.getStoredEnchants().keySet();

        for(Enchantment enchantment : enchantments){
            // 항상 인챈트 북 내의 인챈트 레벨을 가져올 때나, 인챈트를 가져올 때는 항상
            //  getStoredEnchantLevel()
            //  getStoredEnchants()
            // 을 이용하자. 컴파일로도 못 잡아낸다 ㄷㄷ
            int level = enchantmentStorageMeta.getStoredEnchantLevel(enchantment);
            toBeEnchantedItemMeta.addEnchant(enchantment, level,false);
            itemToMdf.setItemMeta(toBeEnchantedItemMeta);
        }
        return this;
    }

    public ItemStack confirm(){
        return itemToMdf;
    }

}
