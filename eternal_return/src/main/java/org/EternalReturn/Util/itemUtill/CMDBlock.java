package org.EternalReturn.Util.itemUtill;

import org.EternalReturn.System.PluginInstance;

import java.util.Objects;

public class CMDBlock {

    private String cmdString;
    private float cmdFloat;

    public CMDBlock(){
        this.cmdString = null;
        this.cmdFloat = 0.0f;
    }

    public CMDBlock(String cmdString, float cmdFloat){
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
        if(!(obj instanceof CMDBlock cmdBlock)){
            return false;
        }

        return Objects.equals(this.cmdString, cmdBlock.cmdString)
                && Objects.equals(this.cmdFloat,cmdBlock.cmdFloat);
    }

    @Override
    public int hashCode(){
        return Objects.hashCode(cmdString + cmdFloat);
    }
}
