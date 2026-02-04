package org.EternalReturn.util.inventoryUtil;

import org.EternalReturn.System.PluginInstance;
import org.bukkit.Bukkit;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.ItemStack;
import org.bukkit.plugin.Plugin;
import org.bukkit.scheduler.BukkitScheduler;

public class InventoryModifier {

    private ItemStack[] content;
    private final Inventory inventory;
    private final Plugin pluginInstance;
    private final BukkitScheduler scheduler;


    public InventoryModifier(Inventory inv, Plugin pluginInstance, BukkitScheduler scheduler){
        this.inventory = inv;
        this.content = inventory.getContents();
        this.pluginInstance = pluginInstance;
        this.scheduler = scheduler;
    }

    public InventoryModifier(Inventory inv){
        this.inventory = inv;
        this.content = inventory.getContents();
        this.pluginInstance = PluginInstance.getServerInstance();
        this.scheduler = Bukkit.getScheduler();
    }

    public static void clear(ItemStack[] list){
        int length = list.length;
        for(int i = 0 ; i < length ; i ++){
            list[i] = null;
        }
    }

    public void setContent(Inventory fromInv){

        try{
            if(fromInv == null){
                throw new NullPointerException("setContent의 매개변수로 null이 들어왔습니다.");
            }

            ItemStack[] fromInvContent = fromInv.getContents();
            int contentLength = content.length;
            int fromInvLength = fromInvContent.length;

            if(contentLength >= fromInvLength){
                System.arraycopy(fromInvContent, 0, content, 0, fromInvLength);
            }
            else{
                System.arraycopy(fromInvContent, 0, content, 0, contentLength);
            }
            clearArray(fromInvContent);
        }
        catch (NullPointerException e){
            e.printStackTrace();
        }

    }

    public void setContent(ItemStack[] fromInvContent){
        try{

            if(fromInvContent == null){
                throw new NullPointerException("setContent의 매개변수로 null이 들어왔습니다.");
            }

            int contentLength = content.length;
            int fromInvLength = fromInvContent.length;

            if(contentLength >= fromInvLength){
                System.arraycopy(fromInvContent, 0, content, 0, fromInvLength);
            }
            else{
                System.arraycopy(fromInvContent, 0, content, 0, contentLength);
            }
            clearArray(fromInvContent);
        }
        catch (NullPointerException e){
            e.printStackTrace();
        }
    }

    public void confirm(){
        inventory.setContents(content);
    }

    public <T> void clearArray(T[] array){
        int length = array.length;
        for(int i = 0 ; i < length; i ++){
            array[i] = null;
        }
    }

}
