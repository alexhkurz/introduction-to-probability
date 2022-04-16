library(tidyverse)

number_of_samples <- 100

x_sample <- as_tibble(rdunif(number_of_samples,-10,10)) 

x_sample %>%  
  ggplot() + geom_bar(aes(x=value)) + scale_x_continuous(name = "x", breaks = -10:10)

