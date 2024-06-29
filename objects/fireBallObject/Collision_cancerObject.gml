with(cancerObject) {
	player2Settings.healthPoints -= 10;
	launchCalculator.p = 120;
	launchCalculator.d = 5;
	launchCalculator.s = 1.1
	launchCalculator.b = 20;
	var knockies = launchCalculator.calculateLaunchSpeed();
	while (knockies>0) {
		x += knockies;
		knockies *= launchCalculator.decayFactor;
	}

}

instance_destroy();