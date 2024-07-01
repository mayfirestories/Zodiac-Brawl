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

//Fireball attack --------------------------------------------------------------------------------
if(rangedAttack and P1Settings.canShoot) {

	P1Settings.canShoot = false;

	var fireball = instance_create_layer(x+P1Settings.attackRange * sign(image_xscale) , y, "Instances", fireBallObject);
	fireball.image_xscale = image_xscale;
	fireball.fireballSpeed *= fireball.image_xscale;
}

if (!instance_exists(fireBallObject)){
	P1Settings.canShoot = true;
}
//------------------------------------------------------------------------------------------------------

//Normal Attacks ----------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------
		//UP Air -------------------------------------------------------------------------------------
		if(meleeAttack && keyUp && !P1Settings.isGrounded) {
	
			var sword = instance_create_layer(x , y-sprite_height, "Instances", swordObject);
			swordObject.image_xscale *= image_xscale;
			sword.image_blend = c_black;
	
		} else
		//---------------------------------------------------------------------------------------------------
	
		//Down Air -------------------------------------------------------------------------------------
		if(meleeAttack && keyDown && !P1Settings.isGrounded) {
	
			var sword = instance_create_layer(x , y+sprite_height, "Instances", swordObject);
			swordObject.image_xscale *= image_xscale;
			sword.image_blend = c_black;
	
		} else
		//---------------------------------------------------------------------------------------------------
	
		//Forward Air -------------------------------------------------------------------------------------
		if(meleeAttack && ((image_xscale>0&&keyRight) || (image_xscale<0&&keyLeft)) && !P1Settings.isGrounded) {
	
			var sword = instance_create_layer(x+sprite_width , y, "Instances", swordObject);
			swordObject.image_xscale *= image_xscale;
			sword.image_blend = c_black;
	
		} else
		//Back Air -------------------------------------------------------------------------------------
		if(meleeAttack && ((image_xscale<0&&keyRight) || (image_xscale>0&&keyLeft)) && !P1Settings.isGrounded) {
	
			var sword = instance_create_layer(x-sprite_width , y, "Instances", swordObject);
			swordObject.image_xscale *= image_xscale;
			sword.image_blend = c_black;
	
		} else
		//Neutral Air -------------------------------------------------------------------------------------
		if(meleeAttack && !P1Settings.isGrounded) {
			var sword = instance_create_layer(x+sprite_width , y, "Instances", swordObject);
			swordObject.image_xscale *= image_xscale;
			sword.image_blend = c_black;
	
		} else
		//UP A -------------------------------------------------------------------------------------
		if(meleeAttack && keyUp && P1Settings.isGrounded) {
	
			var sword = instance_create_layer(x, y-sprite_height, "Instances", swordObject);
			swordObject.image_xscale *= image_xscale;
	
		} else
		//Down A -------------------------------------------------------------------------------------
		if(meleeAttack && keyDown && P1Settings.isGrounded) {
	
			var sword = instance_create_layer(x, y+sprite_height, "Instances", swordObject);
			swordObject.image_xscale *= image_xscale;
	
		} else
		//Side A -------------------------------------------------------------------------------------
		if(meleeAttack && (keyLeft||keyRight) && P1Settings.isGrounded) {
	
			var sword = instance_create_layer(x+sprite_width , y, "Instances", swordObject);
			swordObject.image_xscale *= image_xscale;
	
		} else
		//Neutral A  -------------------------------------------------------------------------------------
		if(meleeAttack && P1Settings.isGrounded) {
			var sword = instance_create_layer(x+sprite_width , y, "Instances", swordObject);
			swordObject.image_xscale *= image_xscale;
	
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

if (place_meeting(x+P1Settings.hsp,y,floorObject)) {
	
	while(!place_meeting(x+sign(P1Settings.hsp),y,floorObject)) {
		x += sign(P1Settings.hsp);
	}
	P1Settings.hsp = 0;
}

x += P1Settings.hsp;

if (place_meeting(x,y+P1Settings.vsp,floorObject)) {
	
	while(!place_meeting(x,y+sign(P1Settings.vsp),floorObject)) {
		y += sign(P1Settings.vsp);
	}
	P1Settings.vsp = 0;
}

y += P1Settings.vsp;


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