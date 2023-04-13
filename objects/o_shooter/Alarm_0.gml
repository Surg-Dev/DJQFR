var bullet = instance_create_layer(x, y, layer, o_bullet); // Create a bullet and store its ID in the variable "bullet". We need its ID b/c we want to do a few more things with it.
with (bullet)
{
   direction = point_direction(x, y, o_player.x, o_player.y); // Give the bullet a direction
   speed = 6;
}
alarm[0] = room_speed; // Reset this alarm so the enemy will shoot after 5 more seconds. This will loop.