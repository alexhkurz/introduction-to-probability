library(tidyverse)

number_of_samples <- 100

x_sample <- as_tibble(rdunif(number_of_samples,-100,100)) 

x_sample %>%  
  ggplot() + geom_bar(aes(x=value)) + scale_x_continuous(name = "two dice", breaks = 2:12)

