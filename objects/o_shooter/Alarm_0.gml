var bullet = instance_create_layer(x, y, layer, o_bullet2); 
with (bullet)
{
   direction = point_direction(x, y, o_player.x, o_player.y); 
   speed = 3;
}
alarm[0] = room_speed; 