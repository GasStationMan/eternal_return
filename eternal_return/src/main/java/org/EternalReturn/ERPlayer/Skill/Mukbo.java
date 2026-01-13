package org.EternalReturn.ERPlayer.Skill;

import org.EternalReturn.ERPlayer.ERPlayer;
import org.EternalReturn.System.SystemManager;
import org.EternalReturn.Util.itemUtill.CustomModelData;
import org.EternalReturn.Util.itemUtill.CustomModelDataManager;
import org.bukkit.attribute.Attribute;
import org.bukkit.entity.Player;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.ItemStack;
import org.bukkit.potion.PotionEffect;
import org.bukkit.potion.PotionEffectType;

import java.util.Arrays;
import java.util.Objects;

public class Mukbo extends Skill{

    private ERPlayer erPlayer;
    private ItemStack[] invContent;

    @Override
    public void free(){
        this.erPlayer = null;
        this.invContent = null;
    }

    public Mukbo(ERPlayer erPlayer) {
        super(10000,false);
        this.erPlayer = erPlayer;
    }

    private boolean hasFoodInInventory(Inventory inventory){
        invContent = inventory.getContents();

        CustomModelDataManager CustomModelDataManager = SystemManager.getCustomModelDataManager();

        for(ItemStack food : invContent){
            if(food == null){
                continue;
            }
            CustomModelDataManager.setItem(food);
            CustomModelData CustomModelData = CustomModelDataManager.getCustomModelData();
            if(CustomModelData == null){
                continue;
            }

            //CustomModelDataManager가 CustomModelData을 찾아냈다면
            String foodString = CustomModelData.getCmdString();
            float foodNumber = CustomModelData.getCmdFloat();
            if(foodString.equals("food") && (0 <= foodNumber && foodNumber <= 16)){
                food.setAmount(food.getAmount() - 1);
                inventory.setContents(invContent);
                Arrays.fill(invContent,null);
                return true;
            }

        }
        return false;
    }

    @Override
    public void skillEffect() {

        Player player = erPlayer.getPlayer();

        double maxHealth = Objects.requireNonNull(player.getAttribute(Attribute.MAX_HEALTH)).getBaseValue();

        if(maxHealth * 0.8 >= player.getHealth()){
            if(hasFoodInInventory(player.getInventory())){
                player.addPotionEffect(new PotionEffect(PotionEffectType.REGENERATION, 40, 1, true));
            }

        }

    }

}
