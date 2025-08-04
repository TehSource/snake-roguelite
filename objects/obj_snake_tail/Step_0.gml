// Step Event for obj_snake_tail

if (!instance_exists(target)) {
    instance_destroy();
    exit;
}

// --- Read from the Target's Circular Buffer ---
var _target_head = target.path_head;
var _target_max_len = target.max_path_length;

var _read_index = (_target_head - follow_distance + _target_max_len) % _target_max_len;
var _target_pos = target.path[_read_index];

if (is_array(_target_pos))
{
    x = _target_pos[0];
    y = _target_pos[1];
    direction = _target_pos[2];
    image_angle = direction;
}

update_path_history();