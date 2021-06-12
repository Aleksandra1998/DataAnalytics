data {
  int N;
  real W[N];
}

generated quantities {
  real alpha = normal_rng(166,20);
  real beta = normal_rng(0,5);
  real<lower = 0> sigma = uniform_rng(0,20);
  real y_sim[N];
  for (k in 1:N) {
    y_sim[k] = normal_rng(beta*W[N]+alpha,sigma);
  }
}
