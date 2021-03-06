# area-of-circle.R

library(tidyverse)

# the number of times we through a dart at the circle
n <- 1000

# sample two dice
xs <- as_tibble(rdunif(n,0,1000)) # all values equally likely
ys <- as_tibble(rdunif(n,0,1000))

rs <-  xs*xs + ys*ys

rs %>%
  mutate(value = ifelse(.<1000000,TRUE,FALSE)) %>%
  group_by(value) %>%
  count ->
  test

print(4*test[[2]][2]/n)
