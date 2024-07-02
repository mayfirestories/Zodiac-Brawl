
var dir = image_xscale;
with(cancerObject) {
	Can_Settings.healthPoints += 20;
	launchCalculator.p = Can_Settings.healthPoints;
	launchCalculator.d = 20;
	launchCalculator.s = 1.1;
	launchCalculator.b = 50;
	launchCalculator.r = 1;
	Can_Settings.getGot = true;
	Can_Settings.attackDir = dir;
}

instance_destroy();