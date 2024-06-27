keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));
keyJump = keyboard_check_pressed(vk_space);

rangedAttack = keyboard_check_pressed(ord("F"));
meleeAttack = keyboard_check_pressed(ord("E"));

isGrounded = place_meeting(x,y+1,floorObject);

var movement = keyRight - keyLeft;

hsp = movement * movSpd;

vsp += grav;

if (movement !=0 ){
	image_xscale = movement;
}


if(rangedAttack and canShoot) {

	canShoot = false;

	var fireball = instance_create_layer(x+attackRange * sign(image_xscale) , y, "Instances", fireBallObject);
	fireball.image_xscale = image_xscale;
	fireball.fireballSpeed *= fireball.image_xscale;
}

if (!instance_exists(fireBallObject)){
	canShoot = true;
}

if( meleeAttack) {
	
	var sword = instance_create_layer(x+attackRange * sign(image_xscale) , y, "Instances", swordObject);
	swordObject.image_xscale = image_xscale;
	
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
	hsp += (4*movement);
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