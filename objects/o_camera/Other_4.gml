/// @description Insert description here
// You can write your code in this editor
view_enabled = true;
view_visible[0] = true;

if (instance_exists(o_player)){
	var _x = clamp(o_player.x - view_width/2, 0, room_width-view_width);
	var _y = clamp(o_player.y - view_height/2, 0, room_height-view_height);	
	camera_set_view_pos(view_camera[0], _x, _y);
}