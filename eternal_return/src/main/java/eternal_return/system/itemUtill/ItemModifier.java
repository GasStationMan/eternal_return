package eternal_return.system.itemUtill;

import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.ItemMeta;

import java.util.Arrays;

public class ItemModifier {

    private ItemStack targetItem;

    public ItemModifier(ItemStack targetItem){
        this.targetItem = targetItem;
    }

    public ItemModifier setTargetItem(ItemStack targetItem){
        this.targetItem = targetItem;
        return this;
    }

    //setter
    public ItemModifier setDisplayName(String string){

        ItemMeta meta = targetItem.getItemMeta();
        requireNonNull(meta,"[ERAPI] displayName을 수정할 수 없습니다. 앞선 객체가 NUll입니다.")
                .setDisplayName(string);
        targetItem.setItemMeta(meta);
        return this;
    }

    public ItemModifier setLore(String[] lore){
        ItemMeta meta = targetItem.getItemMeta();
        requireNonNull(meta,"[ERAPI] Lore을 수정할 수 없습니다. 앞선 객체가 NUll입니다.")
                .setLore(Arrays.asList(lore));
        targetItem.setItemMeta(meta);
        return this;
    }

    public ItemModifier setCustomModelData(Integer customModelData){
        ItemMeta meta = targetItem.getItemMeta();
        requireNonNull(meta,"[ERAPI] CustomModelData를 수정할 수 없습니다. 앞선 객체가 NUll입니다.")
                .setCustomModelData(customModelData);
        targetItem.setItemMeta(meta);
        return this;
    }

    public ItemStack confirm(){
        return targetItem;
    }
    
    
    //nullPointer 오류 띄우기
    private ItemMeta requireNonNull(ItemMeta itemMeta, String errMsg) throws NullPointerException{
        if(itemMeta == null){
            throw new NullPointerException(errMsg);
        }
        return itemMeta;
    }

}
