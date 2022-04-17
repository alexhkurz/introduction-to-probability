# the central limit theorem
# throw a (possibly biased) die "sample_size" times and take the mean
# repeat "number_of_samples" times
# plot how often each mean appears (approximating the sample distribution)
# expected outcome: for large sample sizes the plot will resemble a Gaussian bell curve whatever distribution one starts with

library(tidyverse)

# define probability distributions
die_0 <- c(1/6,1/6,1/6,1/6,1/6,1/6) # unbiased (uniform), mean 3.5, symmetric
die_1 <- c(0.4,0,0.1,0.1,0,0.4) # biased towards 1 and 6, mean 3.5, symmetric
die_1b <- c(0.9,0,0,0,0,0.1) # mean 1.5 
die_2 <- c(5/20,5/20,4/20,3/20,2/20,1/20) # mean 2.75, right skew
die_3 <- c(1,0,0,0,0,0) # mean 1 
# add your own distributions

sample_size <- 1  
number_of_samples <- 1000  

list <- vector(length = number_of_samples) # list of all sample means

for (i in 1:number_of_samples) # compute all sample means
{
  # sample the die ("replace=T" means drawing from the distribution with replacement)
  mean <- mean(sample(x = c(1,2,3,4,5,6), size = sample_size, prob = die_1, replace=T))
  # save the mean into the list
  list[i]<-mean
}

# plot the list of means
enframe(list) %>%
  ggplot() + geom_bar(aes(x=value)) + scale_x_continuous(name = "means")


