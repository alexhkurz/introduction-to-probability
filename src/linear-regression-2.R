# intro to linear regression
#
# experiments:
# change error_margin, observe correlation
#

library(tidyverse)
library(moderndive)
# Parameters (modify for experiments)
m <- 1 # slope of the linear model
b <- 2 # intercept of the linear model
sd_y <- 2 # standard deviation of y from the linear model
n <- 30 # sample size
scale_x <- 2 # rescale x for comparison
scale_y <- 3 # rescale y for comparison

# Create random data
x <-  runif(30, 0, 10) # choose 30 random points on x between 0 and 10
noise <- rnorm(30, mean=0, sd=sd_y) # create some noise on y
y <- m*x + b + noise # compute y coordinates
pairs <- tibble(x,y) # make a table with all (x,y)

# Glimpse at the data
print(pairs) # output to the console

# Plot data and regression line
pairs %>%
  ggplot(aes(x,y)) +
    geom_point() +
    geom_smooth(formula = y ~ x, method = "lm", se=FALSE) + # "lm" computes a linear model (regression) +
    labs (title = "unscaled data")

# Computer printout and correlation
score_model <- lm(y ~ x, data = pairs) # compute the regression (lm for linear model)
get_regression_table(score_model) # output to the console
get_correlation(formula = y ~ x, data = pairs) # output to the console


# Repeat the above for scaled data

## Create rescaled data for comparison
x <- scale_x*x # scale x
y <- scale_y*y # scale y
pairs_scaled <- tibble(x,y) # make table

## Plot data and regression line
pairs_scaled %>% 
  ggplot(aes(x,y)) +
  geom_point() +
  geom_smooth(formula = y ~ x, method = "lm", se=FALSE) + # "lm" computes a linear model (regression) +
  labs (title = "scaled data")

## Computer printout and correlation for scaled data
score_model <- lm(y ~ x, data = pairs_scaled) # compute the regression (lm for linear model)
get_regression_table(score_model) # output to the console
get_correlation(formula = y ~ x, data = pairs_scaled) # output to the console


# References
# https://moderndive.github.io/moderndive/
# https://moderndive.com/5-regression.html
