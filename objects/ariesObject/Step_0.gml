player1Controls.keyLeft = keyboard_check(ord("A"));
player1Controls.keyRight = keyboard_check(ord("D"));
player1Controls.keyUp = keyboard_check(ord("W"));
player1Controls.keyDown = keyboard_check(ord("S"));
player1Controls.keyJump = keyboard_check_pressed(vk_space);

player1Controls.rangedAttack = keyboard_check_pressed(ord("F"));
player1Controls.meleeAttack = keyboard_check_pressed(ord("E"));

player1Settings.isGrounded = place_meeting(x,y+1,floorObject);

player1Settings.movement = player1Controls.keyRight - player1Controls.keyLeft;

player1Settings.hsp = player1Settings.movement * player1Settings.movSpd;

player1Settings.vsp += player1Settings.grav;

if (player1Settings.movement !=0 ){
	image_xscale = player1Settings.movement;
}


if(player1Controls.rangedAttack and player1Settings.canShoot) {

	player1Settings.canShoot = false;

	var fireball = instance_create_layer(x+attackRange * sign(image_xscale) , y, "Instances", fireBallObject);
	fireball.image_xscale = image_xscale;
	fireball.fireballSpeed *= fireball.image_xscale;
}

if (!instance_exists(fireBallObject)){
	player1Settings.canShoot = true;
}

if( player1Controls.meleeAttack) {
	
	var sword = instance_create_layer(x+attackRange * sign(image_xscale) , y, "Instances", swordObject);
	swordObject.image_xscale = image_xscale;
	
}


if(player1Settings.isGrounded) {
	player1Settings.doubleJumpUsed = false;
}

if player1Settings.isGrounded and player1Controls.keyJump {
	show_debug_message("Jumping");
	vsp = -5;
} else if !player1Settings.isGrounded and player1Controls.keyJump and player1Settings.doubleJump and !player1Settings.doubleJumpUsed{
	vsp = -3.5;
	doubleJumpUsed = true;
}

if (!player1Settings.isGrounded) and keyboard_check(vk_lshift) {
	hsp += (4*movement);
}

if (place_meeting(x+player1Settings.hsp,y,floorObject)) {
	
	while(!place_meeting(x+sign(player1Settings.hsp),y,floorObject)) {
		x += sign(player1Settings.hsp);
	}
	player1Settings.hsp = 0;
}

x += player1Settings.hsp;

if (place_meeting(x,y+player1Settings.vsp,floorObject)) {
	
	while(!place_meeting(x,y+sign(player1Settings.vsp),floorObject)) {
		y += sign(player1Settings.vsp);
	}
	player1Settings.vsp = 0;
}

y += player1Settings.vsp;

if (x == xprevious){
	player1Settings.image_speed = 0;
} else {
	player1Settings.image_speed = 0.50;
}