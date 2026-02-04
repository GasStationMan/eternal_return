package org.EternalReturn.util.Gui.InventoryGui.View;

public abstract class IButton extends IComponent{

    public IButton(int x, int y, int sizeX, int sizeY) {
        super(x, y, sizeX, sizeY);
    }

    public void doEvent(GuiPos guiPos){
        if(super.isUnder(guiPos)){
            event();
        }
    }

    public abstract void event();

}
