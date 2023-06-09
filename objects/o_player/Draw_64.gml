/// @description Insert description here
// You can write your code in this editor
// ------ Variables for inventory placement
gui_width = display_get_gui_width()
gui_height = display_get_gui_height()
spr_width_b = sprite_get_width(spr_inventory_bar)
spr_height_b = sprite_get_height(spr_inventory_bar)
spr_scale = 3

//draw_text(200,200,room_get_name(room))

//Draw Healthbar
draw_healthbar((hpup) ? 1475 : 1675,25,1875,75, 
100 * (phealth/max_health), c_white, c_red, c_red,1, true, true)

// Draw Inventory Bar
if (showCollectibles) {
	// Draw Coin Counter
	draw_sprite_stretched(spr_gold_coin,1, 10, 10, 75, 75) 
	draw_text_transformed(105, 5, coins, 4, 4, 0)
	// Draw inventory Bar
	draw_sprite_stretched(
		spr_inventory_bar,
		1,
		(gui_width/2) - (spr_width_b * 0.5 * spr_scale),
		(gui_height - gui_height/8) - (spr_height_b * 0.5 * spr_scale),
		spr_width_b * spr_scale,
		spr_height_b * spr_scale
	)
	
	
	// Draw Items to Inventory
	
	for (i = 0; i < ds_list_size(inventoryItems); i++) {
		draw_sprite_stretched(
			ds_list_find_value(inventoryItems, i),
			1,
			(gui_width/2) - (spr_width_b * 0.5 * spr_scale) + (8 * spr_scale) + (i * (42 + sprite_get_width(ds_list_find_value(inventoryItems, i)))),
			(gui_height - gui_height/8) - (spr_height_b * 0.5 * spr_scale) + (8 * spr_scale),
			sprite_get_width(ds_list_find_value(inventoryItems, i)) * spr_scale,
			sprite_get_height(ds_list_find_value(inventoryItems, i)) * spr_scale
		)
	}
	
}



	