data{
    int N;
    int y[N];
}
parameters{
    real<lower=0> lambda;
}
model{
    lambda ~ normal(960,100);

    for (n in 1:N) {
      y[n] ~ poisson(lambda);
    }
}
generated quantities {
  vector[N] y_new;
  for (n in 1:N)
    y_new[n] = poisson_rng(lambda);
}
