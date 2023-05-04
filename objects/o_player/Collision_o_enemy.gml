/// @description Insert description here
// You can write your code in this editor
if (alarm[3] == -1) {
	
	phealth = phealth - 20
	if(phealth < 0) {
		game_restart()
	}
	alarm[3] = 90
	
	
}