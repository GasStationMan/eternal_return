package org.EternalReturn.Util.Gui.InventoryGui;

import org.EternalReturn.Util.Gui.InventoryGui.View.GuiPos;
import org.bukkit.event.inventory.InventoryClickEvent;
import org.bukkit.inventory.Inventory;

public interface IGuiController{

    public void free();

    public void openGui();
    public void closeGui();
    public void whenOpen();
    public void whenClose();

    public boolean isOpen();
    public Inventory getGui();

    public void doEvent(GuiPos pos, InventoryClickEvent e);
}
