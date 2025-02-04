package org.EternalReturn.System.Gui.Control;

import org.EternalReturn.Util.InventoryGui.GuiPos;
import org.bukkit.event.inventory.InventoryClickEvent;
import org.bukkit.inventory.Inventory;

public interface GuiController {

    public void openGui();
    public void closeGui();
    public void whenOpen();
    public void whenClose();

    public boolean isOpen();
    public Inventory getGui();

    public void doEvent(GuiPos pos, InventoryClickEvent e);
}
