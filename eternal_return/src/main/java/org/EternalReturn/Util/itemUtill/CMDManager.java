package org.EternalReturn.Util.itemUtill;

import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.ItemMeta;
import org.bukkit.inventory.meta.components.CustomModelDataComponent;

import java.util.List;

/**
 * Custom Model Data Manager
 * */
public class CMDManager {

    private ItemStack item;
    private CustomModelDataComponent cmdComponent;

    public void free(){
        item = null;
        cmdComponent = null;
    }

    public CMDManager(){
        this.item = null;
    }

    public CMDManager setItem(ItemStack item){
        this.item = item;
        try{
            ItemMeta itemMeta = null;
            if(item == null || (itemMeta = item.getItemMeta()) == null){
                throw new NullPointerException("아이템 또는 아이템의 meta가 null입니다.");
            }
            cmdComponent = itemMeta.getCustomModelDataComponent();
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
        try{
            List<Float> cmdStrings = cmdComponent.getFloats();

            if(cmdStrings == null){
                throw new NullPointerException("커스텀 모델 데이터의 Float 데이터가 없습니다.");
            }

            for(Float cmdFloat : cmdStrings){
                if(cmdFloat == cmd){
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

    /**
     * String 값을 기반으로 찾는 기능
     * */
    public boolean hasStringCMD(String cmd){
        try{
            List<String> cmdStrings = cmdComponent.getStrings();

            if(cmdStrings == null){
                throw new NullPointerException("커스텀 모델 데이터의 문자열 데이터가 없습니다.");
            }

            for(String cmdString : cmdStrings){
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




}
