/// @description Insert description here
// You can write your code in this editor
var hori = keyboard_check(vk_right) - keyboard_check(vk_left);
var vert = keyboard_check(vk_down) - keyboard_check(vk_up);


var dx = hspd * hori;
var dy = vspd * vert;

#region Sprite Selection Code

//TODO: Add shooting interrupts

// If the player is not moving, then determine the idle animation to select from
if (dx==0 and dy==0){
	switch (last_sprite){
		case spr_player_walk_side:
			sprite_index = spr_player_idle_side;
			break;
		case spr_player_walk_diagup:
			sprite_index = spr_player_idle_diagup;
			break;
		case spr_player_walk_up:
			sprite_index = spr_player_idle_up;
			image_xscale = 1;
			break;
		case spr_player_walk_diagdown:
			sprite_index = spr_player_idle_diagdown;
			break;
		case spr_player_walk_down:
			sprite_index = spr_player_idle_down;
			image_xscale = 1;
			break;
		default:
			// Note: be weary if there are other sprites, this may be redundant
			sprite_index = last_sprite
	}
} else {
	//Otherwise, quickly calculate where the player is going and move on that
	var projected_angle = point_direction(x,y,x+dx,y+dy);
	debug_angle = projected_angle

	switch (int64(projected_angle)){
		case 0:
		sprite_index = spr_player_walk_side;
		image_xscale = 1;
		break;
		case 90:
		sprite_index = spr_player_walk_up;
		image_xscale = 1;
		break;
		case 180:
		sprite_index = spr_player_walk_side;
		image_xscale = -1;	
		break;
		case 270:
		sprite_index = spr_player_walk_down;
		image_xscale = 1;
		break;
		default:
			if (projected_angle < 90) {
				sprite_index = spr_player_walk_diagup;
				image_xscale = 1;
			} else if (projected_angle < 180){
				sprite_index = spr_player_walk_diagup;
				image_xscale = -1;
			} else if (projected_angle < 270){
				sprite_index = spr_player_walk_diagdown;
				image_xscale = -1;
			} else {
				sprite_index = spr_player_walk_diagdown;
				image_xscale = 1;
			}
	}
}

last_sprite = sprite_index
image_speed = 1
#endregion


// Speed normalization when moving diagonally
if (dx!=0 and dy!=0){
	dx = dx / sqrt(2)
	dy = dy / sqrt(2)
}

move_and_collide(dx, dy, o_solid)

if(phealth == 0) {
	room_goto(reset_screen)
}