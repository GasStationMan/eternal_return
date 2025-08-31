package org.EternalReturn.Util.AnimatedJAVAEntity;

public class AJAnimationInfoBlock {
    private String animation;
    private long durationTicks;

    public AJAnimationInfoBlock(String animation, long durationTicks){
        this.animation = animation;
        this.durationTicks = durationTicks;
    }

    public String getAnimation(){
        return this.animation;
    }

    public long getAnimationDurationTicks(){
        return this.durationTicks;
    }
}