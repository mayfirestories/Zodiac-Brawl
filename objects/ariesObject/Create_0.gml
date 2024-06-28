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

// Usage
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