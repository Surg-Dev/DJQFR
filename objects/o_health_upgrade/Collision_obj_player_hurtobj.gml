/// @description Insert description here
// You can write your code in this editor
if (o_player.coins >= 20) {
	o_player.coins -= 20;
	o_player.hpup = true
	o_player.max_health = 200;
	o_player.phealth = 200;
	instance_destroy(self)
}