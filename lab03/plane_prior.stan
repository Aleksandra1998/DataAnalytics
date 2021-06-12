data {
  int N;
}
generated quantities {
  real lambda = gamma_rng(6919,10);
  vector[N] y;
  for (n in 1:N) {
    y[n] = poisson_rng(lambda);
  }
}
