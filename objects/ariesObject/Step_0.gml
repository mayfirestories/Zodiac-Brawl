//Pause logic----------------------
if(global.game_paused){ exit; }
//--------------------------------

//Si te sales out off bound, you die--------------
if(x>room_width || x<0 || y>room_height || y<0) {
	instance_destroy();
}
//------------------------------------------------

//Controls----------------------------------------
keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));
keyJump = keyboard_check_pressed(vk_space);
rangedAttack = mouse_check_button_pressed(mb_right);
meleeAttack = mouse_check_button_pressed(mb_left);
//------------------------------------------------------

P1Settings.isGrounded = place_meeting(x,y+1,floorObject);

P1Settings.movement = keyRight - keyLeft;

P1Settings.hsp = P1Settings.movement * P1Settings.movSpd;

P1Settings.vsp += P1Settings.grav;

//Looking Direction--------------- Later work with sprites here
if (P1Settings.movement !=0 && P1Settings.isGrounded){
	image_xscale = P1Settings.movement;
}
//---------------------------------------------------------------------------

//Reset Special Attack -------------------------------------------
if (alarm[0]==0){
	P1Settings.canShoot = true;
}
//------------------------------------------------------------------------------------------------------
//Normal Attacks ----------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------
		//UP Air -------------------------------------------------------------------------------------
		if(meleeAttack && keyUp && !P1Settings.isGrounded && P1Settings.canShoot) {
			P1Settings.canShoot = false;
			alarm[0] = 60;
			var sword1 = instance_create_layer(x , y-sprite_height, "Instances", obj_AriesUpAir);
			sword1.image_xscale *= image_xscale;
			sword1.image_blend = c_black;
			sword1.parent_instance = id;
	
		} else
		//---------------------------------------------------------------------------------------------------
	
		//Down Air -------------------------------------------------------------------------------------
		if(meleeAttack && keyDown && !P1Settings.isGrounded && P1Settings.canShoot) {
			P1Settings.canShoot = false;
			alarm[0] = 60;
			var sword2 = instance_create_layer(x , y+sprite_height, "Instances", obj_AriesDownAir);
			sword2.image_xscale *= image_xscale;
			sword2.image_blend = c_black;
			sword2.parent_instance = id;
	
		} else
		//---------------------------------------------------------------------------------------------------
	
		//Forward Air -------------------------------------------------------------------------------------
		if(meleeAttack && ((image_xscale>0&&keyRight) || (image_xscale<0&&keyLeft)) && !P1Settings.isGrounded && P1Settings.canShoot) {
			P1Settings.canShoot = false;
			alarm[0] = 60;
			var sword3 = instance_create_layer(x+sprite_width , y, "Instances", obj_AriesFAir);
			sword3.image_xscale *= image_xscale;
			sword3.image_blend = c_black;
			sword3.parent_instance = id;
	
		} else
		//Back Air -------------------------------------------------------------------------------------
		if(meleeAttack && ((image_xscale<0&&keyRight) || (image_xscale>0&&keyLeft)) && !P1Settings.isGrounded && P1Settings.canShoot) {
			P1Settings.canShoot = false;
			alarm[0] = 60;
			var sword4 = instance_create_layer(x-sprite_width , y, "Instances", obj_AriesBAir);
			sword4.image_xscale *= image_xscale;
			sword4.image_blend = c_black;
			sword4.parent_instance = id;
	
		} else
		//Neutral Air -------------------------------------------------------------------------------------
		if(meleeAttack && !P1Settings.isGrounded && P1Settings.canShoot) {
			P1Settings.canShoot = false;
			alarm[0] = 60;
			var sword5 = instance_create_layer(x+sprite_width , y, "Instances", obj_AriesNAir);
			sword5.image_xscale *= image_xscale;
			sword5.image_blend = c_black;
			sword5.parent_instance = id;
	
		} else
		//UP A -------------------------------------------------------------------------------------
		if(meleeAttack && keyUp && P1Settings.isGrounded && P1Settings.canShoot) {
			P1Settings.canShoot = false;
			alarm[0] = 60;
			var sword6 = instance_create_layer(x, y-sprite_height, "Instances", obj_AriesUpA);
			sword6.image_xscale *= image_xscale;
			sword6.parent_instance = id;
	
		} else
		//Down A -------------------------------------------------------------------------------------
		if(meleeAttack && keyDown && P1Settings.isGrounded && P1Settings.canShoot) {
			P1Settings.canShoot = false;
			alarm[0] = 60;
			var sword7 = instance_create_layer(x, y+sprite_height, "Instances", obj_AriesDownA);
			sword7.image_xscale *= image_xscale;
			sword7.parent_instance = id;
			sword7.image_yscale *= 0.5;
	
		} else
		//Side A -------------------------------------------------------------------------------------
		if(meleeAttack && (keyLeft||keyRight) && P1Settings.isGrounded && P1Settings.canShoot) {
			P1Settings.canShoot = false;
			alarm[0] = 60;
			var sword8 = instance_create_layer(x+sprite_width , y, "Instances", obj_AriesSideA);
			sword8.image_xscale *= image_xscale;
			sword8.parent_instance = id;
	
		} else
		//Neutral A  -------------------------------------------------------------------------------------
		if(meleeAttack && P1Settings.canShoot) {
			P1Settings.canShoot = false;
			alarm[0] = 60;
			var sword9 = instance_create_layer(x+sprite_width , y, "Instances", obj_AriesNeutralA);
			sword9.image_xscale *= image_xscale;
			sword9.parent_instance = id;
	 
		} 
		
//Special Attacks
		//UP B -------------------------------------------------------------------------------------
		if(rangedAttack && keyUp && P1Settings.canShoot) {
			P1Settings.canShoot = false;
			alarm[0] = 60;
			var fire1 = instance_create_layer(x, y-sprite_height, "Instances",obj_UpSpecial);
			fire1.image_xscale *= image_xscale;
			fire1.fireballSpeed *= image_xscale;
	
		} else
		//Down B -------------------------------------------------------------------------------------
		if(rangedAttack && keyDown && P1Settings.canShoot) {
			P1Settings.canShoot = false;
			alarm[0] = 60;
			var fire2 = instance_create_layer(x, y+sprite_height, "Instances", obj_DownSpecial);
			fire2.image_xscale *= image_xscale;
			fire2.fireballSpeed *= image_xscale;
	
		} else
		//Side BAir B (Para turn el sprite) -------------------------------------------------------------------------------------
		if(rangedAttack && ((image_xscale<0&&keyRight) || (image_xscale>0&&keyLeft)) &&P1Settings.canShoot) {
			P1Settings.canShoot = false;
			alarm[0] = 60;
			image_xscale *= -1;
			var fire3 = instance_create_layer(x+sprite_width , y, "Instances", obj_SideSpecial);
			fire3.image_xscale *= image_xscale;
			fire3.fireballSpeed *= image_xscale;			
	
		} else
		//Side B -------------------------------------------------------------------------------------
		if(rangedAttack && (keyLeft||keyRight) && P1Settings.canShoot) {
			P1Settings.canShoot = false;
			alarm[0] = 60;
			var fire4 = instance_create_layer(x+sprite_width , y, "Instances",  obj_SideSpecial);
			fire4.image_xscale *= image_xscale;
			fire4.fireballSpeed *= image_xscale;
	
		} else
		
		//Neutral B  -------------------------------------------------------------------------------------
		if(rangedAttack&&P1Settings.canShoot) {
			P1Settings.canShoot = false;
			alarm[0] = 60;
			var fire5 = instance_create_layer(x+sprite_width , y, "Instances",  obj_NeutralSpecial);
			fire5.image_xscale *= image_xscale;
			fire5.fireballSpeed *= image_xscale;
	
		} 


//Jumping Logic ---------------------------------------------------
if(P1Settings.isGrounded) {
	P1Settings.doubleJumpUsed = false;
}

if (P1Settings.isGrounded and keyJump) {
	P1Settings.vsp = -5;
} else if !P1Settings.isGrounded and keyJump and P1Settings.doubleJump and !P1Settings.doubleJumpUsed{
	P1Settings.vsp = -3.5;
	P1Settings.doubleJumpUsed = true;
}
//------------------------------------------------------

//Dash logic -----------------------------------------------
if (!P1Settings.isGrounded) and keyboard_check(vk_lshift) {
	P1Settings.hsp += (4*P1Settings.movement);
}
//-----------------------------------------------------------------

//Horizontal Collision -----------------------------------------------------
if (place_meeting(x+P1Settings.hsp,y,floorObject)) {
	
	while(!place_meeting(x+sign(P1Settings.hsp),y,floorObject)) {
		x += sign(P1Settings.hsp);
	}
	P1Settings.hsp = 0;
}

x += P1Settings.hsp;
//---------------------------------------------------------------------
//Vertical Collision ------------------------------------------------------------
if (place_meeting(x,y+P1Settings.vsp,floorObject)) {
	
	while(!place_meeting(x,y+sign(P1Settings.vsp),floorObject)) {
		y += sign(P1Settings.vsp);
	}
	P1Settings.vsp = 0;
}

y += P1Settings.vsp;

//-------------------------------------------------------------------------------------------
//Getting Hit Code ----------------------------------------------------------
if(P1Settings.getGot == true){
	P1Settings.knockies = launchCalculator.calculateLaunchSpeed();
	P1Settings.knockies *= P1Settings.attackDir; 
	//show_message(P1Settings.knockies);
	P1Settings.getGot = false;
	
}
if(P1Settings.attackDir >0){
	if(P1Settings.knockies>0){
		x+= P1Settings.knockies;
		P1Settings.knockies -= launchCalculator.decayFactor;
	}
}
if(P1Settings.attackDir<0){
	if(P1Settings.knockies<0){
		x+= P1Settings.knockies;
		P1Settings.knockies += launchCalculator.decayFactor;
	}
}
if(P1Settings.knockies>-1 && P1Settings.knockies<1){
	P1Settings.knockies = 0;
	P1Settings.attackDir = 1;
}
//----------------------------------------------------------------------

if (x == xprevious){
	P1Settings.image_speed = 0;
} else {
	P1Settings.image_speed = 0.50;
}