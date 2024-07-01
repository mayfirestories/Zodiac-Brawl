if(global.game_paused){ exit; }


keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));
keyJump = keyboard_check_pressed(vk_space);

rangedAttack = mouse_check_button_pressed(mb_right);
meleeAttack = mouse_check_button_pressed(mb_left);
P1Settings.isGrounded = place_meeting(x,y+1,floorObject);

P1Settings.movement = keyRight - keyLeft;

P1Settings.hsp = P1Settings.movement * P1Settings.movSpd;

P1Settings.vsp += P1Settings.grav;

if (P1Settings.movement !=0 ){
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




//Melee Attack -------------------------------------------------------------------------------------
if(meleeAttack) {
	
	var sword = instance_create_layer(x+P1Settings.attackRange * sign(image_xscale) , y, "Instances", swordObject);
	swordObject.image_xscale *= image_xscale;
	
}
//---------------------------------------------------------------------------------------------------



if(P1Settings.isGrounded) {
	P1Settings.doubleJumpUsed = false;
}

if (P1Settings.isGrounded and keyJump) {
	P1Settings.vsp = -5;
} else if !P1Settings.isGrounded and keyJump and P1Settings.doubleJump and !P1Settings.doubleJumpUsed{
	P1Settings.vsp = -3.5;
	P1Settings.doubleJumpUsed = true;
}

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

if (x == xprevious){
	P1Settings.image_speed = 0;
} else {
	P1Settings.image_speed = 0.50;
}