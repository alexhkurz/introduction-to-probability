# the central limit theorem
# throw a biased die "number_of_rolls" time and take the mean
# repeat "number_of_samples" time
# plot how often each mean appears
# expected outcome: for large numbers the plot will resemble a bell curve whatever distribution one starts with

library(tidyverse)

biased_die_1 <- c(0.4,0,0.1,0.1,0,0.4) # probability distribution 1
biased_die_2 <- c(4/19,5/19,4/19,3/19,2/19,1/19) # probability distribution 2
# add your own distributions

number_of_rolls <- 1 # sample size 
number_of_samples <- 1 # number of samples 

list <- vector(length = number_of_samples) # list of all sample means

for (i in 1:number_of_samples) # compute all sample means
{
  # sample the die ("replace=T" means drawing from the distribution with replacement)
  mean <- mean(sample(x = c(1,2,3,4,5,6), size = number_of_rolls, prob = biased_die_1, replace=T))
  # save the mean into the list
  list[i]<-mean
}

# plot the list of means
enframe(list) %>%
  ggplot() + geom_bar(aes(x=value)) + scale_x_continuous(name = "means")


