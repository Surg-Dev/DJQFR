/// @description Insert description here
// You can write your code in this editor
var hori = keyboard_check(vk_right) - keyboard_check(vk_left);
var vert = keyboard_check(vk_down) - keyboard_check(vk_up);

var 


var dx = hspd * hori;
var dy = vspd * vert;

move_and_collide(dx, dy, o_solid)