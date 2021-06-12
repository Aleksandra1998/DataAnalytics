data {
  int N;
  int A[N];
  real X[N];
}

generated quantities {
  real alpha=student_t_rng(4,0,1);
  real<lower = 0> beta=student_t_rng(4,10,4);

  int y_sim[N];
  for (k in 1:N) {
    y_sim[k] = binomial_rng(A[k],inv_logit(alpha+beta*X[k]));
  }
}
