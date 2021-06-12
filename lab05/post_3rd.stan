data {
  int N;
  vector[N] W;
  vector[N] W2;
  vector[N] W3;
  real h[N];
  int GL;
  vector[GL] gen;
  vector[GL] gen2;
  vector[GL] gen3;
}

parameters {
  real alpha;
  real beta1;
  real beta2;
  real beta3;
  real<lower=0, upper=20> sigma;
}

transformed parameters {
  vector[N] mu;
  for (i in 1:N) {
    mu[i] = alpha + beta1 * (W[i]) + beta2 * (W2[i]) + beta3 * (W3[i]);
  }
}

model {
  alpha ~ normal(166,20);
  beta1 ~ lognormal(0,1);
  beta2 ~ normal(-0.5,0.2);
  beta3 ~ normal(0,1);
  sigma ~ uniform(0,20);
  h ~ normal(mu, sigma);
}

generated quantities {
  real h_sim[GL];
  for (i in 1:GL) {
    h_sim[i] = normal_rng(alpha+beta1*(gen[i])+beta2*(gen2[i])+beta3*(gen3[i]), sigma);
  }
}
