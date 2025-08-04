/// @description Blasting
var dir = point_direction(x, y, obj_snake_head.x, obj_snake_head.y);
var bx = x + lengthdir_x(0, dir);
var by = y + lengthdir_y(0, dir);

var bullet = instance_create_layer(bx, by, "Instances", obj_enemy_bullet);
bullet.direction = dir;
bullet.image_angle = dir;

can_attack = true;
