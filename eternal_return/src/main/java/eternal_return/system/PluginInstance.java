package eternal_return.system;


import java.io.UnsupportedEncodingException;

import eternal_return.system.ERPlayer.ERPlayerDebugCommand;
import eternal_return.system.ERPlayer.ERPlayerScript;
import eternal_return.system.ScriptUtill.ScriptUpdateThread;
import eternal_return.system.bossbarHud.BossbarCommand;
import eternal_return.system.guiGenerator.GuiCommand;
import eternal_return.system.guiGenerator.GuiListener;
import listeners.PlayerJoinListener;
import net.kyori.adventure.platform.bukkit.BukkitAudiences;
import org.bukkit.Bukkit;
import org.bukkit.plugin.Plugin;
import org.bukkit.plugin.java.JavaPlugin;
import org.checkerframework.checker.nullness.qual.NonNull;

public final class PluginInstance extends JavaPlugin{

    private static Plugin serverInstance;
    private SystemManager systemManager;
    private static BukkitAudiences adventure;

    //BukkitAudience얻어오는 함수
    public static @NonNull BukkitAudiences adventure(){
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

        //시스템매니저 객체 생성
        systemManager = SystemManager.getInstance();
        adventure = BukkitAudiences.create(this);


        //GuiOpen 리스너 등록. 이런 식으로 해야 함...
        getServer().getPluginManager().registerEvents(new PlayerJoinListener(systemManager), this);
        getServer().getPluginManager().registerEvents(new GuiListener(), this);

        loadCommands();

        //스크립트 업데이트
        Bukkit.getScheduler().runTaskTimer(this, new ScriptUpdateThread(new ERPlayerScript()),0,1);

        //로드 종료 시 로그
        dfLogUTF8("이터널 리턴 플러그인 구동 준비 완료!");

    }

    //커맨드 로드용. 너무 길어질 것 같아서 미리 뺐음
    private void loadCommands() {
        getCommand("er").setExecutor(new ERPlayerDebugCommand());
        getCommand("show").setExecutor(new GuiCommand());
        getCommand("hyperloop").setExecutor(new BossbarCommand());
    }

    @Override
    public void onDisable() {
        SystemManager.getInstance().free();
        if(adventure != null){
            adventure.close();
            adventure = null;
        }
    }

    public static Plugin getServerInstance(){
        return serverInstance;
    }

}
