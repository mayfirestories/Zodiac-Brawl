if(global.game_paused){
		exit;
}

if(x>room_width || x<0 || y>room_height || y<0) {
	instance_destroy();
}

keyLeft = keyboard_check(ord("O"));
keyRight = keyboard_check(ord("P"));
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));
keyJump = keyboard_check_pressed(vk_backspace);
rangedAttack = mouse_check_button_pressed(mb_right);
meleeAttack = mouse_check_button_pressed(mb_left);
Can_Settings.isGrounded = place_meeting(x,y+1,floorObject);

var movement = keyRight -keyLeft;

Can_Settings.hsp = movement * Can_Settings.movSpd;

Can_Settings.vsp += Can_Settings.grav;

if (movement !=0 ){
	image_xscale = movement;
}




//Fireball attack --------------------------------------------------------------------------------
if(rangedAttack and Can_Settings.canShoot) {

	Can_Settings.canShoot = false;

	var fireball = instance_create_layer(x+Can_Settings.attackRange * sign(image_xscale) , y, "Instances", fireBallObject);
	fireball.image_xscale = image_xscale;
	fireball.fireballSpeed *= fireball.image_xscale;
}

if (!instance_exists(fireBallObject)){
	Can_Settings.canShoot = true;
}
//------------------------------------------------------------------------------------------------------




//Melee Attack -------------------------------------------------------------------------------------
if(meleeAttack) {
	
	var sword = instance_create_layer(x+sprite_width  , y, "Instances", obj_cancer_attack_test);
	sword.image_xscale *= image_xscale;
	
	
}
//---------------------------------------------------------------------------------------------------

if(Can_Settings.isGrounded) {
	Can_Settings.doubleJumpUsed = false;
}

if Can_Settings.isGrounded and keyJump {
	Can_Settings.vsp = -5;
} else if !Can_Settings.isGrounded and keyJump and Can_Settings.doubleJump and !Can_Settings.doubleJumpUsed{
	Can_Settings.vsp = -3.5;
	Can_Settings.doubleJumpUsed = true;
}

if (!Can_Settings.isGrounded) and keyboard_check(vk_lshift) {
	Can_Settings.hsp += (-4*movement);
}

if (place_meeting(x+Can_Settings.hsp,y,floorObject)) {
	
	while(!place_meeting(x+sign(Can_Settings.hsp),y,floorObject)) {
		x += sign(Can_Settings.hsp);
	}
	Can_Settings.hsp = 0;
}

x += Can_Settings.hsp;

if (place_meeting(x,y+Can_Settings.vsp,floorObject)) {
	while(!place_meeting(x,y+sign(Can_Settings.vsp),floorObject)) {
		y += sign(Can_Settings.vsp);
	}
	Can_Settings.vsp = 0;
}

y+= Can_Settings.vsp;


//Getting Hit Code ----------------------------------------------------------
if(Can_Settings.getGot == true){
	Can_Settings.knockies = launchCalculator.calculateLaunchSpeed();
	Can_Settings.knockies *= Can_Settings.attackDir; 
	//show_message(Can_Settings.knockies);
	Can_Settings.getGot = false;
	
}
if(Can_Settings.attackDir >0){
	if(Can_Settings.knockies>0){
		x+= Can_Settings.knockies;
		Can_Settings.knockies -= launchCalculator.decayFactor;
	}
}
if(Can_Settings.attackDir<0){
	if(Can_Settings.knockies<0){
		x+= Can_Settings.knockies;
		Can_Settings.knockies += launchCalculator.decayFactor;
	}
}
if(Can_Settings.knockies>-1 && Can_Settings.knockies<1){
	Can_Settings.knockies = 0;
	Can_Settings.attackDir = 1;
}
//----------------------------------------------------------------------


if (x == xprevious){
	image_speed = 0;
} else {
	image_speed = 0.50;
}