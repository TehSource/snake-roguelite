/// @description Stationary enemy logic

// Handle health & dazed logic once
if (hp <= 0) {
    state = ENEMY_STATE.DAZED;
    sprite_index = spr_enemy_stationary_dazed;
    alarm[0] = 5 * game_get_speed(gamespeed_fps);
}

// Don’t do anything if dazed
if (state == ENEMY_STATE.DAZED) {
    exit;
}

// Only fire if the player is within our attack range
var _dist = distance_to_object(obj_snake_head);
if (_dist <= attack_range && can_attack) {
    alarm[1] = 1 * game_get_speed(gamespeed_fps);
    can_attack = false;
}
