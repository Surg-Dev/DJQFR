if (instance_exists(o_player) && point_distance(x, y, o_player.x, o_player.y) > 1) {
    // Get the direction from the enemy to the player
    var dir = point_direction(x, y, o_player.x, o_player.y);
    var dist = point_distance(x, y, o_player.x, o_player.y);

    // Calculate the angle difference between the enemy's direction and the player's position
    var angle_diff = angle_difference(dir, image_angle);
	

    // Set the enemy sprite based on the direction it's facing
    if (angle_diff >= -45 && angle_diff <= 45) {
        sprite_prefix = "side";
        image_xscale = 1; // Facing right
    } else if (angle_diff > 45 && angle_diff <= 135) {
        sprite_prefix = "back";
    } else if (angle_diff < -45 && angle_diff >= -135) {
        sprite_prefix = "front";
    } else {
        sprite_prefix = "side";
        image_xscale = -1; // Facing left
    }

    // Decrease lunge cooldown
    if (lunge_cooldown > 0) {
        lunge_cooldown--;
    }

    // State machine
    switch (state) {
		
        case "idle":
            if (dist <= follow_distance) {
                state = "following";
				hspeed = lengthdir_x(move_speed, dir); 
                vspeed = lengthdir_y(move_speed, dir);
            }
            sprite_index = asset_get_index("s_boss2_idle_" + sprite_prefix);
		
            break;

        case "following":
            // Update the enemy's velocity based on the direction and speed
            hspeed = lengthdir_x(move_speed, dir); 
            vspeed = lengthdir_y(move_speed, dir);

            // Check if the boss can lunge and is not on cooldown
            if (lunge_cooldown <= 0 && dist > min_lunge_distance) {
                state = "lunging";
				hspeed = lengthdir_x(lunge_speed, dir);
				vspeed = lengthdir_y(lunge_speed, dir);
                lunge_cooldown = lunge_cooldown_max;
            }
            sprite_index = asset_get_index("s_boss2_follow_" + sprite_prefix);
            break;

        case "lunging":
            // Update the enemy's velocity based on the direction and increased lunging speed
            hspeed = lengthdir_x(lunge_speed, dir);
            vspeed = lengthdir_y(lunge_speed, dir);

            // Check if the lunging animation is finished
            if (image_index >= image_number - 1) {
                state = "following";
				hspeed = lengthdir_x(move_speed, dir);
				vspeed = lengthdir_y(move_speed, dir);
            }
            sprite_index = asset_get_index("s_boss2_lunge_" + sprite_prefix);
            break;
    }

    // Set the animation speed
    image_speed = (state == "lunging") ? 0.5 : 0.2; // Adjust animation speeds as needed
} else {
    // Stop the enemy's movement if the player doesn't exist
    hspeed = 0;
    vspeed = 0;
}
