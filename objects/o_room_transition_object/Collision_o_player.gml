// This uses the variable definition to go to a specific room.
// Set it when you place the object *in* the room.

	
	room_goto(room_target)
	var _x = 0;
	var _y = 0;
	switch(room_anchor){
		case 0:
			_x = 272
			_y = 16;
			break;
		case 1:
			_x = 512
			_y = 144;
			break;
		case 2:
			_x = 272
			_y = 272;
			break;
		case 3:
			_x = 16
			_y = 144;
			break;
		
	}
	o_player.x = _x
	o_player.y = _y
	//o_camera.x = player_spawn_x
	//o_camera.y = player_spawn_y
