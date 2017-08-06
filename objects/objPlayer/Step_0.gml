/// @description Insert description here
// You can write your code in this editor

// hinput is the check digit that indicates if we are moving left or right
var hinput =  keyboard_check(vk_right) - keyboard_check(vk_left);
var vspeed_modifier_ = 0;
var hspeed_modifier_ = 0;

// If we are moving left or right, flip the image
if (hinput != 0) {
	image_xscale = sign(hinput);
	hspeed_ += hinput * acceleration_;
	hspeed_ = clamp(hspeed_, -max_hspeed_, max_hspeed_);
	sprite_index = spr_player_walk;
	sleep_timer_ = 0;
} else {
	hspeed_ = lerp(hspeed_, 0, friction_);
	sleep_timer_ += 1;
	if (sleep_timer_ > 0 && sleep_timer_ > (fps * 20)) {
		sprite_index = spr_player_sleep;
	} else {
		sprite_index = spr_player;
	}
}

// Jump mechanics
if (keyboard_check_pressed(vk_space) && place_meeting(x, y + 1, objFloorTile1)) {
	// Standing on the floor, a normal jump
	vspeed_ = jump_height_;
	sleep_timer_ = 0;
} else {
	// Walljump mechanics
	// Initiate another jump, giving it less vertical movement with a modifier
	// ... add some horizontal rebound
	// ... and finally ensure the chracater image is flipped
	if (
		keyboard_check_pressed(vk_space) && place_meeting(x - 1, y, objFloorTile1) ||
		keyboard_check_pressed(vk_space) && place_meeting(x + 1, y, objFloorTile1)
	) {
		sleep_timer_ = 0;
		vspeed_ = jump_height_ * wall_jump_height_modifier_;
		hspeed_ = -wall_jump_rebound_;
		//image_xscale = -1;
	}
}

vspeed_ += gravity_;

// Horizontal collision

if (place_meeting(x + hspeed_, y, objFloorTile1)) {
	while (!place_meeting(x + sign(hspeed_), y, objFloorTile1)) {
		x += sign(hspeed_);
	}
	hspeed_ = 0;
}

x += hspeed_;

// Vertical collision

if (place_meeting(x, y + vspeed_, objFloorTile1)) {
	while (!place_meeting(x, y + sign(vspeed_), objFloorTile1)) {
		y += sign(vspeed_);
	}
	vspeed_ = 0;
}

// If we are falling, and we are against a wall and pressing the key towards the wall
// we want to slow our vertical speed, and do some sprite changes
if (vspeed_ > 0) {
	if (place_meeting(x + 1, y, objFloorTile1) && keyboard_check(vk_right)) {
		sprite_index = spr_player_wall_right;
		vspeed_ = 1.2;
	} else if (place_meeting(x - 1, y, objFloorTile1) && keyboard_check(vk_left)) {
		sprite_index = spr_player_wall_right;
		image_xscale = -1;
		vspeed_ = 1.2;
	}
}

y += vspeed_;