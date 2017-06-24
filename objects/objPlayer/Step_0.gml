/// @description Insert description here
// You can write your code in this editor

var hinput =  keyboard_check(vk_right) - keyboard_check(vk_left);
var hspeed_modifier_ = 0;

// If we are moving left or right, flip the image
if (hinput != 0) {
	image_xscale = sign(hinput);
	hspeed_ += hinput * acceleration_;
	hspeed_ = clamp(hspeed_, -max_hspeed_, max_hspeed_);
} else {
	hspeed_ = lerp(hspeed_, 0, friction_);
}

// Jump mechanics
if (keyboard_check_pressed(vk_space) && place_meeting(x, y + 1, objFloorTile1)) {
	// Standing on the floor jump
	vspeed_ = jump_height_;
} else if (keyboard_check_pressed(vk_space) && place_meeting(x - 1, y, objFloorTile1)) {
	// Walljump left - height modifer and rebound actions
	vspeed_ = jump_height_ * wall_jump_height_modifier_;
	hspeed_ = wall_jump_rebound_;
	image_xscale = 1;
} else if (keyboard_check_pressed(vk_space) && place_meeting(x + 1, y, objFloorTile1)) {
	// Walljump right - height modifer and rebound actions
	vspeed_ = jump_height_ * wall_jump_height_modifier_;
	hspeed_ = -wall_jump_rebound_;
	image_xscale = -1;
}

vspeed_ += gravity_;

// Squish the player if we're pressing down
if (keyboard_check(vk_down) && place_meeting(x, y + 1, objFloorTile1)) {
	sprite_index = spr_player_squish;
} else {
	sprite_index = spr_player;
}


if (place_meeting(x+hspeed_,y, objFloorTile1)) {
	while (!place_meeting(x + sign(hspeed_), y, objFloorTile1)) {
		x += sign(hspeed_);
	}
	hspeed_ = 0;
}

x += hspeed_;

if (place_meeting(x, y + vspeed_, objFloorTile1)) {
	while (!place_meeting(x, y + sign(vspeed_), objFloorTile1)) {
		y += sign(vspeed_);
	}
	vspeed_ = 0;
}

y += vspeed_;