/// @description Insert description here
// You can write your code in this editor
hspd = 3
vspd = 3

// health variables
max_health = 100
phealth = 100
coins = 0

// inventory = ds_map_create()
inventoryItems = ds_list_create()

showCollectibles = true



// Stores the last sprite to know which idle to use.
last_sprite = spr_player_idle_down

debug_angle = 0;

// Shorthand for direction, 0 is left, going counterclockwise until down-left 7
self_direction = 6;

debug_timer = 0;

shotgun = true;

dd = 0;