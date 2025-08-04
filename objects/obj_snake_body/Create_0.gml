// This will be the ID of the object we are following (set by the head)
target = noone;

// This is how far behind the target we should be.
// Play with this value to change the spacing of your snake!
follow_distance = 7;

// Ensure direction is initialized
direction = image_angle;

//flashing
is_flashing = false;

// --- Components --
init_path_buffer(200);
init_health_component(10);