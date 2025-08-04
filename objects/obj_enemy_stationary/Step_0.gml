enemy_handle_death(spr_enemy_stationary_dazed);
if (state == ENEMY_STATE.DAZED) exit;

var dist_to_player = distance_to_object(obj_snake_head);
if (dist_to_player <= attack_range && can_attack) {
    alarm[1] = 60; // 1 second at 60fps
    can_attack = false;
}
