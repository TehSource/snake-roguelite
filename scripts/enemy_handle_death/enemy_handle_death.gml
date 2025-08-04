/// @function enemy_handle_death(_dazed_sprite)
/// @description Handles transition to DAZED state.
/// @param _dazed_sprite The sprite to use when dazed.

function enemy_handle_death(_dazed_sprite)
{
    if (hp <= 0 && state != ENEMY_STATE.DAZED) {
        state = ENEMY_STATE.DAZED;
        sprite_index = _dazed_sprite;
        alarm[0] = 5 * game_get_speed(gamespeed_fps);
    }
}
