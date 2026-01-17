package org.EternalReturn.ERCharacter.Character;

import org.EternalReturn.ERCharacter.ERCharacter;
import org.EternalReturn.ERPlayer.ERPlayer;
import org.bukkit.entity.Entity;
import org.bukkit.entity.LivingEntity;
import org.bukkit.entity.Player;

public class Character_Aya extends ERCharacter {
    public Character_Aya(ERPlayer player) {
        super(player);
        this.cooldownSeconds = 1;
    }

    @Override
    public void update() {

    }

    @Override
    public String getName() {
        return "aya";
    }

    @Override
    public void onAttack(ERPlayer attacker, Entity victim){

    }

    @Override
    public void onActiveSkill(ERPlayer player) {

    }
}