package eternal_return.system.guiGenerator;

public class GuiPos {
    private int x;
    private int y;

    private GuiPos(int x, int y){
        this.x = x;
        this.y = y;
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

}
