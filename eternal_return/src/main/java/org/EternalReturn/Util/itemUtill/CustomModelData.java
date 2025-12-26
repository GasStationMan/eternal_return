package org.EternalReturn.Util.itemUtill;

import java.util.Objects;

/**
 * Custom Model Data 정보를 담는 블럭
 */
public class CustomModelData {

    private String cmdString;
    private float cmdFloat;

    public CustomModelData(){
        this.cmdString = null;
        this.cmdFloat = 0.0f;
    }

    public CustomModelData(String cmdString, float cmdFloat){
        this.cmdString = cmdString;
        this.cmdFloat = cmdFloat;
    }

    public String getCmdString(){
        return cmdString;
    }

    public float getCmdFloat(){
        return cmdFloat;
    }

    public void setCmdString(String string){
        this.cmdString = string;
    }

    public void setCmdFloat(float fvalue){
        this.cmdFloat = fvalue;
    }

    @Override
    public boolean equals(Object obj) {
        if(!(obj instanceof CustomModelData CustomModelData)){
            return false;
        }

        return Objects.equals(this.cmdString, CustomModelData.cmdString)
                && Objects.equals(this.cmdFloat,CustomModelData.cmdFloat);
    }

    @Override
    public int hashCode(){
        return Objects.hashCode(cmdString + cmdFloat);
    }
}
