package org.EternalReturn.ERAnimal;

public class ERAnimalInfo {

    public String name;
    public double x;
    public double y;
    public double z;
    public float yaw;
    public float pitch;
    public ERAnimal instance;

    public ERAnimalInfo(String name, double x, double y, double z, float yaw, float pitch, ERAnimal instance) {
        this.name = name;
        this.x = x;
        this.y = y;
        this.z = z;
        this.yaw = yaw;
        this.pitch = pitch;
        this.instance = instance;
    }


    public void setInstance(ERAnimal animal){
        this.instance = animal;
    }

}
