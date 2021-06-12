data {
  int N;
  vector[N] Mf;
  int y[N];

  int M;
  vector[M] toget;
}
parameters {
  real<lower=0> alpha;
}
model {
  alpha ~ normal(0.168,0.05);
  for (k in 1:N) {
    y[k] ~ poisson(alpha*Mf[k]);
  }
}
generated quantities {
  int y_sim[N];
  real lambda[N];
  int y_toget[M];

  for (k in 1:N) {
    lambda[k] = alpha*Mf[k];
    y_sim[k] = poisson_rng(alpha*Mf[k]);
  }
  for (k in 1:M) {
    y_toget[k] = poisson_rng(alpha*toget[k]);
  }
}
