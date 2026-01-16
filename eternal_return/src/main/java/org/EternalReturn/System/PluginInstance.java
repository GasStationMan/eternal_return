package org.EternalReturn.System;


import java.io.UnsupportedEncodingException;

import org.EternalReturn.ERPlayer.ERPlayerDebugCommand;
import org.EternalReturn.ERPlayer.ERPlayerListener;
import org.EternalReturn.ERPlayer.Gui.Inventory.InventoryGuiListener;
import net.kyori.adventure.platform.bukkit.BukkitAudiences;
import org.EternalReturn.System.ERAnimalSystem.ERAnimalManager;
import org.EternalReturn.Util.AJEntity.AJEntityManager;
import org.bukkit.Bukkit;
import org.bukkit.entity.Player;
import org.bukkit.plugin.PluginManager;
import org.bukkit.plugin.java.JavaPlugin;
import org.jetbrains.annotations.NotNull;

public final class PluginInstance extends JavaPlugin{

    private static PluginInstance serverInstance;
    private static AJEntityManager ajEntityManager;
    private static SystemManager systemManager;
    private static BukkitAudiences adventure;
    private static ERAnimalManager erAnimalManager;

    private static EREngine erEngine;

    //BukkitAudience얻어오는 함수
    public static @NotNull BukkitAudiences adventure(){
        if(adventure == null){
            throw new IllegalStateException("Tried to access Adventure when the plugin was disabled!");
        }
        return adventure;
    }


    //UTF-8로 인코딩 후 로거에게 전달하는 함수.
    public static void dfLogUTF8(String str){
        try {
            serverInstance.getLogger().info(new String(str.getBytes(),"UTF-8"));
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void onEnable() {
        serverInstance = this;
        //로드 시작 시 로그
        dfLogUTF8("이터널 리턴 플러그인 구동 준비...");

        //Animated JAVA Entity initialization
        ajEntityManager = AJEntityManager.registerAJEntityManager(this);
        erAnimalManager = ERAnimalManager.registerERAnimalManager(ajEntityManager);

        //시스템매니저 객체 생성
        systemManager = SystemManager.getInstance();
        adventure = BukkitAudiences.create(this);


        //GuiOpen 리스너 등록. 이런 식으로 해야 함...
        PluginManager pm = getServer().getPluginManager();
        pm.registerEvents(new ERPlayerListener(), this);
        pm.registerEvents(new InventoryGuiListener(), this);
        //pm.registerEvents(new BSwingListener(), this);
        pm.registerEvents(ajEntityManager, this);
        loadCommands();

        //온라인인 플레이어들 다시 해시맵에 등록
        for(Player onlinePlayer : Bukkit.getOnlinePlayers()){
            onlinePlayer.sendMessage("해시맵에 다시 등록");
            systemManager.addPlayer(onlinePlayer);
        }


        Bukkit.getScheduler().runTaskTimer(this, erEngine = new EREngine(),0,1);

        //로드 종료 시 로그
        dfLogUTF8("이터널 리턴 플러그인 구동 준비 완료!");

    }

    //커맨드 로드용. 너무 길어질 것 같아서 미리 뺐음
    private void loadCommands() {
        getCommand("er").setExecutor(new ERPlayerDebugCommand());
    }

    @Override
    public void onDisable() {
        systemManager.free();
        ajEntityManager.free();
        if(adventure != null){
            adventure.close();
        }
    }

    public static PluginInstance getServerInstance(){
        return serverInstance;
    }

    public static SystemManager getSystemManager(){
        return systemManager;
    }

    public static EREngine getEREngine() {
        return erEngine;
    }

}
