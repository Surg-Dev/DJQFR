/// @description pickups
// You can write your code in this editor

var key = other.object_index;
var value = other.value;

//add to our map when picked up

if (ds_map_exists(inventory, key)){
	value += ds_map_find_value(inventory, key);
	ds_map_replace(inventory, key, value)
} else {
	ds_map_add(inventory, key, value);
	ds_list_add(inventoryItems, key)
}


instance_destroy(other);

