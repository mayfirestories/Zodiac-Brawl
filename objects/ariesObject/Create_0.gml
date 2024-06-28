hsp = 0;
vsp = 0;

grav = 0.1;

image_speed = 0.25;
imageDirection = 1;

movSpd = 4;

doubleJump = true;
doubleJumpUsed = false;

attackRange = 147;

healthPoints = 50;

canShoot = true;

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
            return (((((p/10+p*d/20)*(200/w+100)*1.4)+18)*s)+b)*launchSpeedFactor;
        }
    };
};

launchCalculator = KnockbackFormula();

Controls = function() {
    return {
        keyLeft: keyboard_check(ord("A")),
        keyRight: keyboard_check(ord("D")),
        keyUp: keyboard_check(ord("W")),
        keyDown: keyboard_check(ord("S")),
        keyJump: keyboard_check_pressed(vk_space),
        rangedAttack: keyboard_check_pressed(ord("F")),
        meleeAttack: keyboard_check_pressed(ord("E"))
    };
};

player1Controls = Controls();

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
        healthPoints: 50,
        canShoot: true,
        isGrounded: false,
        movement: 0
    };
};

player1Settings = Settings();