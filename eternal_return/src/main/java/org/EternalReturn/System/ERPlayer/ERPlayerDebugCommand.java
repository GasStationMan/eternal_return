package org.EternalReturn.System.ERPlayer;

import com.google.gson.JsonParser;
import org.EternalReturn.System.AreaSystem.AreaGraph;
import org.EternalReturn.System.ERPlayer.Gui.Bossbars.HyperLoopGui;
import org.EternalReturn.System.SystemManager;
import org.EternalReturn.Util.Gui.bossbarGui.Model.BossbarGuiFrame;
import org.bukkit.Material;
import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;
import org.bukkit.inventory.EnchantingInventory;
import org.bukkit.inventory.EntityEquipment;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.EnchantmentStorageMeta;
import org.bukkit.inventory.meta.ItemMeta;
import org.jetbrains.annotations.NotNull;

import java.util.Set;

public class ERPlayerDebugCommand implements CommandExecutor {

    @Override
    public boolean onCommand(@NotNull CommandSender sender, @NotNull Command command, @NotNull String label, @NotNull String[] args) {


        if(!(sender instanceof Player)){
            sender.sendMessage("Only players can use this command");
        }

        Player p = (Player)sender;
        ERPlayer erPlayer = SystemManager.getInstance().getERPlayer(p);
        Set<String> tagSet = p.getScoreboardTags();
        if(args.length == 1 && args[0].equalsIgnoreCase("showtags")){
            p.sendMessage(tagSet.toString());
            return true;
        }
        else if(args.length == 1 && args[0].equalsIgnoreCase("enchant")){

            EntityEquipment equipment = null;
            ItemStack mainHandItem = null;
            ItemMeta mainHandItemMeta = null;
            if((equipment = p.getEquipment()) == null
                    || (mainHandItem = equipment.getItemInMainHand()).getType().equals(Material.AIR)
                    || (mainHandItemMeta = mainHandItem.getItemMeta()) == null){
                return false;
            }

            if(mainHandItem.getType().equals(Material.ENCHANTED_BOOK)){

                EnchantmentStorageMeta meta = (EnchantmentStorageMeta)mainHandItemMeta;

                p.sendMessage(meta.getStoredEnchants().toString());
            }
            else{
                p.sendMessage(mainHandItemMeta.getEnchants().toString());
            }


        }
        else if(args.length == 2 && args[0].equalsIgnoreCase("removetag")){
            tagSet.remove(args[1]);
            p.sendMessage(tagSet.toString());
            return true;
        }

        else if(args.length == 2 && args[0].equalsIgnoreCase("setyellow")){
            try{
                AreaGraph areaGraph = SystemManager.getAreaGraph();
                areaGraph.setYellowArea(Integer.parseInt(args[1]));
                HyperLoopGui hyperLoopGui = (HyperLoopGui)erPlayer.getHyperloopGui();

                hyperLoopGui.updateAreaState();


            }
            catch (NumberFormatException e){
                e.printStackTrace();
                p.sendMessage("숫자를 기입하십시오.");
            }

        }

        else if(args.length == 4 && args[0].equalsIgnoreCase("vector")){
            erPlayer.getMotionManager().updatePlayerMotion(
                    Double.parseDouble(args[1]),
                    Double.parseDouble(args[2]),
                    Double.parseDouble(args[3])
            );
        }

        return false;
    }
}
