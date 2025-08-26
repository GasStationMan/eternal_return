package org.EternalReturn.System.ERPlayer;

import net.kyori.adventure.bossbar.BossBar;
import net.kyori.adventure.key.Key;
import net.kyori.adventure.text.Component;
import net.kyori.adventure.text.ComponentLike;
import net.kyori.adventure.text.serializer.json.JSONComponentSerializer;
import org.EternalReturn.System.AreaSystem.AreaGraph;
import org.EternalReturn.System.ERPlayer.Gui.Bossbars.RumiaIsland.extRumiaIslandGui.HyperLoopGui;
import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.System.SystemManager;
import org.EternalReturn.Util.AnimatedJAVAEntity.AJEntity;
import org.EternalReturn.Util.Gui.bossbarGui.View.BFrame;
import org.EternalReturn.Util.Physics.Geometry.StraightLine.InfStraightLine;
import org.EternalReturn.Util.Physics.MathVector.Vec3d;
import org.bukkit.Bukkit;
import org.bukkit.Location;
import org.bukkit.Material;
import org.bukkit.World;
import org.bukkit.block.Block;
import org.bukkit.block.data.BlockData;
import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
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
        else if(args.length == 1 && args[0].equalsIgnoreCase("ray")){

            sender.sendMessage("rayTest");

            Location loc = p.getLocation();
            World currentWorld = p.getWorld();
            Vec3d pos = new Vec3d(loc.getX(),loc.getY(),loc.getZ());
            Vec3d dir = new Vec3d(loc.getDirection().getX(), loc.getDirection().getY(), loc.getDirection().getZ());
            InfStraightLine line = new InfStraightLine(dir.getUnit(), pos);

            for(int i = 0 ; i < 10 ; i ++){
                Vec3d point = line.getDot(i);
                Block block = currentWorld.getBlockAt(
                        (int)point.getX(),
                        (int)point.getY(),
                        (int)point.getZ()
                );
                p.sendMessage(
                        "(" +
                        point.getX() + "," +
                        point.getY() + "," +
                        point.getZ() + ") " +
                                block.getBlockData().getMaterial());

            }


        }
        else if(args.length == 1 && args[0].equalsIgnoreCase("test")){

            sender.sendMessage("test03");
            AJEntity ajEntity = new AJEntity("animal_alpha");
            ajEntity.summon(PluginInstance.getServerInstance(), p.getWorld(), p.getLocation());

        }
        else if(args.length == 1 && args[0].equalsIgnoreCase("hyperloop")){
            BFrame hyperloopGui = erPlayer.getHyperloopGui();
            if(hyperloopGui.isOpen()){
                hyperloopGui.close();
            }
            else{
                hyperloopGui.open();
            }
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
        else if(args.length == 1 && args[0].equalsIgnoreCase("scoreboard")){
            ScoreboardManager scbManager = Bukkit.getScoreboardManager();
            Score data = scbManager.getMainScoreboard().getObjective("area").getScore("data");
            data.setScore(32768);
            p.sendMessage(data.getScore() + "");

            


        }

        return false;
    }
}
