/// @description States
switch (state)
{
    case ENEMY_STATE.IDLE:
        // If our health drops to 0, become dazed
        if (hp <= 0)
        {
            state = ENEMY_STATE.DAZED;
            sprite_index = spr_enemy_stationary_dazed; // Change our look

            // Set an alarm to self-destruct after 5 seconds if not eaten
            alarm[0] = 5 * game_get_speed(gamespeed_fps);
        }
        break;

    case ENEMY_STATE.DAZED:
        // Do nothing while dazed, just wait to be eaten
        break;

    case ENEMY_STATE.ATTACK:
         if (hp <= 0)
        {
            state = ENEMY_STATE.DAZED;
            sprite_index = spr_enemy_stationary_dazed; // Change our look

            // Set an alarm to self-destruct after 5 seconds if not eaten
            alarm[0] = 5 * game_get_speed(gamespeed_fps);
        }

        if(can_attack = true){
        alarm[1] = 1 * game_get_speed(gamespeed_fps);
        can_attack = false;
        }

        break;
}