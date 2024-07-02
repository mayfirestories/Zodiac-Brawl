/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
AreaOfEffect = function () {
	return {
		Top: sprite_height/2,
		Side: (sprite_width/2)*sign(image_xscale)
	}
}
KnockbackFormula = function () {
    return {
        p: 0,
        d: 0,
        w: 100,
        s: 0,//scaled knockbackdivide by 100 for ratio eg 110 == 1.1
        b: 0,//base knockback
        crouchCancel: 0.6666667,
        rage: 1.1,
        launchSpeedFactor: 0.03,
        decayFactor: 0.051,
        calculateLaunchSpeed: function() {
            return (0.01*((((p/10+p*d/20)*(200/w+100)*1.4)+18)*s)+b)*launchSpeedFactor;
        }
    };
};

launchCalculator = KnockbackFormula();

State = function() {
	return{
		Normal: 0, //Stands Idle for testing
		Following: 1, //Follows the player
		Attacking: 2, //Attacks when in range of an attack
		Jump: 3, // Jumps to dodge, follow player in the air or to save himself from out of bounce
		Reset: 4, // If there is no player, tries to position himself
		Hit: 5 // staggered by Attack
	}
}

Settings = function() {
    return {
        x: 0,
        y: 0,
        hsp: 0,
        vsp: 0,
        grav: 0.1,
        image_speed: 0.25,
        imageDirection: 1,
        movSpd: 4,
        doubleJump: true,
        doubleJumpUsed: false,
        attackRange: 147,
        healthPoints: 0,
        canShoot: true,
        isGrounded: false,
        movement: 0,
		knockies: 0,
		attackDir: 0,
		getGot: false
    };
};

NormalHitBox = function() {
	return{
		xHitBox: 0,
		yHitBox: 0
	}
}

//Aries Setup
AIState = State();
AISettings = Settings();

//Player 1 Setup
P1Settings = Settings();

//Cancer Setup
Can_Settings = Settings();
