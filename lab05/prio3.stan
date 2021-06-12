data {
  int N;
  real W[N];
}

generated quantities {
  real alpha = normal_rng(166,20);
  real beta1 = lognormal_rng(0,1);
  real beta2 = normal_rng(-0.5,0.2);
  real sigma = uniform_rng(0,10);

  real y_sim[N];
  for (k in 1:N) {
    y_sim[k] = normal_rng(beta2 * W[N]^2 + beta1*W[N]+alpha,sigma);
  }
}
