# intro to linear regression
#
# under construction
#

library(moderndive)
score_model <- lm(score ~ age, data = evals)
get_regression_table(score_model)
library(ggplot2)
ggplot(evals, aes(x = age, y = score, color = ethnicity)) +
  geom_point() +
  geom_parallel_slopes(se = FALSE) +
  labs(x = "Age", y = "Teaching score", color = "Ethnicity")

# References
# https://moderndive.github.io/moderndive/
# https://moderndive.com/5-regression.html
