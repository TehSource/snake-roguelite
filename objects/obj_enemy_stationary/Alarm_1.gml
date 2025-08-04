/// @description Blasting
    var shoot_direction = point_direction(x, y, obj_snake_head.x, obj_snake_head.y)
    var _spawn_dist = 0;
    var _spawn_x = x + lengthdir_x(_spawn_dist, shoot_direction);
    var _spawn_y = y + lengthdir_y(_spawn_dist, shoot_direction);
    var _enemy_bullet = instance_create_layer(_spawn_x, _spawn_y, "Instances", obj_enemy_bullet);
    _enemy_bullet.direction = shoot_direction;
    _enemy_bullet.image_angle = shoot_direction;
    can_attack = true;