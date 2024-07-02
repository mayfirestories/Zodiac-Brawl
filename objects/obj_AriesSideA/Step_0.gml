if(global.game_paused){
		exit;
}


if (instance_exists(parent_instance)) {
    x = parent_instance.x + parent_instance.sprite_width;
    y = parent_instance.y;
	
	//Collision with another player--------------------------------------------
	if(place_meeting(x,y,obj_Parent_player)&&!place_meeting(x,y,parent_instance)){
		var dir = image_xscale;
		with(obj_Parent_player) {
			Can_Settings.healthPoints += 20;
			launchCalculator.p = Can_Settings.healthPoints;
			launchCalculator.d = 20;
			launchCalculator.s = 1.1;
			launchCalculator.b = 50;
			launchCalculator.r = 1;
			Can_Settings.getGot = true;
			Can_Settings.attackDir = dir;
		}

	instance_destroy();
	}
} else{
	instance_destroy();	
}
//Timer to destroy the the attack object
if(alarm[0]==-1){
	alarm[0] = 40;	
}
if(alarm[0]==0){
	instance_destroy();	
}