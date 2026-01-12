package org.datapakcDebugger;

import org.bukkit.plugin.java.JavaPlugin;

import javax.swing.*;

public final class Main extends JavaPlugin {

    private JFrame frame;

    @Override
    public void onEnable() {

        this.frame = new JFrame("test");
        this.frame.setVisible(true);



    }

    @Override
    public void onDisable() {
        // Plugin shutdown logic
        this.frame.dispose();


    }
}
