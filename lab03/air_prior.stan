data {
  int N;
}
generated quantities {
  real lambda = normal_rng(960,100);
  vector[N] y;
  for (n in 1:N) {
    y[n] = poisson_rng(lambda);
  }
}
