package org.EternalReturn.System.Gui.Control;

import org.EternalReturn.System.ERPlayer.ERPlayer;
import org.EternalReturn.Util.InventoryGui.GuiPos;
import org.EternalReturn.Util.InventoryGui.InventoryGui;
import org.EternalReturn.Util.itemUtill.ItemMover;
import org.bukkit.Material;
import org.bukkit.enchantments.Enchantment;
import org.bukkit.entity.Entity;
import org.bukkit.entity.Item;
import org.bukkit.entity.Player;
import org.bukkit.event.inventory.InventoryClickEvent;
import org.bukkit.inventory.EntityEquipment;
import org.bukkit.inventory.EquipmentSlot;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.EnchantmentStorageMeta;
import org.bukkit.inventory.meta.ItemMeta;

import java.util.Map;
import java.util.Stack;

public class UpgradeGuiController implements GuiController{

    private ERPlayer erPlayer;
    private InventoryGui upgradeGui;
    private boolean isOpen;

    public UpgradeGuiController(InventoryGui gui){
        upgradeGui = gui;
        erPlayer = upgradeGui.getERPlayer();
    }

    public void free(){
        erPlayer = null;
        upgradeGui = null;
    }

    @Override
    public void openGui(){
        isOpen = true;
        Player p = erPlayer.getPlayer();
        p.openInventory(upgradeGui.getGui());
    }

    @Override
    public void closeGui() {
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

        Stack<ItemMover> stack = new Stack<>();

        while(guiIndex < 6 && invIndex < playerInventory.getSize()){

            if(playerInventory.getItem(invIndex) != null){
                invIndex++;
                continue;
            }

            if(upgGui.getItem(guiIndex) == null){
                guiIndex++;
                continue;
            }

            int guiPosition = GuiPos.getPositionOnInventory(2, guiIndex);

            ItemStack moveItem = upgGui.getItem(guiPosition);
            stack.add(new ItemMover(moveItem, invIndex));
            invIndex++;
            guiIndex++;

        }

        //게으른 계산 (이렇게 해야 안 꼬임.)
        int i = 0;
        while(!stack.isEmpty()){

            upgGui.clear(GuiPos.getPositionOnInventory(2, i++));

            ItemMover itemToMove = stack.pop();
            int index = itemToMove.getIndex();
            ItemStack item = itemToMove.getItemStack();
            player.getInventory().setItem(index,item);
        }

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



        for(int i = 0 ; i < 6; i ++){

            pos.setPos(2, i);
            ItemStack enchantBook = null;
            if(i == row){
                enchantBook = e.getCursor();
            }
            else{
                enchantBook = gui.getItem(pos.toIndex());
            }

            ItemMeta enchantBookMeta = null;

            //objectItem position
            pos.setPos(7,i);
            ItemStack objectItem = gui.getItem(pos.toIndex());

            //******************************널체크******************************
            //오브젝트 아이템이 null이어도 안 됨.
            if(objectItem == null
                    || objectItem.getItemMeta() == null
                    || objectItem.getType().equals(Material.GRAY_STAINED_GLASS_PANE)){
                continue;
            }

            //인챈트 아이템이 null이어도 안 됨 + 인챈트북이 아니어도 안 됨.
            ItemMeta objMeta = objectItem.getItemMeta();
            if(enchantBook == null
                    || !enchantBook.getType().equals(Material.ENCHANTED_BOOK)
                    || (enchantBookMeta = enchantBook.getItemMeta()) == null){
                if(objMeta.hasEnchants()){
                    objMeta.removeEnchantments();
                    objectItem.setItemMeta(objMeta);
                }
                continue;
            }
            //******************************널체크******************************
            //여기서부터가 로직


            EnchantmentStorageMeta enchantMeta = (EnchantmentStorageMeta)enchantBookMeta;
            for(Enchantment enchantment : enchantMeta.getStoredEnchants().keySet()){
                if(i <= 3 && enchantment.equals(Enchantment.PROTECTION)){
                    int enchantLevel = enchantMeta.getStoredEnchantLevel(enchantment);

                    if(upgrade){
                        player.sendMessage("test");
                        enchantBook.setAmount(enchantBook.getAmount() - 1);
                        EntityEquipment equipment = player.getEquipment();

                        int index = 3-i;
                        ItemStack armor = equipment.getArmorContents()[index];
                        ItemMeta armorMeta = armor.getItemMeta();
                        armorMeta.addEnchant(enchantment, enchantLevel, false);
                        armor.setItemMeta(armorMeta);

                        if(index == 0){
                            equipment.setBoots(armor);
                        }
                        else if(index == 1){
                            equipment.setLeggings(armor);
                        }
                        else if(index == 2){
                            equipment.setChestplate(armor);
                        }
                        else if(index == 3){
                            equipment.setHelmet(armor);
                        }
                    }
                    else{
                        objMeta.addEnchant(enchantment, enchantLevel, false);
                        objectItem.setItemMeta(objMeta);
                    }
                }
            }

            if(upgrade){
                closeGui();
            }
        }
    }
    private boolean isSword(ItemStack item){
        Material type = item.getType();
        return type.equals(Material.IRON_SWORD)
                || type.equals(Material.DIAMOND_SWORD)
                || type.equals(Material.NETHERITE_SWORD);
    }

}
