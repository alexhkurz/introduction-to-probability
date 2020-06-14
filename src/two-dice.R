library(tidyverse)

# the number of times you want to roll the two dice
number_of_rolls <- 30 

# sample two dice
die1_sample <- as_tibble(rdunif(number_of_rolls,1,6)) # all values from 1 to 6 are equally likely
die2_sample <- as_tibble(rdunif(number_of_rolls,1,6))
two_dice <- die1_sample + die2_sample # add the values of the two dice

# plot
two_dice %>%  
  ggplot() + 
  geom_bar(aes(x=value)) + 
  scale_x_continuous(name = "two dice", breaks = 1:20)

