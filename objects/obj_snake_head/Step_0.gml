

// --- Game Over Check ---
if (hp <= 0) { game_restart(); }

// --- Hybrid Speed Control ---
var _current_move_speed = move_speed;
if (keyboard_check(vk_shift)) {
    _current_move_speed = move_speed * 0.5;
}

// --- Control Scheme Logic ---
switch (control_mode) {
    case 0: // Instant Mouse Aim
     if (point_distance(x, y, mouse_x, mouse_y) > dead_zone_radius)
        {
            direction = point_direction(x, y, mouse_x, mouse_y);
        }
        break;
    case 1: // Classic Key Steering
        var _turn_input = keyboard_check(ord("A")) - keyboard_check(ord("D"));
        direction += _turn_input * turn_speed;
        break;
}

// --- Universal Movement with Collision ---

// Define the radius for our circular collision shape.
// Half the sprite width is a good starting point.
var _collision_radius = 10;

// Calculate horizontal and vertical speed components
var _hspd = lengthdir_x(_current_move_speed, direction);
var _vspd = lengthdir_y(_current_move_speed, direction);

// --- Horizontal Collision Check ---
// We check for a collision at the next horizontal position using a circular mask.
if (collision_circle(x + _hspd, y, _collision_radius, obj_wall_basic, false, true))
{
    // If a collision is detected, cancel horizontal movement.
    _hspd = 0;
}
// Apply the final horizontal speed (either full speed or 0).
x += _hspd;


// --- Vertical Collision Check ---
// We do the same for the vertical position.
if (collision_circle(x, y + _vspd, _collision_radius, obj_wall_basic, false, true))
{
    // If a collision is detected, cancel vertical movement.
    _vspd = 0;
}
// Apply the final vertical speed (either full speed or 0).
y += _vspd;



// --- Universal Code ---
image_angle = direction;
update_path_history();

// Shooting
if (keyboard_check_pressed(vk_space)) {
    var _spawn_dist = 16;
    var _spawn_x = x + lengthdir_x(_spawn_dist, self.direction);
    var _spawn_y = y + lengthdir_y(_spawn_dist, self.direction);
    var _spit = instance_create_layer(_spawn_x, _spawn_y, "Instances", obj_spit);
    _spit.direction = self.direction;
    _spit.image_angle = self.direction;
}