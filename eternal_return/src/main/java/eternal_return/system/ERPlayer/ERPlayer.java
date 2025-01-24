package eternal_return.system.ERPlayer;

import eternal_return.system.EternalReturnMain;
import eternal_return.system.SystemManager;
import eternal_return.system.bossbarHud.BossbarHud;
import eternal_return.system.guiGenerator.GuiGenerator;
import eternal_return.system.guiGenerator.GuiPos;
import eternal_return.system.itemUtill.ItemModifier;
import eternal_return.system.itemUtill.ItemMover;
import net.kyori.adventure.bossbar.BossBar;
import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.event.inventory.InventoryClickEvent;
import org.bukkit.inventory.EntityEquipment;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.ItemStack;
import org.bukkit.util.Vector;

import java.util.Set;
import java.util.Stack;





public class ERPlayer {

    private final Player player;
    private final Inventory upgradeGui;
    public boolean isOpenHyperloopGui;
    private boolean isOpenUpgradeGui;
    private final BossbarHud hyperloop;


    public ERPlayer(Player p){
        player = p;
        upgradeGui = createUpgradeGui(p);
        hyperloop = new BossbarHud(p);

    }

    private Inventory createUpgradeGui(Player p) {
        try{
            return new GuiGenerator(p, 54)
                    .setContents(new ItemStack[]{
                            null,
                            new ItemStack(Material.AIR),
                            new ItemStack(Material.AIR),
                            null,
                            null,
                            null,
                            null,
                            new ItemStack(Material.AIR),
                            null,

                            null,
                            new ItemStack(Material.AIR),
                            new ItemStack(Material.AIR),
                            null,
                            null,
                            null,
                            null,
                            new ItemStack(Material.AIR),
                            null,

                            null,
                            new ItemStack(Material.AIR),
                            new ItemStack(Material.AIR),
                            null,
                            null,
                            null,
                            null,
                            new ItemStack(Material.AIR),
                            null,

                            null,
                            new ItemStack(Material.AIR),
                            new ItemStack(Material.AIR),
                            null,
                            null,
                            null,
                            null,
                            new ItemStack(Material.AIR),
                            null,

                            null,
                            new ItemStack(Material.AIR),
                            new ItemStack(Material.AIR),
                            null,
                            new ItemModifier(new ItemStack(Material.ANVIL))
                                    .setDisplayName("강화하기")
                                    .setLore(new String[] {
                                            "아이템을 강화합니다.",
                                            "열에 맞는 더 강한 아이템으로 변합니다."
                                    })
                                    .confirm(),
                            null,
                            null,
                            new ItemStack(Material.AIR),
                            null,

                            null,
                            new ItemStack(Material.AIR),
                            new ItemStack(Material.AIR),
                            null,
                            null,
                            null,
                            null,
                            new ItemStack(Material.AIR),
                            null
                    });
        }
        catch (NullPointerException e){
            e.printStackTrace();
            return Bukkit.createInventory(p,54);
        }
    }

    public Player getPlayer() {
        return player;
    }

    public Inventory getInventory() {
        return upgradeGui;
    }

    public boolean isOpenUpgradeGui(){
        return isOpenUpgradeGui;
    }

    public BossbarHud getHyperloopHud(){
        return hyperloop;
    }


    public void updateUpgradeGuiWhenClose(){
        if(!isOpenUpgradeGui){
            return;
        }

        //upgradeGui 내의 물건을 다시 플레이어 인벤토리로 되돌리는 기능
        int invIndex = 0;
        int guiIndex = 0;
        Inventory playerInventory = player.getInventory();

        Stack<ItemMover> stack = new Stack<>();

        while(guiIndex < 6 && invIndex < playerInventory.getSize()){

            if(playerInventory.getItem(invIndex) != null){
                invIndex++;
                continue;
            }

            if(upgradeGui.getItem(guiIndex) == null){
                guiIndex++;
                continue;
            }

            int guiPosition = GuiPos.getPositionOnInventory(2, guiIndex);

            ItemStack moveItem = upgradeGui.getItem(guiPosition);
            stack.add(new ItemMover(moveItem, invIndex));
            invIndex++;
            guiIndex++;

        }
        
        //게으른 계산 (이렇게 해야 안 꼬임.)
        int i = 0;
        while(!stack.isEmpty()){

            upgradeGui.clear(GuiPos.getPositionOnInventory(2, i++));

            ItemMover itemToMove = stack.pop();
            int index = itemToMove.getIndex();
            ItemStack item = itemToMove.getItemStack();
            player.getInventory().setItem(index,item);
        }



        isOpenUpgradeGui = false;
    }

    public void updateUpgradeGuiWhenOpen(){

        isOpenUpgradeGui = true;

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
            upgradeGui.setItem(GuiPos.getPositionOnInventory(1,i),itemToInsert);
            upgradeGui.setItem(GuiPos.getPositionOnInventory(7,i),itemToInsert);
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

                upgradeGui.setItem(GuiPos.getPositionOnInventory(1,4),currentItem);
                upgradeGui.setItem(GuiPos.getPositionOnInventory(7,4),currentItem);
                findSword = true;
            }
            else if(itemType.equals(Material.BOW) || itemType.equals(Material.FISHING_ROD)){
                upgradeGui.setItem(GuiPos.getPositionOnInventory(1,5),currentItem);
                upgradeGui.setItem(GuiPos.getPositionOnInventory(7,5),currentItem);
                findBow = true;
            }
        }
    }

    public void encodeVelocityTag(){
        Set<String> tagSet = player.getScoreboardTags();
        for(String tag : tagSet){
            if(tag.startsWith("v")){
                String[] velocity = tag.split("_");
                // move 1 1 1
                // 0    1 2 3
                player.setVelocity(new Vector(
                        Float.parseFloat(velocity[1]),
                        Float.parseFloat(velocity[2]),
                        Float.parseFloat(velocity[3])
                ));
                tagSet.remove(tag);
                break;
            }
        }
    }

    //upgradeGui를 control하는 함수
    public void upgradeGuiFunction(InventoryClickEvent e) {

        GuiPos guiPos = GuiPos.getClickedPosition(e.getSlot());
        Player p = (Player)e.getWhoClicked();
        ERPlayer erPlayer = SystemManager.getInstance().getERPlayer(p);

        if(guiPos.getX() != 2){ //세번째 열 제외하고 모두 버튼으로 만들기
            e.setCancelled(true);
            if(guiPos.onPositon(4,4)){
                EternalReturnMain.dfLogUTF8("upgrading...");
                p.closeInventory();
            }
        }
    }

    public void sendMessage(String str) {
        player.sendMessage(str);
    }
}
