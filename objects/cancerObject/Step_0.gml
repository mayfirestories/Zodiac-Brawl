if(global.game_paused){
		exit;
}

if(healthPoints == 0) {
	instance_destroy(cancerObject);
}

keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));
keyJump = keyboard_check_pressed(vk_space);
isGrounded = place_meeting(x,y+1,floorObject);


var movement = keyRight - keyLeft;

hsp = movement * -movSpd;

vsp += grav;



if (movement !=0 ){
	image_xscale = movement;
}


if(isGrounded) {
	doubleJumpUsed = false;
}

if isGrounded and keyJump {
	vsp = -5;
} else if !isGrounded and keyJump and doubleJump and !doubleJumpUsed{
	vsp = -3.5;
	doubleJumpUsed = true;
}

if (!isGrounded) and keyboard_check(vk_lshift) {
	hsp += (-4*movement);
}

if (place_meeting(x+hsp,y,floorObject)) {
	
	while(!place_meeting(x+sign(hsp),y,floorObject)) {
		x += sign(hsp);
	}
	hsp = 0;
}

x += hsp;

if (place_meeting(x,y+vsp,floorObject)) {
	
	while(!place_meeting(x,y+sign(vsp),floorObject)) {
		y += sign(vsp);
	}
	vsp = 0;
}

y += vsp;

if (x == xprevious){
	image_speed = 0;
} else {
	image_speed = 0.50;
}