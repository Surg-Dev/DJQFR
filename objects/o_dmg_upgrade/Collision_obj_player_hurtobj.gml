/// @description Insert description here
// You can write your code in this editor
if (o_player.coins >= 30) {
	o_player.coins -= 30;
	o_player.damage = true
	instance_destroy(self)
}