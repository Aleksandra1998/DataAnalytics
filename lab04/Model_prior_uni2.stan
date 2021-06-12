data {
  int N;
  int A[N];
  real X[N];
}

generated quantities {
  real alpha=uniform_rng(-1,2);
  real beta=uniform_rng(0,20);

  int y_sim[N];
  for (k in 1:N) {
    y_sim[k] = binomial_rng(A[k],inv_logit(alpha+beta*X[k]));
  }
}
