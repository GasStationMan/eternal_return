package org.EternalReturn.Util.itemUtill;

import org.bukkit.Material;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.ItemMeta;

import java.util.Arrays;

public class ItemGenerator {

    private ItemStack targetItem;

    public ItemGenerator(Material material){
        this.targetItem = new ItemStack(material);
    }

    public ItemGenerator setTargetItem(ItemStack targetItem){
        this.targetItem = targetItem;
        return this;
    }

    //setter
    public ItemGenerator setDisplayName(String string){

        ItemMeta meta = targetItem.getItemMeta();
        requireNonNull(meta,"[ERAPI] displayName을 수정할 수 없습니다. 앞선 객체가 NUll입니다.")
                .setDisplayName(string);
        targetItem.setItemMeta(meta);
        return this;
    }

    public ItemGenerator setLore(String[] lore){
        ItemMeta meta = targetItem.getItemMeta();
        requireNonNull(meta,"[ERAPI] Lore을 수정할 수 없습니다. 앞선 객체가 NUll입니다.")
                .setLore(Arrays.asList(lore));
        targetItem.setItemMeta(meta);
        return this;
    }

    public ItemGenerator setCustomModelData(Integer customModelData){
        ItemMeta meta = targetItem.getItemMeta();
        requireNonNull(meta,"[ERAPI] CustomModelData를 수정할 수 없습니다. 앞선 객체가 NUll입니다.")
                .setCustomModelData(customModelData);
        targetItem.setItemMeta(meta);
        return this;
    }
    
    
    //nullPointer 오류 띄우기
    private ItemMeta requireNonNull(ItemMeta itemMeta, String errMsg) throws NullPointerException{
        if(itemMeta == null){
            throw new NullPointerException(errMsg);
        }
        return itemMeta;
    }

    public ItemStack generate() {
        return targetItem;
    }
}
