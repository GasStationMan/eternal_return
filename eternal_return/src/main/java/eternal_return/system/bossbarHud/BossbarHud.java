package eternal_return.system.bossbarHud;

import eternal_return.system.PluginInstance;
import net.kyori.adventure.audience.Audience;
import net.kyori.adventure.bossbar.BossBar;
import net.kyori.adventure.key.Key;
import org.bukkit.entity.Player;

import net.kyori.adventure.text.Component;

import java.util.ArrayList;
import java.util.List;

public class BossbarHud {

    private BossBar bufferShower;
    private Audience audience;
    private ArrayList<Component> components;
    private boolean isOpen;

    private static String space = "space.";


    public BossbarHud(Player p){

        isOpen = false;

        bossbarHudSetup();

        Component buffer = Component.text("").children((List<Component>) components);

        bufferShower = BossBar.bossBar(buffer,0, BossBar.Color.BLUE, BossBar.Overlay.PROGRESS);

        audience = PluginInstance.adventure().player(p);


    }
    
    //파일 입출력으로 구현 필요
    public void bossbarHudSetup(){
        components = new ArrayList<>(64);
        components.add(Component.text("\u4000").font(Key.key("map/hyper_loop")));
        components.add(Component.translatable("space.-500").font(Key.key("default")));
        components.add(Component.text("\u4182").font(Key.key("map/beach")));
        components.add(Component.translatable("space.-79").font(Key.key("default")));
        components.add(Component.text("\u4143").font(Key.key("map/hotel")));
        components.add(Component.translatable("space.-71").font(Key.key("default")));
        components.add(Component.text("\u4100").font(Key.key("map/archery_range")));
        components.add(Component.translatable("space.-51").font(Key.key("default")));
        components.add(Component.text("\u4122").font(Key.key("map/school")));
        components.add(Component.translatable("space.-54").font(Key.key("default")));
        components.add(Component.text("\u4157").font(Key.key("map/lab")));
        components.add(Component.translatable("space.-92").font(Key.key("default")));
        components.add(Component.text("\u4080").font(Key.key("map/gas_station")));
        components.add(Component.translatable("space.-45").font(Key.key("default")));
        components.add(Component.text("\u4069").font(Key.key("map/alley")));
        components.add(Component.translatable("space.-81").font(Key.key("default")));
        components.add(Component.text("\u4121").font(Key.key("map/fire")));
        components.add(Component.translatable("space.-54").font(Key.key("default")));
        components.add(Component.text("\u4103").font(Key.key("map/police")));
        components.add(Component.translatable("space.-40").font(Key.key("default")));
        components.add(Component.text("\u4106").font(Key.key("map/temple")));
        components.add(Component.translatable("space.-169").font(Key.key("default")));
        components.add(Component.text("\u4177").font(Key.key("map/forest")));
        components.add(Component.translatable("space.-25").font(Key.key("default")));
        components.add(Component.text("\u4187").font(Key.key("map/cemetery")));
        components.add(Component.translatable("space.-82").font(Key.key("default")));
        components.add(Component.text("\u4153").font(Key.key("map/pond")));
        components.add(Component.translatable("space.-47").font(Key.key("default")));
        components.add(Component.text("\u4144").font(Key.key("map/stream")));
        components.add(Component.translatable("space.-66").font(Key.key("default")));
        components.add(Component.text("\u4174").font(Key.key("map/hospital")));
        components.add(Component.translatable("space.-93").font(Key.key("default")));
        components.add(Component.text("\u4221").font(Key.key("map/factory")));
        components.add(Component.translatable("space.-132").font(Key.key("default")));
        components.add(Component.text("\u4214").font(Key.key("map/chapel")));
        components.add(Component.translatable("space.-82").font(Key.key("default")));
        components.add(Component.text("\u4248").font(Key.key("map/port")));
        components.add(Component.translatable("space.-125").font(Key.key("default")));
        components.add(Component.text("\u4211").font(Key.key("map/village")));
        components.add(Component.translatable("space.-58").font(Key.key("default")));
        components.add(Component.text("\u4236").font(Key.key("map/storage")));
        components.add(Component.translatable("space.108").font(Key.key("default")));
        components.add(Component.translatable("space.-230").font(Key.key("default")));
        components.add(Component.translatable("space.-270").font(Key.key("default")));
        components.add(Component.text("\u1100").font(Key.key("map/icon")));
        components.add(Component.translatable("space.270").font(Key.key("default")));
        components.add(Component.text("\u4001").font(Key.key("map/hyper_loop")));
        components.add(Component.translatable("space.250").font(Key.key("default")));
        components.add(Component.translatable("space.110").font(Key.key("default")));
    }

    public void moveCursorPoint(int x, int y){

        y = (y + 150);
        x = (x + 130);

        int mouseY = ('\u1000');
        mouseY += 256 * (y/100);
        y %= 100;
        mouseY += 16 * (y/10);
        y %= 10;
        mouseY += y;

        components.set(43,Component.translatable(space + (x)).font(Key.key("default")));
        components.set(44,Component.text((char)mouseY).font(Key.key("map/icon")));
        components.set(45,Component.translatable(space + (-x)).font(Key.key("default")));
        bufferShower.name(Component.text("").children(components));

    }

    public void open() {
        isOpen = true;
        bufferShower.addViewer(audience);
    }

    public void close(){
        isOpen = false;
        bufferShower.removeViewer(audience);
    }

    public boolean isOpen() {
        return isOpen;
    }
}
