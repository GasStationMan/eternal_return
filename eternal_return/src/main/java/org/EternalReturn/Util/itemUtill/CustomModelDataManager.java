package org.EternalReturn.Util.itemUtill;

import org.bukkit.NamespacedKey;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.ArmorMeta;
import org.bukkit.inventory.meta.ItemMeta;
import org.bukkit.inventory.meta.components.CustomModelDataComponent;

import java.util.List;

/**
 * Custom Model Data Manager
 * */
public class CustomModelDataManager {

    private ItemStack item;
    private CustomModelDataComponent cmdComponent;
    private List<Float> cmdFloatList;
    private List<String> cmdStringList;

    public void free(){
        item = null;
        cmdStringList = null;
        cmdFloatList = null;
        cmdComponent = null;
    }

    public CustomModelDataManager(){
        this.item = null;
        this.cmdComponent = null;
    }

    public CustomModelDataManager setItem(ItemStack item){
        this.item = item;
        try{
            ItemMeta itemMeta = null;
            if(item == null || (itemMeta = item.getItemMeta()) == null){
                throw new NullPointerException("아이템 또는 아이템의 meta가 null입니다.");
            }
            cmdComponent = itemMeta.getCustomModelDataComponent();
            cmdFloatList = cmdComponent.getFloats();
            cmdStringList = cmdComponent.getStrings();

            return this;
        }catch (NullPointerException e){
            e.printStackTrace();
            return this;
        }
    }


    /**
     * Float 값을 기반으로 찾는 기능
     * */
    public boolean hasFloatCMD(float cmd){
        if(cmdFloatList == null){
            throw new NullPointerException("커스텀 모델 데이터에 float 데이터가 없습니다.");
        }

        for(Float cmdFloat : cmdFloatList){
            if(cmdFloat == cmd){
                return true;
            }
        }
        return false;
    }

    /**
     * String 값을 기반으로 찾는 기능
     * */
    public boolean hasStringCMD(String cmd){
        try{
            if(cmdStringList == null){
                throw new NullPointerException("커스텀 모델 데이터의 문자열 데이터가 없습니다.");
            }

            for(String cmdString : cmdStringList){
                if(cmdString.equals(cmd)){
                    return true;
                }
            }
            return false;
        }
        catch (NullPointerException e){
            e.printStackTrace();
            return false;
        }
    }

    public boolean hasCustomModelData(CustomModelData CustomModelData){
        return hasStringCMD(CustomModelData.getCmdString()) && hasFloatCMD(CustomModelData.getCmdFloat());
    }

    /**
     * 해당 CustomModelDataManager가 관리하는 CMD데이터 중 일치하는 데이터가 CustomModelData에 있으면 그대로 반환. </br>
     * 없다면 null반환
     * */
    public CustomModelData getCustomModelData(){

        if(cmdFloatList == null
                || cmdStringList == null
                || cmdStringList.isEmpty()
                || cmdFloatList.isEmpty()){
            return null;
        }

        return new CustomModelData(cmdStringList.getFirst(), cmdFloatList.getFirst());
    }



}
