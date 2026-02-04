package org.EternalReturn.ERCharacter.Character.fiora;


import org.EternalReturn.ERCharacter.ERCharacter;
import org.EternalReturn.ERPlayer.ERPlayer;
import org.bukkit.Location;
import org.bukkit.Particle;
import org.bukkit.Sound;
import org.bukkit.entity.Entity;
import org.bukkit.entity.LivingEntity;
import org.bukkit.entity.Player;
import org.bukkit.util.Vector;

import java.util.*;

public class Character_Fiora extends ERCharacter {

    public Character_Fiora(ERPlayer player) {
        super(player);
        this.cooldownSeconds = 8;
        registerMonobehaviour(new Passive());
        registerMonobehaviour(new Active());
    }


    @Override
    public String getName() { return "fiora"; }

}