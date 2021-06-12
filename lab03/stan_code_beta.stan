data{
    int<lower=1> N;
    int<lower=0,upper=1> y[N];
}
parameters{
    real<lower=0,upper=1> p;
}
model{
    p ~ beta(6, 3);
    y ~ binomial(1, p);
}
