package org.EternalReturn.ERCharacter.util;

import org.EternalReturn.ERCharacter.ERCharacter;
import org.EternalReturn.ERCharacter.Event.CharacterEvent;
import org.EternalReturn.ERPlayer.ERPlayer;
import org.EternalReturn.ERPlayer.ERPlayerListener;
import org.bukkit.entity.Entity;
import org.bukkit.entity.LivingEntity;
import org.bukkit.entity.Player;

public abstract class ERMonobehaviour<T extends CharacterEvent> extends Monobehaviour<T>{

    private ERCharacter erCharacter;
    private ERPlayer erPlayer;
    private Player player;

    private void __init(){
        if(erCharacter != null){
            return;
        }
        if(!(this.actor instanceof ERCharacter)){
            throw new ClassCastException("Actor가 ERCharacter가 아닙니다.");
        }
        erCharacter = (ERCharacter)this.actor;
        erPlayer = erCharacter.getERPlayer();
        player = erPlayer.getPlayer();
    }

    protected ERCharacter getERCharacter(){
        __init();
        return erCharacter;
    }

    protected ERPlayer getERPlayer(){
        __init();
        return erPlayer;
    }

    protected Player getPlayer(){
        __init();
        return player;
    }

    protected void damage(Player attacker, LivingEntity victim, double dmg){
        ERPlayerListener.addAPIAttacker(attacker);
        victim.damage(dmg, attacker);
    }


    @Override
    public abstract void start(T event);

    @Override
    public abstract void update();
}
