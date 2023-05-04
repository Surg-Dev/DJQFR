if (o_player.alarm[3] == -1) {
	
	o_player.phealth = o_player.phealth - 20
	if(o_player.phealth < 0) {
		game_restart()
	}
	o_player.alarm[3] = 90
}