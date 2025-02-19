package org.EternalReturn.System.UpgradeSystem;

import org.EternalReturn.System.ERPlayer.ERPlayer;
import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.Util.Gui.Inventory.GuiController;
import org.EternalReturn.Util.Gui.Inventory.InventoryGui.GuiPos;
import org.EternalReturn.Util.Gui.Inventory.InventoryGui.InventoryGui;
import org.EternalReturn.Util.inventoryUtil.InventoryModifier;
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

import java.util.*;

public class UpgradeGuiController implements GuiController {

    private ERPlayer erPlayer;
    private InventoryGui upgradeGui;
    private BukkitScheduler scheduler;
    private Plugin pluginInstance;
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
        scheduler = null;
        pluginInstance = null;
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

        //갑옷 보여주기
        ItemStack[] armorContent = player.getEquipment().getArmorContents();
        ItemStack[] upgContent = upgGui.getContents();
        for(int i = 0 ; i < 4; i ++){
            ItemStack itemToInsert = armorContent[3-i];
            if(itemToInsert == null){
                itemToInsert = new ItemStack(Material.GRAY_STAINED_GLASS_PANE);
            }
            upgContent[GuiPos.getPos(1,i + 1)] = itemToInsert;
        }

        //무기 보여주기 (인벤토리 전체 선형탐색 후 결과 보여주기)
        boolean findSword = false;
        boolean findBow = false;
        Inventory playerInventory = player.getInventory();
        ItemStack[] inventoryContent = playerInventory.getContents();
        int inventoryLength = inventoryContent.length;
        
        //선형탐색으로 검과 활 찾기
        ItemStack sword = null;
        ItemStack bow = null;
        ItemStack currentItem = null;
        for(int i = 0 ; i < inventoryLength ; i ++){

            currentItem = inventoryContent[i];

            if(!(findSword) && isSword(currentItem)){
                sword = currentItem;
                findSword = true;
            }
            else if(!(findBow) && currentItem != null && currentItem.getType().equals(Material.BOW)){
                bow = currentItem;
                findBow = true;
            }

            if(findSword && findBow){
                break;
            }
        }

        upgContent[GuiPos.getPos(5,2)] = findSword ? sword : new ItemStack(Material.GRAY_STAINED_GLASS_PANE);
        upgContent[GuiPos.getPos(5,3)] = findBow ? bow : new ItemStack(Material.GRAY_STAINED_GLASS_PANE);

        upgGui.setContents(upgContent);

        //배열을 썼으면 내부를 비워 줘야 함.
        InventoryModifier.clear(upgContent);
        InventoryModifier.clear(armorContent);
        InventoryModifier.clear(inventoryContent);

    }

    @Override
    public void whenClose(){
        //upgradeGui 내의 물건을 다시 플레이어 인벤토리로 되돌리는 기능


        Player player = erPlayer.getPlayer();

        Inventory upgGui = upgradeGui.getGui();
        Inventory playerInventory = player.getInventory();

        ItemStack[] guiContent = upgGui.getContents();
        ItemStack[] invContent = playerInventory.getContents();
        ItemStack[] returnToInv = new ItemStack[6];

        returnToInv[0] = guiContent[GuiPos.getPos(2,1)];
        guiContent[GuiPos.getPos(2,1)] = null;
        returnToInv[1] = guiContent[GuiPos.getPos(2,2)];
        guiContent[GuiPos.getPos(2,2)] = null;
        returnToInv[2] = guiContent[GuiPos.getPos(2,3)];
        guiContent[GuiPos.getPos(2,3)] = null;
        returnToInv[2] = guiContent[GuiPos.getPos(2,4)];
        guiContent[GuiPos.getPos(2,4)] = null;
        returnToInv[3] = guiContent[GuiPos.getPos(2,4)];
        guiContent[GuiPos.getPos(6,2)] = null;
        returnToInv[4] = guiContent[GuiPos.getPos(6,2)];
        guiContent[GuiPos.getPos(6,3)] = null;
        returnToInv[5] = guiContent[GuiPos.getPos(6,3)];

        //게으른 계산 (이렇게 해야 안 꼬임.)
        int returnToInvIndex = 0;
        int invIndex = 0;
        while(returnToInvIndex <= 5){

            if(invContent[invIndex] != null){
                invIndex++;
                continue;
            }

            if(returnToInv[returnToInvIndex] == null){
                returnToInvIndex++;
                continue;
            }

            // 만약에 넣어야 할 곳이 null, 선택된 returnToInv[returnToInvIndex]가 null이 아닌 경우
            invContent[invIndex] = returnToInv[returnToInvIndex];
            returnToInv[returnToInvIndex] = null; //가비지 컬렉터가 더 잘 회수하도록 함.
            invIndex++;
            returnToInvIndex ++;

        }

        playerInventory.setContents(invContent);
        upgGui.setContents(guiContent);

        //가비지 컬렉터 회수 때문
        InventoryModifier.clear(returnToInv);
        InventoryModifier.clear(invContent);
        InventoryModifier.clear(guiContent);
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
        GuiPos indexPos = GuiPos.getClickedPos(posIndex);
        int column = indexPos.getX();
        int row = indexPos.getY();
        Inventory gui = upgradeGui.getGui();
        Player player = (Player)e.getWhoClicked();
        boolean upgrade = false;

        //2번 열 제외하고 전부 클릭 취소 처리
        if(!((column == 2 && 1 <= row && row <= 4)
                ||(column == 6 && (row == 2 || row == 3)))){
            e.setCancelled(true);
        }

        if(row == 4 && column == 4){
            upgrade = true;
            player.sendMessage("changed : " + upgrade);
        }

        //인챈트 스토리지 메타데이터 추출 (레벨과 인챈트 종류)
        ArrayList<EnchantmentStorageMeta> enchantList = extractEnchantList(gui, row, column);


        if(upgrade){
            //방어구 수정
            upgradeArmor(gui, player.getEquipment(), enchantList);
            //무기 수정
            upgradeWeapon(gui, player.getInventory(), enchantList);
            closeGui();
        }
        enchantList.clear();

    }

    //vvvvv 코드가 너무 길어져서 따로 뺀 함수들 vvvvv

    //무기를 upgrade 하는 함수
    private void upgradeWeapon(Inventory gui, Inventory playerInventory, ArrayList<EnchantmentStorageMeta> enchantmentStorageMetas){
        ItemStack swordToEnchant = gui.getItem(GuiPos.getPos(1,4));
        ItemStack bowToEnchant = gui.getItem(GuiPos.getPos(1,5));

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
                    gui.clear(GuiPos.getPos(6, 2));
                }
            }
            else if(finder.equals(bowToEnchant)){
                EnchantmentStorageMeta meta = enchantmentStorageMetas.get(5);
                itemListToModify[i] = addEnchantsToItem(meta, finder);
                if(meta != null){
                    gui.clear(GuiPos.getPos(6, 3));
                }
            }
        }

        playerInventory.setContents(itemListToModify);

        for(int i = 0 ; i < length; i ++){
            itemListToModify[i] = null;
        }
    }

    //방어구를 upgrade 하는 함수
    private void upgradeArmor(Inventory gui, EntityEquipment playerEquipment, ArrayList<EnchantmentStorageMeta> enchantmentStorageMetas){

        if(playerEquipment == null){
            return;
        }

        if(playerEquipment.getHelmet() != null){
            EnchantmentStorageMeta meta = enchantmentStorageMetas.getFirst(); //.get(0)
            playerEquipment.setHelmet(addEnchantsToItem(meta,gui.getItem(GuiPos.getPos(7, 0))));
            if(meta != null){
                gui.clear(GuiPos.getPos(2, 1));
            }
        }

        if(playerEquipment.getChestplate() != null){
            EnchantmentStorageMeta meta = enchantmentStorageMetas.get(1);
            playerEquipment.setChestplate(addEnchantsToItem(meta,gui.getItem(GuiPos.getPos(7, 1))));
            if(meta != null){
                gui.clear(GuiPos.getPos(2, 2));
            }
        }

        if(playerEquipment.getLeggings() != null){
            EnchantmentStorageMeta meta = enchantmentStorageMetas.get(2);
            playerEquipment.setLeggings(addEnchantsToItem(meta,gui.getItem(GuiPos.getPos(7, 2))));
            if(meta != null){
                gui.clear(GuiPos.getPos(2, 3));
            }
        }

        if(playerEquipment.getBoots() != null){
            EnchantmentStorageMeta meta = enchantmentStorageMetas.get(3);
            playerEquipment.setBoots(addEnchantsToItem(meta,gui.getItem(GuiPos.getPos(7, 3))));
            if(meta != null){
                gui.clear(GuiPos.getPos(2, 4));
            }
        }
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

    //인벤토리의 특정 칸에 있는 인챈트를 가져와 반환하는 함수
    //아머의 인챈트 가져오기
    private EnchantmentStorageMeta getArmorEnchantStorage(Inventory gui, int row, int column){
        ItemStack enchantBook = null;
        ItemMeta enchantBookMeta = null;
        if((enchantBook = gui.getItem(GuiPos.getPos(row, column))) == null
            || (enchantBookMeta = enchantBook.getItemMeta()) == null
            || enchantBookMeta.hasEnchant(Enchantment.SHARPNESS)){
            return null;
        }
        return (EnchantmentStorageMeta)enchantBookMeta;
    }

    //무기의 인챈트 가져오기
    private EnchantmentStorageMeta getWeaponEnchantStorage(Inventory gui, int row, int column){
        ItemStack enchantBook = null;
        ItemMeta enchantBookMeta = null;
        if((enchantBook = gui.getItem(GuiPos.getPos(row, column))) == null
                || (enchantBookMeta = enchantBook.getItemMeta()) == null
                || enchantBookMeta.hasEnchant(Enchantment.PROTECTION)){
            return null;
        }
        return (EnchantmentStorageMeta)enchantBookMeta;
    }


    //행에 맞게 인챈트를 선별해서 vector으로 반환하는 함수
    private ArrayList<EnchantmentStorageMeta> extractEnchantList(Inventory gui, int row, int column){
        ArrayList<EnchantmentStorageMeta> enchantList = new ArrayList<>(6);

        enchantList.add(getArmorEnchantStorage(gui, 2,1));
        enchantList.add(getArmorEnchantStorage(gui, 2,2));
        enchantList.add(getArmorEnchantStorage(gui, 2,3));
        enchantList.add(getArmorEnchantStorage(gui, 2,4));

        enchantList.add(getArmorEnchantStorage(gui, 6,2));
        enchantList.add(getArmorEnchantStorage(gui, 6,3));

        return enchantList;
    }

    //칼인가? (아직은 안 쓰임)
    private boolean isSword(ItemStack item){
        if(item == null){
            return false;
        }
        Material type = item.getType();
        return type.equals(Material.IRON_SWORD)
                || type.equals(Material.DIAMOND_SWORD)
                || type.equals(Material.NETHERITE_SWORD);
    }

}
