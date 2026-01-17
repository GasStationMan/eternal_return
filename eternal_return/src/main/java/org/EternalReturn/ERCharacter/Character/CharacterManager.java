package org.EternalReturn.ERCharacter.Character;

import org.EternalReturn.ERCharacter.ERCharacter;
import org.EternalReturn.System.PluginInstance;
import org.bukkit.configuration.file.FileConfiguration;
import org.bukkit.entity.Player;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class CharacterManager {
    // 모든 캐릭터 종류를 담는 저장소
    private static final Map<String, ERCharacter> characters = new HashMap<>();
    // 플레이어별로 선택한 캐릭터를 담는 저장소
    private static final Map<UUID, ERCharacter> selected = new HashMap<>();


    private static void register(ERCharacter c) {
        characters.put(c.getName().toLowerCase(), c);
    }
    public static java.util.Set<String> getRegisteredNames() {
        return characters.keySet();
    }

    // 캐릭터 선택 및 파일 저장
    public static void setSelected(Player player, String name) {
        ERCharacter c = characters.get(name.toLowerCase());
        if (c != null) {
            selected.put(player.getUniqueId(), c);
            player.sendMessage("§a성공: " + name + " 캐릭터가 선택되었습니다.");
            save(); // 변경될 때마다 파일에 저장
        } else{
            // 이 메시지가 뜬다면 Manager의 명단에 해당 이름이 없는 것입니다.
            player.sendMessage("§c실패: " + name + "이라는 캐릭터를 찾을 수 없습니다.");
        }
    }

    public static ERCharacter getSelected(Player player) {
        return selected.get(player.getUniqueId());
    }

    // [데이터 저장] 선택된 캐릭터 정보를 config.yml에 기록
    public static void save() {
        FileConfiguration config = PluginInstance.getServerInstance().getConfig();
        for (Map.Entry<UUID, ERCharacter> entry : selected.entrySet()) {
            config.set("players." + entry.getKey().toString(), entry.getValue().getName());
        }
        PluginInstance.getServerInstance().saveConfig();
    }

    // [데이터 불러오기] config.yml에서 정보를 읽어 메모리에 올림
    public static void load() {
        FileConfiguration config = PluginInstance.getServerInstance().getConfig();
        if (!config.contains("players")) return;

        for (String key : config.getConfigurationSection("players").getKeys(false)) {
            UUID uuid = UUID.fromString(key);
            String charName = config.getString("players." + key);
            ERCharacter c = characters.get(charName.toLowerCase());
            if (c != null) {
                selected.put(uuid, c);
            }
        }
    }
}