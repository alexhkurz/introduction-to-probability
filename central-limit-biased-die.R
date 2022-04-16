# the central limit theorem
# throw a biased die "number_of_rolls" time and take the mean
# repeat "number_of_samples" time
# plot how often each mean appears
# expected outcome: for large numbers the plot will resemble a bell curve

library(tidyverse)

number_of_rolls <- 1 #sample size
number_of_samples <- 1 # number of samples

list <- vector(length = number_of_samples) # list of all sampled means

for (i in 1:number_of_samples)
{
  # sample the die
  mean <- mean(sample(x = c(1,2,3,4,5,6), size = number_of_rolls, prob = c(.4,0,.1,.1,0,0.4), replace=T))
  # save the mean into the list
  list[i]<-mean
}

# plot the list of means
enframe(list) %>%
  ggplot() + geom_bar(aes(x=value)) + scale_x_continuous(name = "frequencies of means")


