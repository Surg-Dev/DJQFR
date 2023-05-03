if (instance_exists(o_player)) {
    // Get the direction from the enemy to the player
    var dir = point_direction(x, y, o_player.x, o_player.y);

    // Decrease lunge cooldown
    if (lunge_cooldown > 0) {
        lunge_cooldown--;
    }

    // State machine
    switch (state) {
        case "idle":
            // Update the enemy's velocity based on the direction and speed
            hspeed = lengthdir_x(move_speed, dir);
            vspeed = lengthdir_y(move_speed, dir);

            // Check if the boss can lunge and is not on cooldown
            if (lunge_cooldown <= 0) {
                state = "lunging";
                sprite_index = s_boss2_lunge; // Change this to your lunging animation sprite
                image_speed = 0.5; // Adjust animation speed as needed
                lunge_cooldown = lunge_cooldown_max;
            }
            break;

        case "lunging":
            // Update the enemy's velocity based on the direction and increased lunging speed
            hspeed = lengthdir_x(lunge_speed, dir);
            vspeed = lengthdir_y(lunge_speed, dir);

            //  Check if the lunging animation is finished
            if (image_index >= image_number - 1) {
                state = "idle";
                sprite_index = s_boss2_idle; // Change this to your idle animation sprite
                image_speed = 0.2; // Adjust animation speed as needed
            }
            break;
    }
} else {
    // Stop the enemy's movement if the player doesn't exist
    hspeed = 0;
    vspeed = 0;
}
 