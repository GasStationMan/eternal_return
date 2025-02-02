package org.EternalReturn.Util.InventoryGui;

import org.EternalReturn.System.ERPlayer.ERPlayer;
import org.EternalReturn.System.SystemManager;
import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;
import org.jetbrains.annotations.NotNull;

public class GuiCommand implements CommandExecutor {

    @Override
    public boolean onCommand(@NotNull CommandSender sender, @NotNull Command command, @NotNull String label, @NotNull String[] args) {

        Player p;
        if(!(sender instanceof Player)){
            sender.sendMessage("Only players can use this command");
        }

        p = (Player)sender;
        ERPlayer erPlayer = SystemManager.getInstance().getERPlayer(p);
        erPlayer.updateUpgradeGuiWhenOpen();
        p.openInventory(erPlayer.getInventory());
        return true;
    }
}
