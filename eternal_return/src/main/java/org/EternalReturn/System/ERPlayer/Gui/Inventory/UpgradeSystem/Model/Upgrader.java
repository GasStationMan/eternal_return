package org.EternalReturn.System.ERPlayer.Gui.Inventory.UpgradeSystem.Model;

import org.EternalReturn.System.SystemManager;
import org.EternalReturn.Util.itemUtill.CMDBlock;
import org.EternalReturn.Util.itemUtill.CMDManager;
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

public class Upgrader extends Enchanter {

    private ItemStack upgraderItem;
    
    //생나
    public static UpgradeBlock TREEOFLIFE_HELMET = new UpgradeBlock()
            .addAttributes(Attribute.MAX_HEALTH, 3, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.HEAD)
            .addEnchantment(Enchantment.THORNS, 2)
            .setMaterialAfterUpgrade(Material.DIAMOND_HELMET);

    public static UpgradeBlock TREEOFLIFE_CHESTPLATE = new UpgradeBlock()
            .addAttributes(Attribute.MAX_HEALTH, 8, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.CHEST)
            .addAttributes(Attribute.SCALE, 1.05, AttributeModifier.Operation.MULTIPLY_SCALAR_1,EquipmentSlotGroup.CHEST)
            .setMaterialAfterUpgrade(Material.DIAMOND_CHESTPLATE);

    public static UpgradeBlock TREEOFLIFE_LEGGINGS = new UpgradeBlock()
            .addAttributes(Attribute.MAX_HEALTH, 4, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.LEGS)
            .setMaterialAfterUpgrade(Material.DIAMOND_LEGGINGS);

    public static UpgradeBlock TREEOFLIFE_BOOTS = new UpgradeBlock()
            .addAttributes(Attribute.MAX_HEALTH, 2, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.FEET)
            .setMaterialAfterUpgrade(Material.DIAMOND_BOOTS);

    //운석
    public static UpgradeBlock METEORITE_HELMET = new UpgradeBlock()
            .addEnchantment(Enchantment.PROJECTILE_PROTECTION, 4)
            .setMaterialAfterUpgrade(Material.DIAMOND_HELMET);

    public static UpgradeBlock METEORITE_CHESTPLATE = new UpgradeBlock()
            .addAttributes(Attribute.MAX_HEALTH, 4, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.CHEST)
            .addEnchantment(Enchantment.THORNS, 2)
            .setMaterialAfterUpgrade(Material.DIAMOND_CHESTPLATE);

    public static UpgradeBlock METEORITE_LEGGINGS = new UpgradeBlock()
            .addAttributes(Attribute.MAX_HEALTH, 3, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.LEGS)
            .addAttributes(Attribute.ATTACK_DAMAGE, 2, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.LEGS)
            .setMaterialAfterUpgrade(Material.DIAMOND_LEGGINGS);

    public static UpgradeBlock METEORITE_BOOTS = new UpgradeBlock()
            .addAttributes(Attribute.ATTACK_SPEED, 0.1, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.LEGS)
            .addAttributes(Attribute.MOVEMENT_SPEED, 0.005, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.LEGS)
            .setMaterialAfterUpgrade(Material.DIAMOND_BOOTS);
    
    //미스릴
    public static UpgradeBlock MITHRIL_HELMET = new UpgradeBlock()
            .addAttributes(Attribute.ARMOR, 1, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.HEAD)
            .addAttributes(Attribute.ATTACK_SPEED, 0.2, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.HEAD)
            .setMaterialAfterUpgrade(Material.DIAMOND_HELMET);

    public static UpgradeBlock MITHRIL_CHESTPLATE = new UpgradeBlock()
            .addAttributes(Attribute.ARMOR, 2, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.CHEST)
            .addAttributes(Attribute.MOVEMENT_SPEED, 0.005, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.CHEST)
            .setMaterialAfterUpgrade(Material.DIAMOND_CHESTPLATE);

    public static UpgradeBlock MITHRIL_LEGGINGS = new UpgradeBlock()
            .addAttributes(Attribute.ARMOR, 2, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.LEGS)
            .addEnchantment(Enchantment.SWIFT_SNEAK,3)
            .setMaterialAfterUpgrade(Material.DIAMOND_LEGGINGS);

    public static UpgradeBlock MITHRIL_BOOTS = new UpgradeBlock()
            .addAttributes(Attribute.ARMOR, 1, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.FEET)
            .addAttributes(Attribute.MOVEMENT_SPEED, 0.01, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.FEET)
            .setMaterialAfterUpgrade(Material.DIAMOND_BOOTS);
    
    //포스코어
    public static UpgradeBlock FORCECORE_HELMET = new UpgradeBlock()
            .addAttributes(Attribute.MAX_HEALTH, 3, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.HEAD)
            .addAttributes(Attribute.SCALE, 0.95, AttributeModifier.Operation.MULTIPLY_SCALAR_1,EquipmentSlotGroup.HEAD)
            .addEnchantment(Enchantment.THORNS, 2)
            .setMaterialAfterUpgrade(Material.DIAMOND_HELMET);

    public static UpgradeBlock FORCECORE_CHESTPLATE = new UpgradeBlock()
            .addAttributes(Attribute.MAX_HEALTH, 8, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.CHEST)
            .addEnchantment(Enchantment.PROTECTION, 1)
            .setMaterialAfterUpgrade(Material.DIAMOND_CHESTPLATE);

    public static UpgradeBlock FORCECORE_LEGGINGS = new UpgradeBlock()
            .addAttributes(Attribute.KNOCKBACK_RESISTANCE, 4, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.LEGS)
            .addEnchantment(Enchantment.PROTECTION, 3)
            .setMaterialAfterUpgrade(Material.DIAMOND_LEGGINGS);

    public static UpgradeBlock FORCECORE_BOOTS = new UpgradeBlock()
            .addAttributes(Attribute.MAX_HEALTH, 3, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.FEET)
            .addAttributes(Attribute.ARMOR, 1, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.FEET)
            .addAttributes(Attribute.MOVEMENT_SPEED, 0.005, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.FEET)
            .setMaterialAfterUpgrade(Material.DIAMOND_BOOTS);

    //혈액팩
    public static UpgradeBlock BLOOD_SAMPLE_HELMET = new UpgradeBlock()
            .addAttributes(Attribute.ARMOR, 2, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.HEAD)
            .addAttributes(Attribute.ATTACK_SPEED, 0.2, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.HEAD)
            .addAttributes(Attribute.ATTACK_DAMAGE, 2, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.HEAD)
            .setArmorModelString("minecraft:blood")
            .setEquimentSlot(EquipmentSlot.HEAD)
            .setMaterialAfterUpgrade(Material.DIAMOND_HELMET);

    public static UpgradeBlock BLOOD_SAMPLE_CHESTPLATE = new UpgradeBlock()
            .addAttributes(Attribute.MAX_HEALTH, 6, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.CHEST)
            .addAttributes(Attribute.ARMOR, 2, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.CHEST)
            .setArmorModelString("minecraft:blood")
            .setEquimentSlot(EquipmentSlot.CHEST)
            .setMaterialAfterUpgrade(Material.DIAMOND_CHESTPLATE);

    public static UpgradeBlock BLOOD_SAMPLE_LEGGINGS = new UpgradeBlock()
            .addAttributes(Attribute.ATTACK_DAMAGE, 4, AttributeModifier.Operation.ADD_NUMBER,EquipmentSlotGroup.LEGS)
            .setArmorModelString("minecraft:blood")
            .setEquimentSlot(EquipmentSlot.LEGS)
            .setMaterialAfterUpgrade(Material.DIAMOND_LEGGINGS);

    public static UpgradeBlock BLOOD_SAMPLE_BOOTS = new UpgradeBlock()
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

    }



    public Upgrader(){
        super();

        expandY(SystemManager.EPIC_BLOOD_SAMPLE, new Object[]{
            BLOOD_SAMPLE_HELMET, BLOOD_SAMPLE_CHESTPLATE, BLOOD_SAMPLE_LEGGINGS, BLOOD_SAMPLE_BOOTS,
                false, false, false, false, false, false, false, false, false, false
        });
        expandY(SystemManager.EPIC_FORCE_CORE, new Object[]{
            FORCECORE_HELMET, FORCECORE_CHESTPLATE, FORCECORE_LEGGINGS, FORCECORE_BOOTS,
                false, false, false, false, false, false, false, false, false, false
        });
        expandY(SystemManager.EPIC_METEORITE, new Object[]{
            METEORITE_HELMET, METEORITE_CHESTPLATE, METEORITE_LEGGINGS, METEORITE_BOOTS,
                false, false, false, false, false, false, false, false, false, false
        });
        expandY(SystemManager.EPIC_MITHRIL, new Object[]{
            MITHRIL_HELMET, MITHRIL_CHESTPLATE, MITHRIL_LEGGINGS, MITHRIL_BOOTS,
                false, false, false, false, false, false, false, false, false, false
        });
        expandY(SystemManager.EPIC_TREE_OF_LIFE, new Object[]{
            TREEOFLIFE_HELMET, TREEOFLIFE_CHESTPLATE, TREEOFLIFE_LEGGINGS, TREEOFLIFE_BOOTS,
                false, false, false, false, false, false, false, false, false, false
        });
    }

    public ItemStack enchant() {
        this.item = super.enchant();

        CMDManager cmdManager = SystemManager.getCmdManager();

        if(upgrader == null || !upgrader.hasItemMeta()){
            return item;
        }

        CMDBlock cmdBlockToCompare = cmdManager
                .setItem(upgrader)
                .getCMDBlock();

        if (cmdBlockToCompare == null) {
            return item;
        }

        Object upgradeBlockObj = getState(item.getType(), cmdBlockToCompare);
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
        for (Attribute attribute : upgradeBlock.getAttributes()) {
            itemMeta.addAttributeModifier(attribute, upgradeBlock.getAttributeModifier(attribute));
        }
        item.setItemMeta(itemMeta);
        super.successed = true;
        return item;
    }
}
