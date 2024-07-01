if(global.game_paused){
		exit;
}

if(x>room_width || x<0 || y>room_height || y<0) {
	instance_destroy(cancerObject);
}

keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));
keyJump = keyboard_check_pressed(vk_space);
Can_Settings.isGrounded = place_meeting(x,y+1,floorObject);

var movement = keyRight -keyLeft;

Can_Settings.hsp = movement * -Can_Settings.movSpd;

Can_Settings.vsp += Can_Settings.grav;

if (movement !=0 ){
	image_xscale = movement;
}

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