/// @description Insert description here
// You can write your code in this editor
var hori = input_check("right") - input_check("left");
var vert = input_check("down") - input_check("up");

if (alarm[1]!= -1 ){
	debug_timer+=1
}
if (alarm[1] != -1 and image_index == 3){
	show_debug_message(debug_timer)
}


var dx = hspd * hori;
var dy = vspd * vert;

//#region
//if (input_check_double_pressed("left",,10)){
//	dx=dx*2
//}
//dd = dx
//#endregion


#region Shooting
if (input_check_pressed("shoot") and alarm[1] == -1){
	switch(self_direction){
		case 0:
			sprite_index = spr_player_shoot_side;
			break;
		case 1:
			sprite_index = spr_player_shoot_diagup;
			break;
		case 2:
			sprite_index = spr_player_shoot_up;
			break;
		case 3:
			sprite_index = spr_player_shoot_diagup;
			break;			
		case 4:
			sprite_index = spr_player_shoot_side;
			break;
		case 5:
			sprite_index = spr_player_shoot_diagdown;
			break;
		case 6:
			sprite_index = spr_player_shoot_down;
			break;
		case 7:
			sprite_index = spr_player_shoot_diagdown;
			break;
	}
	if (shotgun){
		audio_play_sound(snd_shotgun_click,2,false,,,random_range(.95,1.05));
	}
	alarm[1] = 16;
	alarm[2] = 12;
	image_index = 0;
}
#endregion



#region Sprite Selection Code

// If the player is not moving, then determine the idle animation to select from
// The player is halted when shooting.
if (alarm[1] == -1){
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
			self_direction = 0;
			break;
			case 90:
			sprite_index = spr_player_walk_up;
			image_xscale = 1;
			self_direction = 2;
			break;
			case 180:
			sprite_index = spr_player_walk_side;
			image_xscale = -1;
			self_direction = 4;
			break;
			case 270:
			sprite_index = spr_player_walk_down;
			image_xscale = 1;
			self_direction = 6;
			break;
			default:
				if (projected_angle < 90) {
					sprite_index = spr_player_walk_diagup;
					image_xscale = 1;
					self_direction = 1;
				} else if (projected_angle < 180){
					sprite_index = spr_player_walk_diagup;
					image_xscale = -1;
					self_direction = 3;
				} else if (projected_angle < 270){
					sprite_index = spr_player_walk_diagdown;
					image_xscale = -1;
					self_direction = 5;
				} else {
					sprite_index = spr_player_walk_diagdown;
					image_xscale = 1;
					self_direction = 7;
				}
		}
	}

	last_sprite = sprite_index
} else {
	dx = 0;
	dy = 0;
}
image_speed = 1
#endregion


// Speed normalization when moving diagonally
if (dx!=0 and dy!=0){
	dx = dx / sqrt(2)
	dy = dy / sqrt(2)
}

// Interact Logic
if (input_check_pressed("interact") and alarm[0] == -1){
	var __x = 0;
	var __y = 0;
	switch(self_direction){
		case 0:
		__x = bbox_right+8
		__y = bbox_top+4
		break;
		case 1:
		__x = bbox_right+8
		__y = bbox_top-8
		break;
		case 2:
		__x = bbox_left+8
		__y = bbox_top-8
		break;
		case 3:
		__x = bbox_left-8
		__y = bbox_top-8
		break;
		case 4:
		__x = bbox_left-8
		__y = bbox_top+4
		break;
		case 5:
		__x = bbox_left-8
		__y = bbox_bottom+8
		break;
		case 6:
		__x = bbox_left+8
		__y = bbox_bottom+8
		break;
		case 7:
		__x = bbox_right+8
		__y = bbox_bottom+8
		break;
	}
	instance_create_layer(__x, __y,layer,o_interact_collider)
	alarm[0] = 4;
}


// Movement
move_and_collide(dx, dy, o_solid)

if(phealth == 0) {
	room_goto(reset_screen)
}