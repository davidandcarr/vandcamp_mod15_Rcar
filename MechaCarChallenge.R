library(tidyverse)
library(jsonlite)
library(dplyr)


#deliverable 1

mechacar <- read.csv('data_raw/MechaCar_mpg.csv')

linear_mech <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacar)

mech_sum <- summary(linear_mech)

#i don't think this is as straightforward as the example but..
mech_ys <- linear_mech$coefficients['mpg']*mechacar$mpg + linear_mech$coefficients['(Intercept)']
plt <- ggplot(mechacar, aes(x=mpg, y=vehicle_weight))
plt + geom_point() + geom_line(aes(y=mech_ys), color = "red")
#ya know, i thought this wasn't going to work, and now i know. too many variables for this to be that easy

mech_rsq <- mech_sum$r.squared

#this isnt part of the assignment, i just wanted to see if i could isolate it
mech_sum
#mech_pval <- mech_sum$fstatistic
#mech_pval
#ok guess not


#deliverable 2

susp_data <- read.csv(file='data_raw/Suspension_Coil.csv',check.names=F,stringsAsFactors=F)

?var
?sd
sd(susp_data$PSI)
var(susp_data$PSI)


#tried refactoring the input from the module. lett's try something else
#total_summary <- susp_data %>% group_by(PSI) %>% summarise(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))


susp_PSI <- susp_data$PSI

susp_PSI

summary(susp_PSI)
median(susp_PSI)
?summarise

total_summary <- summarise(susp_data, Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

#step 4. lot summary
#oh right. let's use that refactor from earlier

lot_summary <- susp_data %>% group_by(Manufacturing_Lot) %>% summarise(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

lot_summary


#deliverable 3

#isolate datasets
lot1 <- subset(susp_data, susp_data$Manufacturing_Lot == 'Lot1')
lot2 <- subset(susp_data, susp_data$Manufacturing_Lot == 'Lot2')
lot3 <- subset(susp_data, susp_data$Manufacturing_Lot == 'Lot3')

#isolate numbers for tests
lot1_psi <- lot1$PSI
lot2_psi <- lot2$PSI
lot3_psi <- lot3$PSI

