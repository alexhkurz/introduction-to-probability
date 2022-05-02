# area-of-circle.R

library(tidyverse)

# the number of times we through a dart at the circle
n <- 1000
number_of_samples <- 1000 # how many samples of n throws 

list <- vector(length = number_of_samples)

for (i in 1:number_of_samples)
{  
  # sample two dice
  xs <- as_tibble(rdunif(n,0,1000)) # all values equally likely
  ys <- as_tibble(rdunif(n,0,1000))

  rs <-  xs*xs + ys*ys

  rs %>%
    mutate(value = ifelse(.<1000000,TRUE,FALSE)) %>%
    group_by(value) %>%
    count ->
    test

  list[i] <- 4*test[[2]][2]/n
}

enframe(list) %>%
  select(value) %>%
  mutate(value = as.numeric(value)) %>%
  summarise(Mean = mean(value)) %>%
  sprintf("%.10f",.)
