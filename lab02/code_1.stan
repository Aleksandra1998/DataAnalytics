data {
	int M;
}

generated quantities {
	real lambda=fabs(normal_rng(0,121));
	int theta[M];
	for (k in 1:M) {
		theta[k] = poisson_rng(lambda);
	}
}
