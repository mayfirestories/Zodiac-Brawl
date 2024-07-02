
var dir = image_xscale;
with(cancerObject) {
	Can_Settings.healthPoints += 10;
	launchCalculator.p = Can_Settings.healthPoints;
	launchCalculator.d = 10;
	launchCalculator.s = 1.1;
	launchCalculator.b = 20;
	Can_Settings.getGot = true;
	Can_Settings.attackDir = dir;
}

instance_destroy();

