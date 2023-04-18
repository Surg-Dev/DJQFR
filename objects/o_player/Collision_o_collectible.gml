/// @description pickups
// You can write your code in this editor

var key = other.object_index;
var value = other.value;

if (ds_map_exists(inventory, key)){
	value += ds_map_find_value(inventory, key);
	ds_map_replace(inventory, key, value)
} else {
	ds_map_add(inventory, key, value);
}

instance_destroy(other);

