/// @description Alarm for Shooting
var _x = 0;
var _y = 0;
var _angle = 0;
switch(self_direction){
	case 0:
	_x=16;
	_y=-1;
	break;
	case 1:
	_x=14;
	_y=-11;
	_angle=45;
	break;
	case 2:
	_x=6;
	_y=-16;
	_angle=90;
	break;
	case 3:
	_x=-17;
	_y=-11
	_angle=135;
	break;
	case 4:
	_x = -20
	_y = -1;
	_angle = 180;
	break;
	case 5:
	_x = -12;
	_y = 11;
	_angle = 225;
	break;
	case 6:
	_x = -6;
	_y = 12;
	_angle = 270;
	break;
	case 7:
	_x = 8;
	_y = 11;
	_angle = 315;
	break;
}
with(instance_create_layer(x+_x, y+_y, layer, o_bullet)){
		speed = 5
		direction = _angle
}