package org.EternalReturn.Util.Gui.InventoryGui.View;


import org.bukkit.inventory.ItemStack;

/**
 * <h>IEmptyField클래스<h/>
 * <p>인벤토리 상에 빈 공간을 만들어주는 클래스로, 이벤트의 캔슬에 영향을 받지 않음.<p/>
 * */
public class IEmptyField extends IComponent{

    protected boolean returnToPlayerInv;
    protected ItemStack[] contents;

    public IEmptyField(int x, int y, int sizeX, int sizeY) {
        super(x, y, sizeX, sizeY);
        this.returnToPlayerInv = false;
        this.contents = new ItemStack[(sizeX * sizeY)];
        this.whereThisBeContained = null;
    }



}
