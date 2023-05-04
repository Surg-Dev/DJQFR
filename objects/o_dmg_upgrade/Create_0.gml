/// @description Insert description here
// You can write your code in this editor
if (instance_exists(o_player)){
	if (o_player.damage == true){
		instance_destroy(self)
	}
}