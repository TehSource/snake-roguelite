// Script: trigger_damage_flash
// Makes the calling instance flash white to show it took damage.

function trigger_damage_flash()
{
    // Only trigger if not already flashing
    if (!is_flashing)
    {
        is_flashing = true;
        
        // Set an alarm to turn off the flash.
        // We use alarm[1] by convention for this effect.
        alarm[1] = 0.2 * game_get_speed(gamespeed_fps);
    }
}