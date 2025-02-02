package org.EternalReturn.System.Gui.View;
import org.EternalReturn.Util.InventoryGui.GuiGenerator;
import org.EternalReturn.Util.InventoryGui.InventoryGuiGenerator;
import org.EternalReturn.Util.itemUtill.ItemGenerator;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.ItemStack;
import org.jetbrains.annotations.Nullable;

public class UpgradeGuiGenerator extends InventoryGuiGenerator{


    public UpgradeGuiGenerator(@Nullable Player p){
        super(p, 54);
        setGui();
    }

    private void setGui(){
        for(int y = 0 ; y < 6; y ++){
            for(int x = 0; x < 9; x ++){
                if(x == 0 || (3 <= x && x <= 6) || x == 8){
                    this.setItemOnGui(x,y,new ItemStack(Material.GRAY_STAINED_GLASS_PANE));
                }
            }
        }

        this.setItemOnGui(4,4,new ItemGenerator(Material.ANVIL)
                .setDisplayName("강화하기")
                .setLore(new String[] {
                        "아이템을 강화합니다.",
                        "행에 맞는 더 강한 아이템으로 변합니다."})
                .generate());
    }
}
