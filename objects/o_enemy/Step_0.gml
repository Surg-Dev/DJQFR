// Check if the player object exists
if (instance_exists(o_player) and point_distance(x,y,o_player.x, o_player.y ) < 160) {
    // Get the direction from the enemy to the player
    var dir = point_direction(x, y, o_player.x, o_player.y);

    // Update the enemy's velocity based on the direction and speed
	move_and_collide(lengthdir_x(move_speed, dir), lengthdir_y(move_speed, dir), o_parent_solid)
} else {
    // Stop the enemy's movement if the player doesn't exist
    hspeed = 0;
    vspeed = 0;
}
