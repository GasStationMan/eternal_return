package org.EternalReturn.Util.AnimatedJAVAEntity;

public record AJAnimationInfoBlock (
    String animation,
    long durationTicks){
    
    public AJAnimationInfoBlock(String animation, long durationTicks){
        this.animation = animation;
        this.durationTicks = durationTicks;
    }
}