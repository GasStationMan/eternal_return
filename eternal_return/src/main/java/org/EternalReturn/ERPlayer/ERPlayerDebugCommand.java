package org.EternalReturn.ERPlayer;

import org.EternalReturn.ERAnimal.*;
import org.EternalReturn.ERCharacter.Character.hyunwoo.Character_Hyunwoo;
import org.EternalReturn.ERCharacter.Character.jackie.Character_Jackie;
import org.EternalReturn.ERCharacter.ERCharacter;
import org.EternalReturn.EREntity.ERDummy;
import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.System.SystemManager;
import org.EternalReturn.Util.AJEntity.AJEntityManager;
import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Entity;
import org.bukkit.entity.EntityType;
import org.bukkit.entity.Player;
import org.bukkit.inventory.EntityEquipment;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.EnchantmentStorageMeta;
import org.bukkit.inventory.meta.ItemMeta;
import org.bukkit.scoreboard.Score;
import org.bukkit.scoreboard.ScoreboardManager;
import org.jetbrains.annotations.NotNull;

import java.util.Set;

public class ERPlayerDebugCommand implements CommandExecutor {
    private ERAJEntity testAnimal;

    @Override
    public boolean onCommand(@NotNull CommandSender sender, @NotNull Command command, @NotNull String label, @NotNull String[] args) {


        if(!(sender instanceof Player)){
            sender.sendMessage("Only players can use this command");
        }

        Player p = (Player)sender;
        ERPlayer erPlayer = SystemManager.getERPlayer(p);
        Set<String> tagSet = p.getScoreboardTags();
        if(args.length == 1 && args[0].equalsIgnoreCase("showtags")){
            p.sendMessage(tagSet.toString());
            return true;
        }
        else if (args.length == 1 && args[0].equalsIgnoreCase("flushAJ")) {

            AJEntityManager.flushAllEntities();

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
        else if(args.length == 4 && args[0].equalsIgnoreCase("vector")){
            erPlayer.getMotionManager().updateEntityMotion(
                    Double.parseDouble(args[1]),
                    Double.parseDouble(args[2]),
                    Double.parseDouble(args[3])
            );
        }
        else if(args.length == 1 && args[0].equalsIgnoreCase("scoreboard")){
            ScoreboardManager scbManager = Bukkit.getScoreboardManager();
            Score data = scbManager.getMainScoreboard().getObjective("area").getScore("data");
            data.setScore(32768);
            p.sendMessage(data.getScore() + "");
        }

        else if(args.length == 1 && args[0].equalsIgnoreCase("ch")){

            ERCharacter character = new Character_Jackie(erPlayer);

            erPlayer.setCharacter(character);
            PluginInstance.getEREngine().registerBukkitActor(p, character);
            erPlayer.sendMessage(erPlayer.getCharacter().getName());
        }

        else if(args.length == 1 && args[0].equalsIgnoreCase("dummy")){
            Entity dummy = p.getWorld().spawnEntity(p.getLocation(), EntityType.VILLAGER);
            PluginInstance.getEREngine().registerBukkitActor(dummy, new ERDummy(dummy));
            erPlayer.sendMessage("Dummy set");
        }

        return false;
    }
}
