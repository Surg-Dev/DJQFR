/// @description provided font set

map_string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!?.,$ "

bitmap_font = font_add_sprite_ext(spr_fontset_sep, map_string, false, 0)

draw_set_font(bitmap_font)

// IDK why im putting this here

audio_play_sound(music_menu,1,true);