library(dplyr)
head(mtcars)
#Return rows of cars that have an mpg value greater than 20 and 6 cylinders.
filtered_cars <- mtcars %>% filter(mpg > 20, cyl == 6)
#Reorder the Data Frame by cyl first, then by descending wt.
dered_cars <- mtcars %>% arrange(cyl, desc(wt))
#Select the columns mpg and hp
selected_columns <- mtcars %>%  select(mpg, hp)
#Select the distinct values of the gear column.
distinct_gears <- mtcars %>%  distinct(gear)
#Create a new column called "Performance" which is calculated by hp divided by wt.
mtcars_with_performance <- mtcars %>% mutate(Performance = hp / wt)
#Find the mean mpg value using dplyr.
mean_mpg <- mtcars %>% summarise(mean_mpg = mean(mpg))
#Use pipe operators to get the mean hp value for cars with 6 cylinders.
mean_hp_sixCylinders <- mtcars %>%   filter(cyl == 6) %>%   summarise(mean_hp_sixCylinders = mean(hp))

