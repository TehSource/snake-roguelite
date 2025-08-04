// Get the active camera
var _cam = view_camera[0];

// Desired camera position centered on the player
var _target_x = obj_snake_head.x - (camera_get_view_width(_cam) / 2);
var _target_y = obj_snake_head.y - (camera_get_view_height(_cam) / 2);

// Clamp to room bounds
_target_x = clamp(_target_x, 0, room_width - camera_get_view_width(_cam));
_target_y = clamp(_target_y, 0, room_height - camera_get_view_height(_cam));

// Smoothly move the camera
var _new_cam_x = lerp(camera_get_view_x(_cam), _target_x, 0.1);
var _new_cam_y = lerp(camera_get_view_y(_cam), _target_y, 0.1);

camera_set_view_pos(_cam, _new_cam_x, _new_cam_y);
