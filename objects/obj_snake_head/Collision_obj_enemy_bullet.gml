if(is_flashing != true){
hp -= 1;
trigger_damage_flash();
instance_destroy(other);
}