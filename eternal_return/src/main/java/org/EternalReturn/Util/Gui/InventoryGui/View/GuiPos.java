package org.EternalReturn.Util.Gui.InventoryGui.View;

public class GuiPos {
    private int x;
    private int y;

    public GuiPos(int x, int y){
        this.x = x;
        this.y = y;
    }

    public GuiPos(int inventoryIndex){
        this.x = (inventoryIndex % 9);
        this.y = (inventoryIndex / 9);
    }

    public GuiPos(){
        this.x = 0;
        this.y = 0;
    }

    public static GuiPos getClickedPos(int clickedPosition){
        GuiPos guiPos = new GuiPos((clickedPosition % 9),(clickedPosition / 9));
        return guiPos;
    }
    //getter
    public static int getPos(int x, int y){
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

    //setter
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

    public boolean equals(int x, int y){
        return (this.x == x) && (this.y == y);
    }

    @Override
    public boolean equals(Object obj) {

        if(!(obj instanceof GuiPos p)){
            return false;
        }

        return (p.getX() == x) && (p.getY() == y);
    }
}
