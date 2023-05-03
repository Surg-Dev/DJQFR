// Check if the player object exists
if (instance_exists(o_player)) {
    // Get the direction from the enemy to the player
    var dir = point_direction(x, y, o_player.x, o_player.y);

    // Update the enemy's velocity based on the direction and speed
    hspeed = lengthdir_x(move_speed, dir);
    vspeed = lengthdir_y(move_speed, dir);
} else {
    // Stop the enemy's movement if the player doesn't exist
    hspeed = 0;
    vspeed = 0;
}
