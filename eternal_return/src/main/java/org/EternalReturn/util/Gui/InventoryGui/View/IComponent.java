package org.EternalReturn.util.Gui.InventoryGui.View;

public class IComponent {

    protected int x;
    protected int y;
    protected int sizeX;
    protected int sizeY;
    protected IFrame whereThisBeContained;

    public IComponent(int x, int y, int sizeX, int sizeY){
        this.x = x;
        this.y = y;
    }

    //getter
    public int getX(){
        return x;
    }

    public int getY(){
        return y;
    }

    public int getSizeX(){
        return sizeX;
    }

    public int getSizeY(){
        return sizeY;
    }

    public boolean isUnder(GuiPos clickedPos){
        int clickedPosX = clickedPos.getX();
        int clickedPosY = clickedPos.getY();
        return (x <= clickedPosX && clickedPosX <= (sizeX + x))
                && (y <= clickedPosY && clickedPosY <= (sizeY + y));
    }

    //setter
    public void setIFrame(IFrame iFrame){
        this.whereThisBeContained = iFrame;
    }



}
