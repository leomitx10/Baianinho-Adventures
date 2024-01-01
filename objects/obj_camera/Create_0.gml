/*
target_ = obj_player;
width_ = camera_get_view_width(view_camera[0]);
height_ =  camera_get_view_height(view_camera[0]);
*/

resolution_width = 1280;
resolution_height = 720;
resolution_scale = 2;

global.view_width = resolution_width / resolution_scale;
global.view_height = resolution_height / resolution_scale;

view_target = obj_player;
view_speed = 0.1;

window_set_size(global.view_width * resolution_scale, global.view_height * resolution_scale);
surface_resize(application_surface, global.view_width * resolution_scale, global.view_height * resolution_scale);
display_set_gui_size(global.view_width, global.view_height);
