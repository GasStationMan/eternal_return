package org.EternalReturn.ERCharacter.Character.adriana;

import org.EternalReturn.ERCharacter.ERCharacter;
import org.EternalReturn.ERCharacter.Event.CharacterSwapHandEvent;
import org.EternalReturn.ERPlayer.ERPlayer;
import org.bukkit.Location;
import org.bukkit.Particle;
import org.bukkit.entity.Entity;
import org.bukkit.entity.LivingEntity;
import org.bukkit.entity.Player;
import org.bukkit.util.Vector;

import java.util.LinkedList;

public class Character_Adriana extends ERCharacter {

    public Character_Adriana(ERPlayer player) {
        super(player);
        this.cooldownSeconds = 5;
        this.registerMonobehaviour(this, new BurningGround());
        this.registerMonobehaviour(this, new LitFireOnAttack());
    }

    @Override
    public String getName() {
        return "adriana";
    }
    
}
