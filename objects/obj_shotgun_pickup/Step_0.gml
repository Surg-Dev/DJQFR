/// @description Insert description here
// You can write your code in this editor
function sinosc(_min, _max, pos){
	return ((_max - _min)/2  * dsin(pos) + (_max + _min)/2) 	
}

y = y_init + sinosc(-2,2,stepc);
stepc+=5;