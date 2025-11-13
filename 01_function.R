## toy code

## we will take input of beta and sigma for y = a + xbeta + e
## beta will be effect size
## sigma will be noise variance 
## we will return estimates of beta and sigma as a list
regression_output <- function(data){ ## data frame has x and y: both are univariate
  model = lm(y ~ x, data = data)
  beta = as.numeric(coefficients(model)[2])
  beta_ci = confint(model, "x")
  sigma = summary(model)$sigma
  return(list(beta = beta, sigma = sigma, ci = beta_ci))
}

## we will simulate data to feed into the regression_output function above
## input: sample size n
## input: effect size beta (true)
## input: noise variance (true)
data_generate <- function(n = 100, beta = 1, sigma = 0.1){ # you can set defaults if you like
  x <- rnorm(n, 0, 1)
  y <- 1 + beta*x + rnorm(n, 0, sigma)
  return(data.frame(x = x, y = y))
}

## toy run
## regression_output(data_generate(100, 10, 5))

