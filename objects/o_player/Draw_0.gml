/// @description draw Inventory to scree
// You can write your code in this editor
//draw_self()

if (alarm[4] == -1){
	draw_self()
} else {
	draw_sprite_ext(sprite_index, image_index,x,y,image_xscale,1,0, (alarm[4] % 2 == 0 ? c_white : c_aqua), 1)	
}