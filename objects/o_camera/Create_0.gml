/// @description Insert description here
// You can write your code in this editor
view_width = 1920/6
view_height = 1080/6

window_scale = 6

var scaled_width = view_width*window_scale
var scaled_height =  view_height*window_scale

window_set_size(scaled_width, scaled_height)
alarm[0]=1;

surface_resize(application_surface, scaled_width, scaled_height)