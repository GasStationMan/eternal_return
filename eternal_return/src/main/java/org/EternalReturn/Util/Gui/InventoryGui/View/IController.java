package org.EternalReturn.Util.Gui.InventoryGui.View;

import org.EternalReturn.Util.Gui.InventoryGui.IGuiController;
import org.bukkit.entity.Player;
import org.bukkit.event.inventory.InventoryClickEvent;
import org.bukkit.inventory.Inventory;

public class IController implements IGuiController {

    protected boolean isOpen;
    protected IFrame inventoryGui;
    protected Player player;

    public IController(Player player, IFrame inventoryGui){
        this.isOpen = false;
        this.inventoryGui = inventoryGui;
        this.player = player;
    }

    @Override
    public void free() {

    }

    @Override
    public void openGui() {
        isOpen = true;
        whenOpen();
    }

    @Override
    public void closeGui() {
        isOpen = false;
        whenClose();
    }

    @Override
    public void whenOpen() {
    }

    @Override
    public void whenClose() {
    }

    @Override
    public boolean isOpen() {
        return isOpen;
    }

    @Override
    public Inventory getGui() {
        return inventoryGui.getGui();
    }

    @Override
    public void doEvent(GuiPos pos, InventoryClickEvent e) {

    }
}
