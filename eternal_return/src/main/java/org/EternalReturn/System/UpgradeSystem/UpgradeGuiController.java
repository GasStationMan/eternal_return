package org.EternalReturn.System.UpgradeSystem;

import org.EternalReturn.System.ERPlayer.ERPlayer;
import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.System.SystemManager;
import org.EternalReturn.Util.Gui.Inventory.GuiController;
import org.EternalReturn.Util.Gui.Inventory.InventoryGui.GuiPos;
import org.EternalReturn.Util.Gui.Inventory.InventoryGui.InventoryGui;
import org.EternalReturn.Util.inventoryUtil.InventoryModifier;
import org.EternalReturn.Util.itemUtill.Enchanter;
import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.Sound;
import org.bukkit.entity.Player;
import org.bukkit.event.inventory.InventoryClickEvent;
import org.bukkit.inventory.EntityEquipment;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.ItemStack;
import org.bukkit.plugin.Plugin;
import org.bukkit.scheduler.BukkitScheduler;
import org.jetbrains.annotations.NotNull;

import java.util.Objects;


public class UpgradeGuiController implements GuiController {

    private ERPlayer erPlayer;
    private InventoryGui upgradeGui;
    private BukkitScheduler scheduler;
    private Plugin pluginInstance;
    private boolean isOpen;
    private Enchanter enchanter;

    public UpgradeGuiController(InventoryGui gui){
        upgradeGui = gui;
        erPlayer = upgradeGui.getERPlayer();
        scheduler = Bukkit.getScheduler();
        pluginInstance = PluginInstance.getServerInstance();
        enchanter = SystemManager.getEnchanter();
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

    public void closeGui(String str) {
        whenClose();
        isOpen = false;
        Player p = erPlayer.getPlayer();
        p.closeInventory();
        p.sendMessage(str);
    }

    public void closeGui(Runnable playSound) {
        whenClose();
        isOpen = false;
        Player p = erPlayer.getPlayer();
        p.closeInventory();
        playSound.run();
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
        ItemStack[] returnToInv = new ItemStack[6]; //인벤토리로 돌아갈 6개의 아이템

        returnToInv[0] = guiContent[GuiPos.getPos(2,1)];
        guiContent[GuiPos.getPos(2,1)] = null;

        returnToInv[1] = guiContent[GuiPos.getPos(2,2)];
        guiContent[GuiPos.getPos(2,2)] = null;

        returnToInv[2] = guiContent[GuiPos.getPos(2,3)];
        guiContent[GuiPos.getPos(2,3)] = null;

        returnToInv[3] = guiContent[GuiPos.getPos(2,4)];
        guiContent[GuiPos.getPos(2,4)] = null;

        returnToInv[4] = guiContent[GuiPos.getPos(6,2)];
        guiContent[GuiPos.getPos(6,2)] = null;

        returnToInv[5] = guiContent[GuiPos.getPos(6,3)];
        guiContent[GuiPos.getPos(6,3)] = null;

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
        Player player = (Player)e.getWhoClicked();

        Inventory gui = upgradeGui.getGui();
        Inventory inventory = player.getInventory();

        int column = indexPos.getX();
        int row = indexPos.getY();

        //상호작용 불가능 칸 제외하고 모두 이벤트 취소
        if(!(isInteractionSlots(indexPos))){
            e.setCancelled(true);
        }


        if(row == 5 && column == 4){
            EntityEquipment equipment = player.getEquipment();
            if(equipment == null){
                closeGui("플레이어가 갑옷을 착용하지 않았습니다.");
                return;
            }

            ItemStack[] inventoryContent = inventory.getContents();
            ItemStack[] guiContent = gui.getContents();
            ItemStack[] armorContent = equipment.getArmorContents(); //[boots, leggings, chest_plate, helmet] 순서

            int[] weaponIndex = getWeaponIndex(
                    inventoryContent,
                    guiContent[GuiPos.getPos(5,2)],
                    guiContent[GuiPos.getPos(5,3)]);

            boolean enchantSuccess = enchant(armorContent, 0, guiContent, GuiPos.getPos(2,4))
                    | enchant(armorContent, 1, guiContent, GuiPos.getPos(2,3))
                    | enchant(armorContent, 2, guiContent, GuiPos.getPos(2,2))
                    | enchant(armorContent, 3, guiContent, GuiPos.getPos(2,1))
                    | enchant(inventoryContent, weaponIndex[0], guiContent, GuiPos.getPos(6,2))
                    | enchant(inventoryContent, weaponIndex[1], guiContent, GuiPos.getPos(6,3));

            if(enchantSuccess){
                inventory.setContents(inventoryContent);
                gui.setContents(guiContent);
                player.playSound(player.getLocation(), Sound.BLOCK_ANVIL_USE, 1.0f, 2.0f);
            }

            InventoryModifier.clear(inventoryContent);
            InventoryModifier.clear(guiContent);
            InventoryModifier.clear(armorContent);
            closeGui();
        }

    }

    /**
     * content1[content1Slot] 의 아이템을 content2[content2Slot]의 아이템을 이용해 인챈트한다. <br>
     * 성공 시 content2[content2Slot]의 아이템이 사라지고 content1[content1Slot]의 아이템이 인챈트된다.
     * */
    private boolean enchant(ItemStack[] content1, int content1Slot, ItemStack[] content2, int content2Slot){
        enchanter.setItemNEnchantBook(content1[content1Slot], content2[content2Slot]);
        content1[content1Slot] = enchanter.enchant();
        if(enchanter.isSuccessed()){
            content2[content2Slot] = null;
            return true;
        }
        return false;
    }

    private boolean isInteractionSlots(GuiPos indexPos){
        return indexPos.onPositon(2,1)
                || indexPos.onPositon(2,2)
                || indexPos.onPositon(2,3)
                || indexPos.onPositon(2,4)
                || indexPos.onPositon(6,2)
                || indexPos.onPositon(6,3);
    }

    private int[] getWeaponIndex(ItemStack[] inventoryContent, ItemStack sword, ItemStack bow){
        int swordIndex = 0;
        int bowIndex = 0;
        int invlength = inventoryContent.length;
        for(int i = 0 ; i < invlength ; i ++){
            ItemStack currentItem = inventoryContent[i];
            if(currentItem != null){
                if(currentItem.equals(sword)) {
                    swordIndex = i;
                }
                else if(currentItem.equals(bow)) {
                    bowIndex = i;
                }
            }
        }

        int[] index = new int[2];
        index[0] = swordIndex;
        index[1] = bowIndex;
        return index;
    }

    private boolean isSword(ItemStack item){

        Material type = null;
        if(item == null || (type = item.getType()) == null){
            return false;
        }

        return type.equals(Material.IRON_SWORD)
                || type.equals(Material.DIAMOND_SWORD)
                || type.equals(Material.NETHERITE_SWORD);

    }

}
