enemy_handle_death(spr_enemy_basic_dazed);
if (state == ENEMY_STATE.DAZED) exit;

var dist_to_player = distance_to_object(obj_snake_head);

switch (state) {
    case ENEMY_STATE.MOVE:
        if (dist_to_player >= attack_range) {
            var dir = point_direction(x, y, obj_snake_head.x, obj_snake_head.y);
            var hspd = lengthdir_x(move_speed, dir);
            var vspd = lengthdir_y(move_speed, dir);

            if (!collision_circle(x + hspd, y, 10, obj_wall_basic, false, true)) x += hspd;
            if (!collision_circle(x, y + vspd, 10, obj_wall_basic, false, true)) y += vspd;
        } else {
            state = ENEMY_STATE.ATTACK;
        }
        break;

    case ENEMY_STATE.ATTACK:
        if (dist_to_player < attack_range && can_attack) {
            alarm[1] = 2 * game_get_speed(gamespeed_fps);
            can_attack = false;
        } else if (dist_to_player > attack_range) {
            state = ENEMY_STATE.MOVE;
        }
        break;
}
