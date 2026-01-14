package org.EternalReturn.System.ERAnimalSystem;

import java.util.List;

public record AreaERAnimalInfo(String name, List<ERAnimalInfo> animals) {

    @Override
    public String toString(){
        String output = "";
        for(ERAnimalInfo animal : this.animals()){
            output += (animal.name + " : " + animal.x + ", " + animal.y + ", " + animal.z + ", " + animal.yaw + ", " + animal.pitch);
            output += "\n";
        }
        return output;
    }

}
