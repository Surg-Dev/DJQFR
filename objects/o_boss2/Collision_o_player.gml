if (alarm[3] == -1) {
	
	o_player.phealth = o_player.phealth - 20
	if(o_player.phealth < 0) {
		game_restart()
	}
	alarm[3] = 90
	
	
}