 target = o_player;
move_speed = 1; // Adjust the speed as needed
// State variables
state = "idle";
move_speed = 1; // Adjust the normal move speed as needed
lunge_speed = 2; // Adjust the lunging speed as needed
lunge_cooldown = 0;
lunge_cooldown_max = room_speed * 3; // 3 seconds between lunges (adjust as needed)
