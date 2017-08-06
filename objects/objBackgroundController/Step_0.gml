/// @description Parallax scrolling backgrounds

var bg1 = layer_get_id("Backgrounds_1");
var bg2 = layer_get_id("Backgrounds_3");

layer_x(bg1, lerp(0, camera_get_view_x(view_camera[0]), .5));
layer_x(bg2, lerp(0, camera_get_view_x(view_camera[0]), .8));