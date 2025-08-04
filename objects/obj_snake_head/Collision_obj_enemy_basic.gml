if (other.state == other.ENEMY_STATE.IDLE)
{
	if(is_flashing != true){
		hp -= 1;
		trigger_damage_flash();
	}
}
else if (other.state == other.ENEMY_STATE.DAZED)
{
    // Consume the enemy
    instance_destroy(other);

    // Call the global script to handle growth
    snake_add_segment(id); // 'id' refers to this instance of the snake head
}