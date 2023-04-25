/// @description Insert description here
// You can write your code in this editor
// ------ Variables for inventory placement
gui_width = display_get_gui_width()
gui_height = display_get_gui_height()
spr_width_b = sprite_get_width(spr_inventory_bar)
spr_height_b = sprite_get_height(spr_inventory_bar)
spr_scale = 3


//Draw Healthbar
draw_healthbar(1675,25,1875,75, 
100 * (phealth/max_health), c_white, c_red, c_red,1, true, true)


// Draw Inventory Bar
if (showCollectibles) {
	// Draw Coin Counter
	draw_sprite_stretched(spr_gold_coin,1, 10, 10, 75, 75) 
	draw_text_transformed(105, 5, o_player.coins, 4, 4, 0)
	
	draw_sprite_stretched(
		spr_inventory_bar,
		1,
		(gui_width/2) - (spr_width_b * 0.5 * spr_scale),
		(gui_height - gui_height/8) - (spr_height_b * 0.5 * spr_scale),
		spr_width_b * spr_scale,
		spr_height_b * spr_scale
	)
}

// Draw Items to Inventory

	