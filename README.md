# Statistical Analysis with R

In this week's challenge, the client requires some critical analysis of their manufacturing data in the aim of optimization. Let's dive in.

## Linear Regression to Predict MPG
In an effort to determine which design specification contributes greatest to the MechaCar's miles per gallon, the data of 50 mechacars was passed through a linear regression model. As such, our output is as follows:

![linear MechaCar](src='images/mechacar_linearcoefs.png')

After relying on R to do a bit more computational heavy lifting, we can get some more clarity on the significance of the dataset provided.

![Deeper summation](src='images/mechacar_linearreg.png')

With this insight, it is already apparent that the dataset of 50 MechaCars is representative of about 70% of the units being produced. While I would prefer to get closer to 90% (perhaps with specifications of 100 cars) nearly 3 quarters of the population will have to do. Besides, this analysis also reveals some of the more important aspects of the assembly line. Judging by the infinitessimally smaller P-values of their counterparts, the p-values of the car's spoiler angle, as well as the presence of All Wheel Drive seem to have the greatest impact on its Miles Per Gallon. This is a fairly easy correlation to make, seeing as a spoiler that creates <u>more</u> drag would be detrimental to the engine's performance as it burns fuel. Similarly, an engine that is exerting double output at any given time could conceivably be less efficient than its counterpart that is only powering one axle.

While vehicle weight is also outside the bounds of a standard 95% significance margin (pulling a p-value of almost 8%) I am willing to overlook this particular measure of the cars. My reasoning here is that the models surveyed have far-flung range. For this particular dataset as a whole, it would seem that the measure of each vehicle's MPG is barely effected by the nearly 8000 pounds of difference between one model to the next.

Despite my willingness to overlook the inconsistencies, I am not willing to say this is an accurate prediction of the MechaCar's mpg. I would require more data before making a definitive judgment on these specifications, and perhaps much less variance in the samples.

## Summary Statistics on Manufacturer's Suspension Coils

Per design specifications, MechaCars' suspension coils are not to have a variance exceeding 100lbs/sq. in. As such, let's take a look at the three manufacturing plants and determine if they are "up to code" as it were.

![3plant summary](src='images/3plants.png')

As you can see from the data above, Lot3 seems to be severely lacking in comparison to its counterparts. The numbers are as such to make one want to cease production immediately. Without further data on Lot3's particular output and manufacturing specifications, it is hard to make a judgment call merely based on these numbers. Perhaps Lot3 is responsible for some of the unpredictability of the MPG calculations? Perhaps Lot1 and Lot2 are adhering to practices that are more dangerous, though Lot3 outputs MechaCars that are not up to design specs? Impossible to say. However, we can get more objective about the data by performing t-tests on our lot samples.

## T-tests on Suspension Coils

By conducting t-tests on each dataset we can learn how significant each lot's data is as a whole. Perhaps through these calculations we can shed some light on Lot3's shortcomings.

![Lot1](src='images/lot1_ttest.png')

![Lot2](src='images/lot2_ttest.png')

![Lot3](src='images/lot3_ttest.png')

Oddly enough, the best-performing manufacturer (Lot 1) yields a t-test that indicates its successes are almost entirely due to chance. Lot 2 is not far behind, with a p-value of 0.6, and Lot 3 comes in strong with a p-value of 0.042. Thus, as alluded previously, it is perhpas less about specifications and more about practice that these three manufacturers have such disparate data. Let's dig a little deeper by performing 2-sample tests on each of our data sets, pitting them against each other.

![Ttest Summary](src='images/alllot_ttest.png')

Curiouser and curiouser. Lots 1 and 3 have the least difference between their measurements (smallest degree of freedom) and a strong difference against chance dictating their results. Similarly, lots 2 and 3 tout the least "random" measurements as well as a high T value. MechaCar needs to get inspectors down to all of these lots as soon as possible, and start collecting some more data on each of them. In my simple opinion, the manufacturing specifications of Lot 1 and 3 should be combined.


## Study Design: MechaCar VS Competition

While the discrepancies of the assembly lines are smoothed out, perhaps it is best to look forward to the marketability of the product. Besides, we already have at least 150 units ready to be sold, so let's get a handle on the MechaCar's most marketable assets. Gas consumption is always of utmost concern to the consumer, so let's begin with the most sellable hypothesis on the market: the MechaCar is the most fuel efficient vehicle on the market.

Ok, words are nice but selling an "idea" is fairly difficult in a 30-second ad, so let's get some numbers to support our hypothesis with the scientific method.

### Hypothesis
If MechaCar is the most fuel efficient vehicle on the market, it will burn less fuel than its efficient counterparts on the market.

### Alternative Hypothesis
There is no statistic significance between the MechaCar's fuel consumption and the other cars promoted for efficiency in the market.

### Null Hypothesis
The MechaCar consumes more fuel than any other "fuel efficient" car on the market.


In order for us to begin this experiment, we will need data from the top-selling manufacturers' best-selling models and compare them to the MechaCar's consumption ratings. This will also help MechaCar find a price niche for the market.

Once all this data is compiled, I propose a linear regression model that pits miles per gallon against price, storage space (cu. ft.), and horsepower. Similarly, it may be worth it to perform sample tests on this data against other years of automobile sales, focused on years that have the most cars still in use.