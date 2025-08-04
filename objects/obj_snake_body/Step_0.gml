if (!instance_exists(target)) {
    instance_destroy();
    exit;
}

// --- Read from the Target's Circular Buffer ---
var _target_head = target.path_head;
var _target_max_len = target.max_path_length;

// Calculate the index we want to read from, safely handling wrap-around
var _read_index = (_target_head - follow_distance + _target_max_len) % _target_max_len;
var _target_pos = target.path[_read_index];

if (is_array(_target_pos))
{
    x = _target_pos[0];
    y = _target_pos[1];
    direction = _target_pos[2];
    image_angle = direction;
}

// Always update our own history, even if we haven't moved yet.
update_path_history();
// --- Destruction Check ---
if (hp <= 0)
{
    // Call the global script to handle our destruction
    if (instance_exists(obj_snake_head))
    {
        // We pass it the head object and our own id
        snake_destroy_segment(obj_snake_head, id);
    }
    exit; // Stop running code for this destroyed instance
}
