package org.EternalReturn.System.ERPlayer;

import org.EternalReturn.System.AreaSystem.ERAreaGraph;
import org.EternalReturn.System.ERAnimal.Alpha;
import org.EternalReturn.System.ERAnimal.ERAnimal;
import org.EternalReturn.System.ERPlayer.Gui.Bossbars.RumiaIsland.extRumiaIslandGui.HyperLoopGui;
import org.EternalReturn.System.SystemManager;
import org.EternalReturn.Util.AnimatedJAVAEntity.AJEntityManager;
import org.EternalReturn.Util.Gui.bossbarGui.View.BFrame;
import org.EternalReturn.Util.Physics.Geometry.Cylinder;
import org.EternalReturn.Util.Physics.Geometry.InfStraightLine;
import org.EternalReturn.Util.Physics.Geometry.Collider;
import org.EternalReturn.Util.Physics.MathVector.Vec3d;
import org.bukkit.Bukkit;
import org.bukkit.Location;
import org.bukkit.Material;
import org.bukkit.World;
import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Entity;
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

    private Collider testCollider;

    private ERAnimal testAnimal;

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
            Vec3d rayPos = new Vec3d(loc.getX(),loc.getY() + 1.5d,loc.getZ());
            Vec3d rayDir = new Vec3d(loc.getDirection().getX(), loc.getDirection().getY(), loc.getDirection().getZ());
            InfStraightLine line = new InfStraightLine(rayDir, rayPos);

            Cylinder cylinder = (Cylinder)this.testCollider;

            if(!cylinder.isIntersectWith(line)){
                p.sendMessage("충돌x");
            }
            else{
                p.sendMessage("Intersect! -> ");
                p.sendMessage(cylinder.getPointOfIntersectWith(line).toString());
            }
        }
        else if(args.length == 1 && args[0].equalsIgnoreCase("summonCollider")){

            Location loc = p.getLocation();

            Vec3d pos;

            Collider collider = new Cylinder(
                    new Vec3d(0,1,0),
                    pos = new Vec3d(loc.getX(),loc.getY(),loc.getZ()),
                    1.0,
                    5.0
            );

            p.sendMessage(collider.toString() + "at pos " + pos);

            this.testCollider = collider;

        }
        else if (args.length == 1 && args[0].equalsIgnoreCase("testAJ")) {

            Entity root = testAnimal.getRootEntity();
            p.sendMessage(root + " : " + root.getScoreboardTags());
            testAnimal.remove();

        }
        else if(args.length == 1 && args[0].equalsIgnoreCase("alpha")){

            testAnimal = new Alpha(p.getLocation());
            AJEntityManager.summon(testAnimal,p.getLocation());
            p.sendMessage(testAnimal.toString());

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
