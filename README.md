# README

A blog on a home-education project on probability with Julius (12).

We started by choosing a game that is played by rolling two dice such as backgammon or [the settlers of Catan](https://en.wikipedia.org/wiki/Catan). The aim is to have fun and to learn that not all values are equally likely. Moreover, knowing something about probabilities can help to build a strategy for the game.

**Activity:** Throw the two dice 30 times and make a list of the outcomes. Which outcomes are most frequent? Draw a bar chart with columns for the possible outcomes from 2 to 12 and the height of the column indicating how often an outcome happened.

This work should raise some interesting questions:
- Why appear some outcomes more often than others?
- What would you expect from counting the possibilities?

**Activity:** Make another bar chart with columns for the possible outcomes from 2 to 12 and the height of the column indicating how many possibilities there are to achieve that outcome.

More questions:
- Should the two bar charts be the same? Or similar? Why are they so different?
- What happens if we do the experiment again and do another 30 throws of two dice?

This is getting a bit boring to do by hand, so I wrote a little program called [two-dice-1.R](https://github.com/alexhkurz/introduction-to-probability/blob/master/src/two-dice-1.R). You need to install R to run the program.

    number_of_throws <- 30 

    die1_sample <- as_tibble(rdunif(number_of_throws,1,6)) # all values from 1 to 6 are equally likely
    die2_sample <- as_tibble(rdunif(number_of_throws,1,6))
    two_dice <- die1_sample + die2_sample # add the values of the two dice

    two_dice %>%  
    ggplot() + geom_bar(aes(x=value)) + scale_x_continuous(name = "two dice", breaks = 2:12)

**Activity:** Run the program. Read the program line by line and try to find out what each line means. A good way to find out what each line in the program means is to change the lines, to execute the program again and to see what happens.



