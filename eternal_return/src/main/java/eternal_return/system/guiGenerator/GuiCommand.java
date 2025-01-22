package eternal_return.system.guiGenerator;

import eternal_return.system.ERPlayer.ERPlayer;
import eternal_return.system.SystemManager;
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
