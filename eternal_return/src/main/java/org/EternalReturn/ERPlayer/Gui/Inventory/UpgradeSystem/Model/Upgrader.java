package org.EternalReturn.ERPlayer.Gui.Inventory.UpgradeSystem.Model;

import org.EternalReturn.System.SystemManager;
import org.EternalReturn.util.itemUtill.CustomModelData;
import org.EternalReturn.util.itemUtill.CustomModelDataManager;
import org.bukkit.Material;
import org.bukkit.NamespacedKey;
import org.bukkit.attribute.AttributeModifier;
import org.bukkit.enchantments.Enchantment;
import org.bukkit.inventory.EquipmentSlot;
import org.bukkit.inventory.EquipmentSlotGroup;
import org.bukkit.inventory.ItemStack;

import org.bukkit.attribute.Attribute;
import org.bukkit.inventory.meta.ArmorMeta;
import org.bukkit.inventory.meta.ItemMeta;
import org.bukkit.inventory.meta.components.EquippableComponent;

import java.util.Set;

public class Upgrader extends Enchanter {

    private ItemStack upgraderItem;
    private Set<String> playerScoreboardTags;
    
    //생나
    public static UpgradeBlock TREEOFLIFE_HELMET = new UpgradeBlock()
            .addAttributes(Attribute.ARMOR, 3, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.HEAD)
            .addAttributes(Attribute.MAX_HEALTH, 3, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.HEAD)
            .addEnchantment(Enchantment.THORNS, 2)
            .setMaterialAfterUpgrade(Material.DIAMOND_HELMET);

    public static UpgradeBlock TREEOFLIFE_CHESTPLATE = new UpgradeBlock()
            .addAttributes(Attribute.ARMOR, 8, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.CHEST)
            .addAttributes(Attribute.MAX_HEALTH, 8, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.CHEST)
            .addAttributes(Attribute.SCALE, 0.05, AttributeModifier.Operation.MULTIPLY_SCALAR_1,EquipmentSlotGroup.CHEST)
            .setMaterialAfterUpgrade(Material.DIAMOND_CHESTPLATE);

    public static UpgradeBlock TREEOFLIFE_LEGGINGS = new UpgradeBlock()
            .addAttributes(Attribute.ARMOR, 6, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.LEGS)
            .addAttributes(Attribute.MAX_HEALTH, 4, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.LEGS)
            .setMaterialAfterUpgrade(Material.DIAMOND_LEGGINGS);

    public static UpgradeBlock TREEOFLIFE_BOOTS = new UpgradeBlock()
            .addAttributes(Attribute.ARMOR, 3, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.FEET)
            .addAttributes(Attribute.MAX_HEALTH, 2, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.FEET)
            .setMaterialAfterUpgrade(Material.DIAMOND_BOOTS);

    public static UpgradeBlock TREEOFLIFE_STONESWORD = new UpgradeBlock()
            .addAttributes(Attribute.ATTACK_DAMAGE, 5 + 2, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.HAND)
            .setMaterialAfterUpgrade(Material.IRON_SWORD);

    public static UpgradeBlock TREEOFLIFE_IRONESWORD = new UpgradeBlock()
            .addEnchantment(Enchantment.FIRE_ASPECT, 1)
            .setMaterialAfterUpgrade(Material.DIAMOND_SWORD);

    public static UpgradeBlock TREEOFLIFE_BOW = new UpgradeBlock()
            .addEnchantment(Enchantment.PUNCH, 1)
            .setMaterialAfterUpgrade(Material.BOW);

    //운석
    public static UpgradeBlock METEORITE_HELMET = new UpgradeBlock()
            .addAttributes(Attribute.ARMOR, 3, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.HEAD)
            .addEnchantment(Enchantment.PROJECTILE_PROTECTION, 4)
            .setMaterialAfterUpgrade(Material.DIAMOND_HELMET);

    public static UpgradeBlock METEORITE_CHESTPLATE = new UpgradeBlock()
            .addAttributes(Attribute.ARMOR, 8, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.CHEST)
            .addAttributes(Attribute.MAX_HEALTH, 4, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.CHEST)
            .addEnchantment(Enchantment.THORNS, 2)
            .setMaterialAfterUpgrade(Material.DIAMOND_CHESTPLATE);

    public static UpgradeBlock METEORITE_LEGGINGS = new UpgradeBlock()
            .addAttributes(Attribute.ARMOR, 6, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.LEGS)
            .addAttributes(Attribute.MAX_HEALTH, 3, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.LEGS)
            .addAttributes(Attribute.ATTACK_DAMAGE, 2, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.LEGS)
            .setMaterialAfterUpgrade(Material.DIAMOND_LEGGINGS);

    public static UpgradeBlock METEORITE_BOOTS = new UpgradeBlock()
            .addAttributes(Attribute.ARMOR, 3, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.FEET)
            .addAttributes(Attribute.ATTACK_SPEED, 0.1, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.FEET)
            .addAttributes(Attribute.MOVEMENT_SPEED, 0.005, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.FEET)
            .setMaterialAfterUpgrade(Material.DIAMOND_BOOTS);

    public static UpgradeBlock METEORITE_STONESWORD = new UpgradeBlock()
            .addAttributes(Attribute.ATTACK_DAMAGE, 5 + 4, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.HAND)
            .setMaterialAfterUpgrade(Material.IRON_SWORD);

    public static UpgradeBlock METEORITE_IRONESWORD = new UpgradeBlock()
            .addAttributes(Attribute.ATTACK_DAMAGE, 6 + 3, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.HAND)
            .setMaterialAfterUpgrade(Material.DIAMOND_SWORD);

    public static UpgradeBlock METEORITE_BOW = new UpgradeBlock()
            .addEnchantment(Enchantment.FLAME, 1)
            .setMaterialAfterUpgrade(Material.BOW);
    
    //미스릴
    public static UpgradeBlock MITHRIL_HELMET = new UpgradeBlock()
            .addAttributes(Attribute.ARMOR, 3 + 1, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.HEAD)
            .addAttributes(Attribute.ATTACK_SPEED, 0.2, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.HEAD)
            .setMaterialAfterUpgrade(Material.DIAMOND_HELMET);

    public static UpgradeBlock MITHRIL_CHESTPLATE = new UpgradeBlock()
            .addAttributes(Attribute.ARMOR, 2 + 8, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.CHEST)
            .addAttributes(Attribute.MOVEMENT_SPEED, 0.005, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.CHEST)
            .setMaterialAfterUpgrade(Material.DIAMOND_CHESTPLATE);

    public static UpgradeBlock MITHRIL_LEGGINGS = new UpgradeBlock()
            .addAttributes(Attribute.ARMOR, 2 + 6, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.LEGS)
            .addEnchantment(Enchantment.SWIFT_SNEAK,3)
            .setMaterialAfterUpgrade(Material.DIAMOND_LEGGINGS);

    public static UpgradeBlock MITHRIL_BOOTS = new UpgradeBlock()
            .addAttributes(Attribute.ARMOR, 1 + 3, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.FEET)
            .addAttributes(Attribute.MOVEMENT_SPEED, 0.01, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.FEET)
            .setMaterialAfterUpgrade(Material.DIAMOND_BOOTS);

    public static UpgradeBlock MITHRIL_STONESWORD = new UpgradeBlock()
            .addAttributes(Attribute.ATTACK_DAMAGE, 5 + 1, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.HAND)
            .addAttributes(Attribute.ATTACK_SPEED, 1.6 + 0.2, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.HAND)
            .setMaterialAfterUpgrade(Material.IRON_SWORD);

    public static UpgradeBlock MITHRIL_IRONESWORD = new UpgradeBlock()
            .addAttributes(Attribute.ATTACK_DAMAGE, 6 + 2, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.HAND)
            .addAttributes(Attribute.ATTACK_SPEED, 1.6 + 0.2, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.HAND)
            .setMaterialAfterUpgrade(Material.DIAMOND_SWORD);

    public static UpgradeBlock MITHRIL_BOW = new UpgradeBlock()
            .addEnchantment(Enchantment.FLAME, 1)
            .setMaterialAfterUpgrade(Material.BOW);

    //포스코어
    public static UpgradeBlock FORCECORE_HELMET = new UpgradeBlock()
            .addAttributes(Attribute.ARMOR, 3, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.HEAD)
            .addAttributes(Attribute.MAX_HEALTH, 3, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.HEAD)
            .addAttributes(Attribute.SCALE, -0.05, AttributeModifier.Operation.MULTIPLY_SCALAR_1,EquipmentSlotGroup.HEAD)
            .addEnchantment(Enchantment.THORNS, 2)
            .setMaterialAfterUpgrade(Material.NETHERITE_HELMET);

    public static UpgradeBlock FORCECORE_CHESTPLATE = new UpgradeBlock()
            .addAttributes(Attribute.ARMOR, 8, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.CHEST)
            .addAttributes(Attribute.MAX_HEALTH, 8, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.CHEST)
            .addEnchantment(Enchantment.PROTECTION, 1)
            .setMaterialAfterUpgrade(Material.NETHERITE_CHESTPLATE);

    public static UpgradeBlock FORCECORE_LEGGINGS = new UpgradeBlock()
            .addAttributes(Attribute.ARMOR, 6, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.LEGS)
            .addAttributes(Attribute.KNOCKBACK_RESISTANCE, 4, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.LEGS)
            .addEnchantment(Enchantment.PROTECTION, 3)
            .setMaterialAfterUpgrade(Material.NETHERITE_LEGGINGS);

    public static UpgradeBlock FORCECORE_BOOTS = new UpgradeBlock()
            .addAttributes(Attribute.ARMOR, 3 + 1, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.FEET)
            .addAttributes(Attribute.MAX_HEALTH, 3, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.FEET)
            .addAttributes(Attribute.MOVEMENT_SPEED, 0.005, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.FEET)
            .setMaterialAfterUpgrade(Material.NETHERITE_BOOTS);

    //혈액팩
    public static UpgradeBlock BLOOD_SAMPLE_HELMET = new UpgradeBlock()
            .addAttributes(Attribute.ARMOR, 3 + 2, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.HEAD)
            .addAttributes(Attribute.ATTACK_SPEED, 0.2, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.HEAD)
            .addAttributes(Attribute.ATTACK_DAMAGE, 2, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.HEAD)
            .setArmorModelString("minecraft:blood")
            .setEquimentSlot(EquipmentSlot.HEAD)
            .setMaterialAfterUpgrade(Material.NETHERITE_HELMET);

    public static UpgradeBlock BLOOD_SAMPLE_CHESTPLATE = new UpgradeBlock()
            .addAttributes(Attribute.ARMOR, 8 + 2, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.CHEST)
            .addAttributes(Attribute.MAX_HEALTH, 6, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.CHEST)
            .setArmorModelString("minecraft:blood")
            .setEquimentSlot(EquipmentSlot.CHEST)
            .setMaterialAfterUpgrade(Material.NETHERITE_CHESTPLATE);

    public static UpgradeBlock BLOOD_SAMPLE_LEGGINGS = new UpgradeBlock()
            .addAttributes(Attribute.ARMOR, 6, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.LEGS)
            .addAttributes(Attribute.ATTACK_DAMAGE, 4, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.LEGS)
            .setArmorModelString("minecraft:blood")
            .setEquimentSlot(EquipmentSlot.LEGS)
            .setMaterialAfterUpgrade(Material.NETHERITE_LEGGINGS);

    public static UpgradeBlock BLOOD_SAMPLE_BOOTS = new UpgradeBlock()
            .addAttributes(Attribute.ARMOR, 3, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.FEET)
            .addAttributes(Attribute.MAX_HEALTH, 4, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.FEET)
            .addAttributes(Attribute.MOVEMENT_SPEED, 0.015, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.FEET)
            .setArmorModelString("minecraft:blood")
            .setEquimentSlot(EquipmentSlot.FEET)
            .setMaterialAfterUpgrade(Material.DIAMOND_BOOTS);

    public void free(){
        super.free();
        TREEOFLIFE_HELMET = null;
        TREEOFLIFE_CHESTPLATE = null;
        TREEOFLIFE_LEGGINGS = null;
        TREEOFLIFE_BOOTS = null;

        METEORITE_HELMET = null;
        METEORITE_CHESTPLATE = null;
        METEORITE_LEGGINGS = null;
        METEORITE_BOOTS = null;

        MITHRIL_HELMET = null;
        MITHRIL_CHESTPLATE = null;
        MITHRIL_LEGGINGS = null;
        MITHRIL_BOOTS = null;

        FORCECORE_HELMET = null;
        FORCECORE_CHESTPLATE = null;
        FORCECORE_LEGGINGS = null;
        FORCECORE_BOOTS = null;

        BLOOD_SAMPLE_HELMET = null;
        BLOOD_SAMPLE_CHESTPLATE = null;
        BLOOD_SAMPLE_LEGGINGS = null;
        BLOOD_SAMPLE_BOOTS = null;

        playerScoreboardTags = null;
        upgraderItem = null;

    }



    public Upgrader(){
        super();

        //////  IH     IC     IL     IB      SS      IS      BW     SA     IA      DA      NA      FR      MC
        expandY(SystemManager.EPIC_BLOOD_SAMPLE, new Object[]{
                BLOOD_SAMPLE_HELMET, BLOOD_SAMPLE_CHESTPLATE, BLOOD_SAMPLE_LEGGINGS, BLOOD_SAMPLE_BOOTS,
                false, false, false, false, false, false, false, false
        });
        expandY(SystemManager.EPIC_FORCE_CORE, new Object[]{
                FORCECORE_HELMET, FORCECORE_CHESTPLATE, FORCECORE_LEGGINGS, FORCECORE_BOOTS,
                false, false, false, false, false, false, false, false
        });
        expandY(SystemManager.EPIC_METEORITE, new Object[]{
                METEORITE_HELMET, METEORITE_CHESTPLATE, METEORITE_LEGGINGS, METEORITE_BOOTS,
                METEORITE_STONESWORD, METEORITE_IRONESWORD, METEORITE_BOW, false, false, false, false, false
        });
        expandY(SystemManager.EPIC_MITHRIL, new Object[]{
                MITHRIL_HELMET, MITHRIL_CHESTPLATE, MITHRIL_LEGGINGS, MITHRIL_BOOTS,
                MITHRIL_STONESWORD, MITHRIL_IRONESWORD, MITHRIL_BOW, false, false, false, false, false
        });
        expandY(SystemManager.EPIC_TREE_OF_LIFE, new Object[]{
                TREEOFLIFE_HELMET, TREEOFLIFE_CHESTPLATE, TREEOFLIFE_LEGGINGS, TREEOFLIFE_BOOTS,
                TREEOFLIFE_STONESWORD, TREEOFLIFE_IRONESWORD, TREEOFLIFE_BOW, false, false, false, false, false
        });

    }

    public ItemStack enchant() {
        this.item = super.enchant();

        CustomModelDataManager CustomModelDataManager = SystemManager.getCustomModelDataManager();

        if(upgrader == null || !upgrader.hasItemMeta()){
            return item;
        }

        CustomModelData CustomModelDataToCompare = CustomModelDataManager
                .setItem(upgrader)
                .getCustomModelData();

        if (CustomModelDataToCompare == null) {
            return item;
        }

        Object upgradeBlockObj = getState(item.getType(), CustomModelDataToCompare);
        if (!(upgradeBlockObj instanceof UpgradeBlock upgradeBlock)) {
            return item;
        }

        ItemMeta itemMeta;
        if ((itemMeta = item.getItemMeta()) == null) {
            return item;
        }

        item.setType(upgradeBlock.getMaterialToModify());
        String modelString;
        if((modelString = upgradeBlock.getArmorModelString()) != null){
            ArmorMeta armorMeta = (ArmorMeta) itemMeta;
            EquippableComponent equippable = armorMeta.getEquippable();

            equippable.setModel(NamespacedKey.fromString(modelString));
            equippable.setSlot(upgradeBlock.getEquipmentSlot());

            armorMeta.setEquippable(equippable);
        }

        //logic
        //for (Attribute attribute : upgradeBlock.getAttributes()) {
        //    itemMeta.addAttributeModifier(attribute, upgradeBlock.getAttributeModifier(attribute));
        //
        //}

        for(EnchantBlock e : upgradeBlock.getEnchantBlock()){
            itemMeta.addEnchant(e.getEnchantment(), e.getLevel(),false);
        }

        item.setItemMeta(itemMeta);
        super.successed = true;
        return item;
    }

    public void setPlayerScoreboardTags(Set<String> tags){
        this.playerScoreboardTags = tags;
    }
}
