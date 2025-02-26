package org.EternalReturn.Util.Gui.bossbarGui.Model;

import java.util.List;

public interface BComponentManager {

    public List<BComponent> getBComponents();

    public void repaint();

    public void add(BComponent bComponent);

}
