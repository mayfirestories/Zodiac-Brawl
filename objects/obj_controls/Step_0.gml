/// @description Insert description here
// You can write your code in this editor
pause = keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_enter);

if(pause) {
	global.game_paused = !global.game_paused;	
}

if(global.game_paused&&!instance_exists(obj_reset_button)){
	var cam = view_camera[0];
	var start = instance_create_layer(camera_get_view_width(cam)/2,camera_get_view_height(cam)/2,"Instances",obj_reset_button);
}
if(!global.game_paused) { 
	instance_destroy(obj_reset_button);
}



