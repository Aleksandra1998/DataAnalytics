data{
    int N;
    int y[N];
}
parameters{
    real<lower=0> lambda;
}
model{
    lambda ~ gamma(6919,10);

    for (n in 1:N) {
      y[n] ~ poisson(lambda);
    }
}
generated quantities {
  vector[N] y_new;
  for (n in 1:N)
    y_new[n] = poisson_rng(lambda);
}
