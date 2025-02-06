package org.EternalReturn.System.UpgradeSystem;

import org.EternalReturn.System.ERPlayer.ERPlayer;
import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.Util.Gui.GuiController;
import org.EternalReturn.Util.Gui.InventoryGui.GuiPos;
import org.EternalReturn.Util.Gui.InventoryGui.InventoryGui;
import org.EternalReturn.Util.itemUtill.ItemMover;
import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.enchantments.Enchantment;
import org.bukkit.entity.Player;
import org.bukkit.event.inventory.InventoryClickEvent;
import org.bukkit.inventory.EntityEquipment;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.EnchantmentStorageMeta;
import org.bukkit.inventory.meta.ItemMeta;
import org.bukkit.plugin.Plugin;
import org.bukkit.scheduler.BukkitScheduler;
import org.jetbrains.annotations.NotNull;

import java.util.*;

public class UpgradeGuiController implements GuiController {

    private ERPlayer erPlayer;
    private InventoryGui upgradeGui;
    private final BukkitScheduler scheduler;
    private final Plugin pluginInstance;
    private boolean isOpen;

    public UpgradeGuiController(InventoryGui gui){
        upgradeGui = gui;
        erPlayer = upgradeGui.getERPlayer();
        scheduler = Bukkit.getScheduler();
        pluginInstance = PluginInstance.getServerInstance();
    }

    public void free(){
        erPlayer = null;
        upgradeGui = null;
    }

    @Override
    public void openGui(){
        isOpen = true;
        whenOpen();
        Player p = erPlayer.getPlayer();
        scheduler.runTaskLater(pluginInstance, ()->{
            p.openInventory(upgradeGui.getGui());
        }, 0);
    }

    @Override
    public void closeGui() {
        whenClose();
        isOpen = false;
        Player p = erPlayer.getPlayer();
        p.closeInventory();

    }

    @Override
    public void whenOpen(){

        isOpen = true;
        Player player = erPlayer.getPlayer();
        Inventory upgGui = upgradeGui.getGui();

        EntityEquipment equipments = player.getEquipment();
        if(equipments == null){
            return;
        }
        ItemStack[] armorContent = player.getEquipment().getArmorContents();
        //갑옷 보여주기

        int i;
        for(i = 0 ; i < 4; i ++){
            ItemStack itemToInsert = armorContent[3-i];
            if(itemToInsert == null){
                itemToInsert = new ItemStack(Material.GRAY_STAINED_GLASS_PANE);
            }
            upgGui.setItem(GuiPos.getPositionOnInventory(1,i),itemToInsert);
            upgGui.setItem(GuiPos.getPositionOnInventory(7,i),itemToInsert);
        }

        //무기 보여주기 (인벤토리 전체 선형탐색 후 결과 보여주기)
        Inventory playerInventory = player.getInventory();
        boolean findSword = false;
        boolean findBow = false;
        int length = playerInventory.getSize();
        for(i = 0 ; i < length; i ++){
            ItemStack currentItem = playerInventory.getItem(i);

            if(findSword && findBow){
                break;
            }

            if(currentItem == null){
                continue;
            }

            Material itemType = currentItem.getType();
            //검인 경우
            if(itemType.equals(Material.IRON_SWORD)
                    ||itemType.equals(Material.DIAMOND_SWORD)
                    ||itemType.equals(Material.NETHERITE_SWORD)){

                upgGui.setItem(GuiPos.getPositionOnInventory(1,4),currentItem);
                upgGui.setItem(GuiPos.getPositionOnInventory(7,4),currentItem);
                findSword = true;
            }
            //활인 경우
            else if(itemType.equals(Material.BOW) || itemType.equals(Material.FISHING_ROD)){
                upgGui.setItem(GuiPos.getPositionOnInventory(1,5),currentItem);
                upgGui.setItem(GuiPos.getPositionOnInventory(7,5),currentItem);
                findBow = true;
            }
        }

        if(!findSword){
            upgGui.setItem(GuiPos.getPositionOnInventory(1,4),new ItemStack(Material.GRAY_STAINED_GLASS_PANE));
            upgGui.setItem(GuiPos.getPositionOnInventory(7,4),new ItemStack(Material.GRAY_STAINED_GLASS_PANE));
        }

        if(!findBow){
            upgGui.setItem(GuiPos.getPositionOnInventory(1,5),new ItemStack(Material.GRAY_STAINED_GLASS_PANE));
            upgGui.setItem(GuiPos.getPositionOnInventory(7,5),new ItemStack(Material.GRAY_STAINED_GLASS_PANE));
        }

    }

    @Override
    public void whenClose(){
        //upgradeGui 내의 물건을 다시 플레이어 인벤토리로 되돌리는 기능
        int invIndex = 0;
        int guiIndex = 0;

        Player player = erPlayer.getPlayer();

        Inventory upgGui = upgradeGui.getGui();
        Inventory playerInventory = player.getInventory();

        ItemStack[] guiContent = upgGui.getContents();
        ItemStack[] invContent = playerInventory.getContents();

        Stack<ItemMover> stack = new Stack<>();
        int invContentLength = invContent.length;
        int guiContentLength = guiContent.length;
        while(guiIndex < 6 && invIndex < invContentLength){
            if(invContent[invIndex] != null){
                invIndex++;
                continue;
            }

            int guiPosition = GuiPos.getPositionOnInventory(2, guiIndex);
            if(guiContent[guiPosition] == null){
                guiIndex++;
                continue;
            }

            invContent[invIndex] = guiContent[guiPosition];
            guiContent[guiPosition] = null;
            invIndex++;
            guiIndex++;
        }

        //게으른 계산 (이렇게 해야 안 꼬임.)
        scheduler.runTaskLater(pluginInstance,()->{
            playerInventory.setContents(invContent);
            upgGui.setContents(guiContent);

            for(int i = 0 ; i < invContentLength; i ++){
                invContent[i] = null;
            }

            for(int i = 0 ; i < guiContentLength; i ++){
                guiContent[i] = null;
            }
        },0);
        isOpen = false;
    }

    @Override
    public boolean isOpen() {
        return isOpen;
    }

    @Override
    public Inventory getGui() {
        return upgradeGui.getGui();
    }

    @Override
    public void doEvent(GuiPos pos, InventoryClickEvent e) {

        int posIndex = e.getSlot();
        GuiPos indexPos = GuiPos.getClickedPosition(posIndex);
        int column = indexPos.getX();
        int row = indexPos.getY();
        Inventory gui = upgradeGui.getGui();
        Player player = (Player)e.getWhoClicked();
        boolean upgrade = false;

        //2번 열 제외하고 전부 클릭 취소 처리
        if(column != 2){
            e.setCancelled(true);
        }

        if(row == 4 && column == 4){
            upgrade = true;
            player.sendMessage("changed : " + upgrade);
        }

        //인챈트 스토리지 메타데이터 추출 (레벨과 인챈트 종류)
        Vector<EnchantmentStorageMeta> enchantList = extractEnchantList(gui, e.getCursor(), row, column);


        if(upgrade){
            //방어구 수정
            upgradeArmor(gui, player.getEquipment(), enchantList);
            //무기 수정
            upgradeWeapon(gui, player.getInventory(), enchantList);
            closeGui();
        }else{
            showEnchantment(gui, enchantList);
        }
        enchantList.clear();
    }

    //vvvvv 코드가 너무 길어져서 따로 뺀 함수들 vvvvv
    //인챈트 보여주기 함수
    private void showEnchantment(Inventory gui, Vector<EnchantmentStorageMeta> enchantmentStorageMetas){

        ItemStack[] guiContent = gui.getContents();

        for(int i = 0 ; i < 6; i ++){
            int objectIndex = GuiPos.getPositionOnInventory(7,i);
            ItemStack objectItem = guiContent[objectIndex];
            EnchantmentStorageMeta enchantStorageMeta = enchantmentStorageMetas.get(i);

            if(enchantStorageMeta == null && objectItem != null){
                //해당하는 행에 인챈트 북이 있는 경우 인챈트 부여
                int subjectIndex = GuiPos.getPositionOnInventory(1,i);

                //인벤토리 내의 아이템도 메인 틱에 맞춰야 정확하게 동작함.
                guiContent[objectIndex] = guiContent[subjectIndex];
            }
            else{
                guiContent[objectIndex] = addEnchantsToItem(enchantStorageMeta,objectItem);
            }
        }

        scheduler.runTaskLater(pluginInstance, ()->{
            gui.setContents(guiContent);
            int guiContentLength = guiContent.length;
            for(int i = 0 ; i < guiContentLength; i ++){
                guiContent[i] = null;
            }
        }, 0);

    }

    //무기를 upgrade 하는 함수
    private void upgradeWeapon(Inventory gui, Inventory playerInventory, Vector<EnchantmentStorageMeta> enchantmentStorageMetas){
        ItemStack swordToEnchant = gui.getItem(GuiPos.getPositionOnInventory(1,4));
        ItemStack bowToEnchant = gui.getItem(GuiPos.getPositionOnInventory(1,5));

        ItemStack[] itemListToModify = playerInventory.getContents();

        int length = itemListToModify.length;
        ItemStack finder = null;
        for(int i = 0 ; i < length ; i ++){
            finder = itemListToModify[i];
            if(finder == null){
                continue;
            }
            if(finder.equals(swordToEnchant)){
                EnchantmentStorageMeta meta = enchantmentStorageMetas.get(4);
                itemListToModify[i] = addEnchantsToItem(meta, finder);
                if(meta != null){
                    gui.clear(GuiPos.getPositionOnInventory(2, 4));
                }
            }
            else if(finder.equals(bowToEnchant)){
                EnchantmentStorageMeta meta = enchantmentStorageMetas.get(5);
                itemListToModify[i] = addEnchantsToItem(meta, finder);
                if(meta != null){
                    gui.clear(GuiPos.getPositionOnInventory(2, 5));
                }
            }
        }

        playerInventory.setContents(itemListToModify);

        for(int i = 0 ; i < length; i ++){
            itemListToModify[i] = null;
        }
    }

    //방어구를 upgrade 하는 함수
    private void upgradeArmor(Inventory gui, EntityEquipment playerEquipment, Vector<EnchantmentStorageMeta> enchantmentStorageMetas){

        if(playerEquipment == null){
            return;
        }

        if(playerEquipment.getHelmet() != null){
            EnchantmentStorageMeta meta = enchantmentStorageMetas.getFirst(); //.get(0)
            playerEquipment.setHelmet(addEnchantsToItem(meta,gui.getItem(GuiPos.getPositionOnInventory(7, 0))));
            if(meta != null){
                gui.clear(GuiPos.getPositionOnInventory(2, 0));
            }
        }

        if(playerEquipment.getChestplate() != null){
            EnchantmentStorageMeta meta = enchantmentStorageMetas.get(1);
            playerEquipment.setChestplate(addEnchantsToItem(meta,gui.getItem(GuiPos.getPositionOnInventory(7, 1))));
            if(meta != null){
                gui.clear(GuiPos.getPositionOnInventory(2, 1));
            }
        }

        if(playerEquipment.getLeggings() != null){
            EnchantmentStorageMeta meta = enchantmentStorageMetas.get(2);
            playerEquipment.setLeggings(addEnchantsToItem(meta,gui.getItem(GuiPos.getPositionOnInventory(7, 2))));
            if(meta != null){
                gui.clear(GuiPos.getPositionOnInventory(2, 2));
            }
        }

        if(playerEquipment.getBoots() != null){
            EnchantmentStorageMeta meta = enchantmentStorageMetas.get(3);
            playerEquipment.setBoots(addEnchantsToItem(meta,gui.getItem(GuiPos.getPositionOnInventory(7, 3))));
            if(meta != null){
                gui.clear(GuiPos.getPositionOnInventory(2, 3));
            }
        }
    }
    
    //인챈트를 제거하는 함수
    private void removeEnchant(@NotNull ItemStack item){
        ItemMeta meta = null;
        if((meta = item.getItemMeta())== null){
            return;
        }
        meta.removeEnchantments();
        item.setItemMeta(meta);
    }

    //아이템을 인챈트하는 함수
    private ItemStack addEnchantsToItem(EnchantmentStorageMeta enchantmentStorageMeta, ItemStack itemToEnchant){
        ItemMeta toBeEnchantedItemMeta = null;
        if(enchantmentStorageMeta == null
                || itemToEnchant == null
                || (toBeEnchantedItemMeta = itemToEnchant.getItemMeta()) == null){
            return itemToEnchant;
        }

        Set<Enchantment> enchantments = enchantmentStorageMeta.getStoredEnchants().keySet();

        for(Enchantment enchantment : enchantments){
            // 항상 인챈트 북 내의 인챈트 레벨을 가져올 때나, 인챈트를 가져올 때는 항상
            //  getStoredEnchantLevel()
            //  getStoredEnchants()
            // 을 이용하자. 컴파일로도 못 잡아낸다 ㄷㄷ
            int level = enchantmentStorageMeta.getStoredEnchantLevel(enchantment);
            toBeEnchantedItemMeta.addEnchant(enchantment, level,false);
            itemToEnchant.setItemMeta(toBeEnchantedItemMeta);
        }

        return itemToEnchant;
    }
    
    //행에 맞게 인챈트를 선별해서 vector으로 반환하는 함수
    private Vector<EnchantmentStorageMeta> extractEnchantList(Inventory gui, ItemStack itemOnCursor, int row, int column){
        Vector<EnchantmentStorageMeta> enchantList = new Vector<>(6);
        for(int i = 0 ; i < 6; i ++){
            ItemStack enchantBook = null;
            enchantBook = (column == 2 && row == i) ? itemOnCursor : gui.getItem(GuiPos.getPositionOnInventory(2, i));

            ItemMeta enchantBookMeta = null;
            if(enchantBook == null || (enchantBookMeta = enchantBook.getItemMeta()) == null){
                enchantList.add(null);
                continue;
            }
            EnchantmentStorageMeta enchantMeta = (EnchantmentStorageMeta)enchantBookMeta;
            if(i <= 3 && enchantMeta.hasStoredEnchant(Enchantment.PROTECTION)){
                enchantList.add(enchantMeta);
            }
            else if(i > 3 && enchantMeta.hasStoredEnchant(Enchantment.SHARPNESS)){
                enchantList.add(enchantMeta);
            }
            else{
                enchantList.add(null);
            }
        }
        return enchantList;
    }

    //칼인가? (아직은 안 쓰임)
    private boolean isSword(ItemStack item){
        Material type = item.getType();
        return type.equals(Material.IRON_SWORD)
                || type.equals(Material.DIAMOND_SWORD)
                || type.equals(Material.NETHERITE_SWORD);
    }

}
