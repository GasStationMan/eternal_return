package org.EternalReturn.ERPlayer.Skill;

import org.EternalReturn.Util.Free.FreeAble;

public abstract class Skill implements FreeAble {

    private long cooltime;
    private long nextTimeToUse;

    @Override
    public void free(){

    }

    public Skill(long cooltime, boolean canUseRightNow){
        this.cooltime = cooltime;
        if(canUseRightNow){
            this.nextTimeToUse = System.currentTimeMillis();
        }
        else{
            this.nextTimeToUse = cooltime + System.currentTimeMillis();
        }
    }

    //getter
    public long getTimeStamp(){
        return nextTimeToUse;
    }

    protected boolean isCoolDone(){
        return nextTimeToUse <= System.currentTimeMillis();
    }

    //setter
    public void setCooltime(){
        this.nextTimeToUse = System.currentTimeMillis() + cooltime;
    }

    public void update(){
        if(isCoolDone()){
            this.skillEffect();
            this.setCooltime();
        }
    }

    public abstract void skillEffect();

}
