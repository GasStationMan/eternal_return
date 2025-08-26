package org.EternalReturn.Util.AnimatedJAVAEntity;

import org.EternalReturn.System.PluginInstance;
import org.bukkit.entity.ItemDisplay;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.entity.EntitySpawnEvent;
import org.bukkit.plugin.Plugin;

public class AJEntityListener implements Listener {
    private final Plugin plugin;

    @EventHandler
    public void ajEntitySummoned(EntitySpawnEvent entitySpawnEvent){


        //PluginInstance.dfLogUTF8("AJEntitySummoned");
    }

    public AJEntityListener(Plugin plugin){
        this.plugin = plugin;
    }

    public Plugin getPlugin() {
        return plugin;
    }
}
