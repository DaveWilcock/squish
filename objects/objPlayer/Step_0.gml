/// @description Insert description here
// You can write your code in this editor

move_wrap(true, false, 0);

var bolRightInput = keyboard_check(vk_right);
var bolLeftInput = keyboard_check(vk_left);
var bolJumpInput = keyboard_check_pressed(vk_space);

var bolMove = bolRightInput - bolLeftInput;

fltHorizontalSpeed = bolMove * fltWalkSpeed;
fltVerticalSpeed = fltVerticalSpeed + fltGravity;

if (bolMove != 0) {
	image_xscale = sign(bolMove);
}

if (place_meeting(x, y+1, objFloorTile1) && bolJumpInput) {
	fltVerticalSpeed = -fltDefaultJumpHeight;
}

if (place_meeting(x+fltHorizontalSpeed,y, objFloorTile1)) {

	while (!place_meeting(x+sign(fltHorizontalSpeed),y,objFloorTile1)) {
		x = x + sign(fltHorizontalSpeed);
	}
	fltHorizontalSpeed = 0;
}

x = x + fltHorizontalSpeed;

if (place_meeting(x,y+fltVerticalSpeed, objFloorTile1)) {

	while (!place_meeting(x,y+sign(fltVerticalSpeed),objFloorTile1)) {
		y = y + sign(fltVerticalSpeed);
	}
	fltVerticalSpeed = 0;
}

y = y + fltVerticalSpeed;