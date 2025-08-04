// Make sure the player exists before trying to follow
if (!instance_exists(obj_snake_head)) { exit; }

// Get the active camera
var _cam = view_camera[0];

// Get the camera's current position and the player's position
var _cam_x = camera_get_view_x(_cam);
var _cam_y = camera_get_view_y(_cam);
var _player_x = obj_snake_head.x;
var _player_y = obj_snake_head.y;

// Smoothly move the camera towards the player using linear interpolation (lerp)
// A lerp amount of 0.1 means it moves 10% of the distance each frame.
var _new_cam_x = lerp(_cam_x, _player_x - (camera_get_view_width(_cam) / 2), 0.1);
var _new_cam_y = lerp(_cam_y, _player_y - (camera_get_view_height(_cam) / 2), 0.1);

// Set the camera's new position
camera_set_view_pos(_cam, _new_cam_x, _new_cam_y);