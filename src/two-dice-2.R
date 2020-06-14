library(tidyverse)

number_of_rolls <- 30 # the number of times you roll the dice
number_of_samples <- 20 # how many samples of number_of_throws 

list <- vector(length = number_of_samples)

for (i in 1:number_of_samples)
{
  #print("throw dice")
  die1_sample <- as_tibble(rdunif(number_of_rolls,1,6)) # all values from 1 to 6 are equally likely
  die2_sample <- as_tibble(rdunif(number_of_rolls,1,6))
  two_dice <- die1_sample + die2_sample # add the values of the two dice
  
  #print(paste("sort sample", i))
  two_dice %>%
    group_by(value) %>%
    count %>%
    arrange(desc(n)) ->
    two_dice_sorted
  
  #print("update list")
  if (two_dice_sorted[[1]][1]==7) {
    list[i]<-TRUE
  } else {
    list[i]<-FALSE
  }
}

#print("plot")
enframe(list) %>%
  ggplot() + geom_bar(aes(x=value)) + labs(x="7 most frequent value")