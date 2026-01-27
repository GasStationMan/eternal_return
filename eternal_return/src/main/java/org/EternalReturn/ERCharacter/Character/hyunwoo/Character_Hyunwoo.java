package org.EternalReturn.ERCharacter.Character.hyunwoo;

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

public class Character_Hyunwoo extends ERCharacter {

    // 플레이어별 공격 횟수를 저장하는 맵

    public Character_Hyunwoo(ERPlayer player) {
        super(player);
        this.cooldownSeconds = 8;
        registerMonobehaviour(new WallSlamDash());
        registerMonobehaviour(new StackingPunch());
    }


    @Override
    public String getName() { return "hyunwoo"; }

}