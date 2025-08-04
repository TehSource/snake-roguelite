/// @description Snake Head


// --- Components ---
init_health_component(10); // Gives the head 10 hp and 10 max_hp
init_path_buffer(200);

// --- Control Scheme Manager ---
control_mode = 0; // 0: Instant Mouse, 1: Key Steering
mode_names = ["Instant Mouse Aim", "Classic Key Steering"];

// --- Core Movement ---
move_speed = 2.5;
turn_speed = 5;
direction = image_angle;
dead_zone_radius = 16;

// --- Visuals ---
is_flashing = false; // For the damage flash effect

// --- System ---
window_set_cursor(cr_none);

// --- Snake Body Management ---
body_segments = [];
tail = instance_create_layer(x, y, "Instances", obj_snake_tail);
tail.target = self;
snake_add_segment(id);
