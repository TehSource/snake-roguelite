/// @description States

// Handle health & dazed logic once
if (hp <= 0) {
    state = ENEMY_STATE.DAZED;
    sprite_index = spr_enemy_basic_dazed;
    alarm[0] = 5 * game_get_speed(gamespeed_fps);
}

// If dazed, just wait
if (state == ENEMY_STATE.DAZED) {
    exit;
}

// Cache the distance to the player so we only calculate it once
var _dist = distance_to_object(obj_snake_head);

switch (state) {
    case ENEMY_STATE.MOVE:
        // If player is far, move toward them; otherwise switch to attack
        if (_dist >= 200) {
            direction = point_direction(x, y, obj_snake_head.x, obj_snake_head.y);

        var hspd = lengthdir_x(move_speed, direction);
        var vspd = lengthdir_y(move_speed, direction);

        // Only move if there isn’t a wall at the next position
        if (!collision_circle(x + hspd, y, 10, obj_wall_basic, false, true)) {
            x += hspd;
        }
        if (!collision_circle(x, y + vspd, 10, obj_wall_basic, false, true)) {
            y += vspd;
        }
        } else {
            state = ENEMY_STATE.ATTACK;
        }
        break;

    case ENEMY_STATE.ATTACK:
        // Fire if within range and allowed to attack
        if (_dist < 200) {
            if (can_attack) {
                alarm[1] = 2 * game_get_speed(gamespeed_fps);
                can_attack = false;
            }
        } else {
            state = ENEMY_STATE.MOVE;
        }
        break;

    // IDLE state isn’t used here, but is left for completeness
    case ENEMY_STATE.IDLE:
        break;
}