package org.EternalReturn.ERPlayer.Gui.Inventory.UpgradeSystem.View;
import org.EternalReturn.Util.Gui.InventoryGui.View.IFrame;
import org.EternalReturn.Util.itemUtill.ItemGenerator;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.inventory.ItemStack;
import org.jetbrains.annotations.NotNull;

public class UpgradeGui extends IFrame {

    public UpgradeGui(@NotNull Player p){
        super(p, 6);
        setGui();
    }

    private void setGui(){
        for(int y = 0 ; y < 6; y ++){
            for(int x = 0; x < 9; x ++){
                this.setItemOnGui(x,y,new ItemStack(Material.GRAY_STAINED_GLASS_PANE));
            }
        }

        this.setItemOnGui(2,1,new ItemStack(Material.AIR));
        this.setItemOnGui(2,2,new ItemStack(Material.AIR));
        this.setItemOnGui(2,3,new ItemStack(Material.AIR));
        this.setItemOnGui(2,4,new ItemStack(Material.AIR));

        this.setItemOnGui(6,2,new ItemStack(Material.AIR));
        this.setItemOnGui(6,3,new ItemStack(Material.AIR));

        this.setItemOnGui(4,5,new ItemGenerator(Material.ANVIL)
                .setDisplayName("강화하기")
                .setLore(new String[] {
                        "아이템을 강화합니다.",
                        "행에 맞는 더 강한 아이템으로 변합니다."})
                .generate());
    }


}
