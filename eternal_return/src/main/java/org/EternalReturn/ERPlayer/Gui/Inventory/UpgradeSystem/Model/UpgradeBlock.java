package org.EternalReturn.ERPlayer.Gui.Inventory.UpgradeSystem.Model;

import org.EternalReturn.Util.itemUtill.CustomModelData;
import org.bukkit.Material;
import org.bukkit.NamespacedKey;
import org.bukkit.attribute.AttributeModifier;
import org.bukkit.attribute.Attribute;
import org.bukkit.enchantments.Enchantment;
import org.bukkit.inventory.EquipmentSlot;
import org.bukkit.inventory.EquipmentSlotGroup;

import java.util.*;

public class UpgradeBlock{

    private CustomModelData CustomModelData;
    private Map<Attribute,AttributeModifier> attributeModifierMap;
    private List<Attribute> attributes;
    private List<EnchantBlock> enchantBlocks;
    private String armorModelString;
    private Material material;
    private EquipmentSlot equipmentSlot;
    private List<String> tagsToGive;

    public UpgradeBlock(){
        enchantBlocks = new ArrayList<>(2);
        attributeModifierMap = new HashMap<>(5);
        attributes = new ArrayList<>(5);
        CustomModelData = new CustomModelData();
        tagsToGive = new ArrayList<>(2);
    }

    //getter
    public CustomModelData getCustomModelData(){
        return CustomModelData;
    }

    public List<Attribute> getAttributes(){
        return attributes;
    }

    public List<EnchantBlock> getEnchantBlock(){
        return enchantBlocks;
    }

    public AttributeModifier getAttributeModifier(Attribute attribute){
        try{
            if(!hasAttribute(attribute)){
                throw new IllegalArgumentException("이 UpgradeBlock엔 매개변수의 Attribute에 대응하는 AttributeModifier 정보가 없습니다." +
                "매개변수 Attribute 정보 : " + attribute.getTranslationKey());
            }
            return attributeModifierMap.get(attribute);
        }
        catch (IllegalStateException e){
            e.printStackTrace();
            return null;
        }
    }

    public Material getMaterialToModify(){
        return material;
    }

    public String getArmorModelString(){
        return armorModelString;
    }

    public EquipmentSlot getEquipmentSlot(){
        return equipmentSlot;
    }



    //setter
    public UpgradeBlock addEnchantment(Enchantment enchantment, int level){
        enchantBlocks.add(new EnchantBlock(enchantment, level));
        return this;
    }

    public UpgradeBlock addAttributes(Attribute attribute, double amount, AttributeModifier.Operation operation, EquipmentSlotGroup equipmentSlotGroup){
        NamespacedKey namespacedKey = attribute.getKeyOrThrow();
        attributes.add(attribute);
        attributeModifierMap.put(
                attribute,
                new AttributeModifier(namespacedKey, amount, operation, equipmentSlotGroup)
        );
        return this;
    }

    public UpgradeBlock setCustomModelData(String string, float fvalue){
        CustomModelData.setCmdString(string);
        CustomModelData.setCmdFloat(fvalue);
        return this;
    }

    public UpgradeBlock setArmorModelString(String armorComponentEquipableString){
        armorModelString = armorComponentEquipableString;
        return this;
    }

    private boolean hasAttribute(Attribute attribute){
        for(Attribute attributeWhichItHave : attributes){
            if(attributeWhichItHave == attribute){
                return true;
            }
        }
        return false;
    }

    public UpgradeBlock setMaterialAfterUpgrade(Material material){
        this.material = material;
        return this;
    }

    public UpgradeBlock setEquimentSlot(EquipmentSlot slot){
        equipmentSlot = slot;
        return this;
    }

    public UpgradeBlock addTag(String tag){
        tagsToGive.add(tag);
        return this;
    }

    public UpgradeBlock addTags(String[] tags){
        tagsToGive.addAll(Arrays.asList(tags));
        return this;
    }



}
