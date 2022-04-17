# sampling distribution of sample proportion
# given a jar with various candies, estimate how many are green

library(tidyverse)

# define probability distributions
# values taken from https://www.khanacademy.org/math/statistics-probability/sampling-distributions-library/sample-proportions/v/sampling-distribution-of-sample-proportion-part-2?modal=1
# the component's outcomes are called "green","red","orange" below
urn1 <- c(6/10,2/10,2/10) 
urn2 <- c(1/10,4/10,4/10) # skewed to the left
urn <- urn2 # modify this line to choose another distribution

sample_size <- 10
number_of_samples <- 30

list <- vector(length = number_of_samples) # list of all sample proportions

for (i in 1:number_of_samples) # compute all sample proportions of green
{
  # sample the gummy bear jar (with replacement)
  sample <- as_tibble(sample(x = c("green","red","orange"), size = sample_size, prob = urn, replace=T))
  # save the sample proportion into the list
  sample %>%
    filter(value=="green") %>% # retain all rows in the subpopulation 
    count %>%
    pluck(1) -> success # number of rows in the subpopulation 
  list[i] <- success / sample_size # sample
}

# fraction of green candy in the samples
sample_mean <- mean(list) 

# standard deviation computed from the sample
aux <- 0
for (i in 1:number_of_samples) # compute all sample proportions
{ 
  aux <- aux + (list[i]-sample_mean)^2 # wrong formula
}
aux <- aux / number_of_samples
standard_deviation <- aux^(1/2)

# plot the list of proportions
enframe(list) %>%
  ggplot() + geom_bar(aes(x=value)) + scale_x_continuous(name = "proportions")

