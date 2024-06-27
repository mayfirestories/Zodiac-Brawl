
hsp = fireballSpeed ;

x += hsp;

if(alarm[0] == -1) {
	alarm[0] = 60;	
}

if (alarm[0] == 0) {
	instance_destroy(fireBallObject);
}