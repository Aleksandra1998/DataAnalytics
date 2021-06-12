data {
  int N;
  int A[N];
  real X[N];
  int y[N];

  int N_C;
  real Xc[N_C];
}
parameters {
  real alpha;
  real<lower = 0> beta;
}
transformed parameters {
  vector[N] theta;
  for (k in 1:N) {
    theta[k] = inv_logit(alpha+beta*X[k]);
  }
}
model {
  alpha ~ student_t(4,0,1);
  beta ~ student_t(4,10,4);
  for (k in 1:N) {
    y[k] ~ binomial(A[k],theta[k]);
  }
}
generated quantities {
  int y_sim[N];
  int y_gen[N_C];
  for (k in 1:N) {
    y_sim[k] = binomial_rng(A[k],theta[k]);
  }
  for (k in 1:N_C) {
    y_gen[k] = bernoulli_rng(inv_logit(alpha+beta*Xc[k]));
  }
}
