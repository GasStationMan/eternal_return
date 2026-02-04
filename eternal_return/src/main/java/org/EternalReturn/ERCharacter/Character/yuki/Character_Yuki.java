package org.EternalReturn.ERCharacter.Character.yuki;


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

public class Character_Yuki extends ERCharacter {

    public int buttonCount = 4;
    public boolean isReloading = false;
    public boolean isActiveSkill = false;
    public boolean isActiveAttack = false;
    public Map<LivingEntity, Location> stunnedVictims = new HashMap<>();

    public Character_Yuki(ERPlayer player) {
        super(player);
        this.cooldownSeconds = 8;
        registerMonobehaviour(new Active());
        registerMonobehaviour(new Passive());
    }


    @Override
    public String getName() { return "yuki"; }

}