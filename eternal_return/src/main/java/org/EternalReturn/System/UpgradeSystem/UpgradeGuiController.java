package org.EternalReturn.System.UpgradeSystem;

import org.EternalReturn.System.ERPlayer.ERPlayer;
import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.Util.Gui.Inventory.GuiController;
import org.EternalReturn.Util.Gui.Inventory.InventoryGui.GuiPos;
import org.EternalReturn.Util.Gui.Inventory.InventoryGui.InventoryGui;
import org.EternalReturn.Util.inventoryUtil.InventoryModifier;
import org.EternalReturn.Util.itemUtill.Enchanter;
import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.Sound;
import org.bukkit.block.EnchantingTable;
import org.bukkit.entity.Player;
import org.bukkit.event.inventory.InventoryClickEvent;
import org.bukkit.inventory.EntityEquipment;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.ItemStack;
import org.bukkit.plugin.Plugin;
import org.bukkit.scheduler.BukkitScheduler;


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

        try{
            int posIndex = e.getSlot();
            GuiPos indexPos = GuiPos.getClickedPos(posIndex);
            Inventory gui = upgradeGui.getGui();

            Player player = (Player)e.getWhoClicked();


            int column = indexPos.getX();
            int row = indexPos.getY();

            //2번 열 제외하고 전부 클릭 취소 처리
            if(!(indexPos.onPositon(2,1)
                    || indexPos.onPositon(2,2)
                    || indexPos.onPositon(2,3)
                    || indexPos.onPositon(2,4)
                    || indexPos.onPositon(6,2)
                    || indexPos.onPositon(6,3))
            ){
                e.setCancelled(true);
            }

            //*****************갑옷이 널이 될 리는 없다! 널체크 후 Exception 던지는 코드
            EntityEquipment playerEquipment = null;

            ItemStack[] armorContent = null;
            if((playerEquipment = player.getEquipment()) == null
                    || (armorContent = playerEquipment.getArmorContents()) == null){
                throw new NullPointerException("아머칸 리스트가 null입니다.");
            }

            int length = armorContent.length;
            for(int i = 0 ; i < length ; i ++){
                if(armorContent[i] == null){
                    throw new NullPointerException("아머칸 리스트에 null이 포함되어있습니다.");
                }
            }
            //****************************************

            if(row == 5 && column == 4){
                ItemStack[] guiContent = gui.getContents();
                
                
                //투구
                Enchanter helmetEnchanter = new Enchanter(guiContent[GuiPos.getPos(1, 1)], guiContent[GuiPos.getPos(2, 1)]);
                if(helmetEnchanter.canEnchant()){
                    ItemStack helmet = helmetEnchanter.enchant();
                    guiContent[GuiPos.getPos(1, 1)] = helmet;
                    guiContent[GuiPos.getPos(2, 1)] = null;
                    armorContent[3] = helmet;
                }

                //갑옷
                Enchanter chestplateEnchanter = new Enchanter(guiContent[GuiPos.getPos(1, 2)], guiContent[GuiPos.getPos(2, 2)]);
                if(chestplateEnchanter.canEnchant()){
                    ItemStack chestplate = chestplateEnchanter.enchant();
                    guiContent[GuiPos.getPos(1, 2)] = chestplate;
                    guiContent[GuiPos.getPos(2, 2)] = null;
                    armorContent[2] = chestplate;
                }

                //레깅스
                Enchanter leggingsEnchanter = new Enchanter(guiContent[GuiPos.getPos(1, 3)], guiContent[GuiPos.getPos(2, 3)]);
                if(leggingsEnchanter.canEnchant()){
                    ItemStack leggings = leggingsEnchanter.enchant();
                    guiContent[GuiPos.getPos(1, 3)] = leggings;
                    guiContent[GuiPos.getPos(2, 3)] = null;
                    armorContent[1] = leggings;
                }
                
                //부츠
                Enchanter bootsEnchanter = new Enchanter(guiContent[GuiPos.getPos(1, 4)], guiContent[GuiPos.getPos(2, 4)]);
                if(bootsEnchanter.canEnchant()){
                    ItemStack boots = bootsEnchanter.enchant();
                    guiContent[GuiPos.getPos(1, 4)] = boots;
                    guiContent[GuiPos.getPos(2, 4)] = null;
                    armorContent[0] = boots;
                }
                
                
                //검과 활 업그레이드
                Inventory playerInventory = player.getInventory();
                ItemStack[] inventoryContent = playerInventory.getContents();

                ItemStack sword = guiContent[GuiPos.getPos(5, 2)];
                ItemStack bow = guiContent[GuiPos.getPos(5, 3)];

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

                Enchanter swordEnchanter = new Enchanter(sword, guiContent[GuiPos.getPos(6, 2)]);
                if(swordEnchanter.canEnchant()){
                    inventoryContent[swordIndex] = swordEnchanter.enchant();
                    guiContent[GuiPos.getPos(5, 2)] = sword;
                    guiContent[GuiPos.getPos(6, 2)] = null;
                }

                Enchanter bowEnchanter = new Enchanter(bow, guiContent[GuiPos.getPos(6, 3)]);
                if(swordEnchanter.canEnchant()){
                    inventoryContent[bowIndex] = bowEnchanter.enchant();
                    guiContent[GuiPos.getPos(5, 3)] = bow;
                    guiContent[GuiPos.getPos(6, 3)] = null;
                }


                playerInventory.setContents(inventoryContent);
                playerEquipment.setArmorContents(armorContent);
                gui.setContents(guiContent);

                player.playSound(player.getLocation(), Sound.BLOCK_ANVIL_USE, 1.0f, 1.0f);

                closeGui();
            }
        }
        catch (NullPointerException ex){
            ex.printStackTrace();
        }

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
