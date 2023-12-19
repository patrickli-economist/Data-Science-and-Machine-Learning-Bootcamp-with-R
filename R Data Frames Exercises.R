#Ex 1: Recreate the following dataframe by creating vectors and using the data.frame function:
Age <- c(22,25,26)
Weight<-c(150,165,120)
Sex <-c("M","M","F")
name <- c("Sam", "Frank", "Amy")
df_people <- data.frame(Age, Weight, Sex)
row.names(df_people) <- name
#Ex 2: Check if mtcars is a dataframe using is.data.frame()
is.data.frame(df_people)
#Ex 3: Use as.data.frame() to convert a matrix into a dataframe:
mat <- matrix(1:25,nrow = 5)
as.data.frame(mat)
#Ex 4: Set the built-in data frame mtcars as a variable df. We'll use this df variable for the rest of the exercises.
#Ex 5: Display the first 6 rows of df
df <- mtcars
head(df)
#Ex 6: What is the average mpg value for all the car
mean(df$mpg)
#Ex 7: Select the rows where all cars have 6 cylinders (cyl column)
df[df$cyl==6,]
#Ex 8: Select the columns am,gear, and carb.
df_new <-df[c("am","gear","carb")]
#Ex 9: Create a new column called performance, which is calculated by hp/wt.
performance <- c(df["hp"]/df["wt"])
names(performance) <- "performance"
df <- cbind(df,performance)
#Ex 10: Your performance column will have several decimal place precision. Figure out how to use round() (check help(round)) to reduce this accuracy to only 2 decimal places.
round(df["performance"],digits = 2)
#Ex 10: What is the average mpg for cars that have more than 100 hp AND a wt value of more than 2.5.
selected_df <- df[df$hp > 100 & df$wt > 2.5, ]
mean(selected_df$mpg)
#Ex 11: What is the mpg of the Hornet Sportabout?
df["Hornet Sportabout","mpg"]


