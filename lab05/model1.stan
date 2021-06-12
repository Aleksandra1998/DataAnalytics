data {
  int N;
  vector[N] W;
  real h[N];
  int GL;
  vector[GL] gen;
}

parameters {
  real alpha;
  real beta;
  real<lower=0, upper=20> sigma;
}

transformed parameters {
  vector[N] mu;
  for (i in 1:N) {
    mu[i] = alpha + beta * (W[i]);
  }
}

model {
  alpha ~ normal(166,20);
  beta ~ lognormal(0,1);
  sigma ~ uniform(0,20);
  h ~ normal(mu, sigma);
}

generated quantities {
  real h_sim[GL];
  for (i in 1:GL) {
    h_sim[i] = normal_rng(alpha + beta*(gen[i]), sigma);
  }
}
