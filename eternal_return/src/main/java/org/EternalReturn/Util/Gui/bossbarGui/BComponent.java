package org.EternalReturn.Util.Gui.bossbarGui;

import net.kyori.adventure.text.Component;

public interface BComponent {

    //같은 패키지에서만 접근 가능.
    Component getComponent();
    void setLocation(int x, int y);

}
