var bullet = instance_create_layer(x+16, y, layer, o_bullet3); 
var bullet2 = instance_create_layer(x-16, y, layer, o_bullet3); 
var bullet3 = instance_create_layer(x, y+16, layer, o_bullet3); 
var bullet4 = instance_create_layer(x, y-16, layer, o_bullet3); 
with (bullet)
{
   direction = 0;
   speed = 3;
}
with (bullet2)
{
   direction = 180;
   speed = 3;
}
with (bullet3)
{
   direction = 90;
   speed = 3;
}
with (bullet4)
{
   direction = 270;
   speed = 3;
}
alarm[0] = room_speed*2; 