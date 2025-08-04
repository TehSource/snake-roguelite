/// @description States
switch (state)
{
    case ENEMY_STATE.IDLE:
        // If our health drops to 0, become dazed
        if (hp <= 0)
        {
            state = ENEMY_STATE.DAZED;
            sprite_index = spr_enemy_basic_dazed; // Change our look

            // Set an alarm to self-destruct after 5 seconds if not eaten
            alarm[0] = 5 * game_get_speed(gamespeed_fps);
        }
        break;

    case ENEMY_STATE.DAZED:
        // Do nothing while dazed, just wait to be eaten
        break;

    case ENEMY_STATE.MOVE:
          if (hp <= 0)
        {
            state = ENEMY_STATE.DAZED;
            sprite_index = spr_enemy_basic_dazed; // Change our look

            // Set an alarm to self-destruct after 5 seconds if not eaten
            alarm[0] = 5 * game_get_speed(gamespeed_fps);
        }

        if(distance_to_object(obj_snake_head) > 200){
            direction = point_direction(x, y, obj_snake_head.x, obj_snake_head.y)
            x += lengthdir_x(move_speed, direction);
            y += lengthdir_y(move_speed, direction);
        } else if (distance_to_object(obj_snake_head) < 200) { 
        state = ENEMY_STATE.ATTACK;
        }
        break;

    case ENEMY_STATE.ATTACK:
         if (hp <= 0)
        {
            state = ENEMY_STATE.DAZED;
            sprite_index = spr_enemy_basic_dazed; // Change our look

            // Set an alarm to self-destruct after 5 seconds if not eaten
            alarm[0] = 5 * game_get_speed(gamespeed_fps);
        }

        if(can_attack = true){
        alarm[1] = 2 * game_get_speed(gamespeed_fps);
        can_attack = false;
        }

         if (distance_to_object(obj_snake_head) > 200) { 
        state = ENEMY_STATE.MOVE;
        }
        break;
}