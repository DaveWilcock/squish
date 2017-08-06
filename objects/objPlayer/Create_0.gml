/// @description Sets up some globals
// You can write your code in this editor

max_hspeed_ = 3;
hspeed_ = 0;
h_sneak_modifier = 0.3;
vspeed_ = 0;
gravity_ = 0.8;
jump_height_ = -12;
acceleration_ = 1;
friction_ = 0.3;
wall_jump_height_modifier_ = 0.8;
wall_jump_rebound_ = 18;
sleep_timer_ = 0;

keyboard_set_map(ord("W"), vk_up);
keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("S"), vk_down);
keyboard_set_map(ord("D"), vk_right);