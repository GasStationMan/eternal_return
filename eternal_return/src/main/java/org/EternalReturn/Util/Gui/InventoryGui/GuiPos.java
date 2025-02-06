package org.EternalReturn.Util.Gui.InventoryGui;

public class GuiPos {
    private int x;
    private int y;

    public GuiPos(int x, int y){
        this.x = x;
        this.y = y;
    }

    public GuiPos(){
        this.x = 0;
        this.y = 0;
    }

    public static GuiPos getClickedPosition(int clickedPosition){
        GuiPos guiPos = new GuiPos((clickedPosition % 9),(clickedPosition / 9));
        return guiPos;
    }

    public static int getPositionOnInventory(int x, int y){
        return x + y * 9;
    }

    public boolean onPositon(int x,int y){
        return (this.x == x) && (this.y == y);
    }

    public int getX(){
        return x;
    }

    public int getY(){
        return y;
    }

    public int toIndex(){
        return x + y * 9;
    }

    public void setPos(int posX, int posY){
        x = posX;
        y = posY;
    }

    public void setX(int posX){
        x = posX;
    }

    public void setY(int posY){
        y = posY;
    }
}
