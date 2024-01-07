library(ggplot2)
bikeshare <- read.csv(file= "bikeshare.csv")
head(bikeshare)
#Create a scatter plot of count vs temp. Set a good alpha value.
ggplot(bikeshare, aes(x = temp, y = count)) +
  geom_point(alpha = 0.05, color = "blue") +  # Set alpha and color to red
  theme_minimal() +
  labs(title = "Scatter Plot of Count vs Temperature",
       x = "Temperature",
       y = "Count")
df$datetime <- ymd_hms(df$datetime)

# Create the scatter plot
ggplot(df, aes(x = datetime, y = count, color = temp)) +
  geom_point() + # scatter plot
  scale_color_gradient(low = "blue", high = "red") + # color gradient
  labs(title = "Bike Share Usage Count vs Datetime with Temperature Gradient",
       x = "Datetime",
       y = "Count",
       color = "Temperature") +
  theme_light() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) # rotate x labels for readability

bikeshare$datetime <- as.POSIXct(bikeshare$datetime, format="%Y-%m-%d %H:%M:%S")

# Plotting count versus datetime as a scatterplot with a color gradient based on temperature
ggplot(bikeshare, aes(x = datetime, y = count, color = temp)) +
  geom_point() +
  scale_color_gradient(low = "blue", high = "red") +
  labs(title = "Count vs Datetime with Temperature Gradient", x = "Datetime", y = "Count", color = "Temperature") +
  theme_minimal()
#What is the correlation between temp and count?
correlation <- cor(bikeshare$temp, bikeshare$count)
correlation
#Let's explore the season data. Create a boxplot, with the y axis indicating count and the x axis begin a box for each season.
ggplot(bikeshare, aes(x = factor(season), y = count)) +
  geom_boxplot() +
  labs(title = "Boxplot of Count by Season", x = "Season", y = "Count") +
  theme_minimal()
#
bikeshare$datetime <- as.POSIXct(bikeshare$datetime, format="%Y-%m-%d %H:%M:%S")

# Extract hour from the datetime column using base R functions and create a new "hour" column
bikeshare$hour <- as.integer(format(bikeshare$datetime, "%H"))
#
bikeshare$datetime <- as.POSIXct(bikeshare$datetime, format="%Y-%m-%d %H:%M:%S")
bikeshare$hour <- as.integer(format(bikeshare$datetime, "%H"))

# Filter data where workingday == 1
bikeshare_workingday <- bikeshare[bikeshare$workingday == 1, ]

# Creating a scatter plot of count versus hour, color scale based on temp
ggplot(bikeshare_workingday, aes(x = hour, y = count, color = temp)) +
  geom_point(position=position_jitter(w=1, h=0)) + # Adding jitter to points
  scale_color_gradientn(colors=c('blue', 'green', 'yellow', 'red')) + # Custom color gradient
  labs(title = "Count vs Hour (Working Days) with Temperature Gradient", x = "Hour of Day", y = "Count", color = "Temperature") +
  theme_minimal()
#df$datetime <- as.POSIXct(df$datetime, format="%Y-%m-%d %H:%M:%S")
bikeshare$hour <- as.integer(format(bikeshare$datetime, "%H"))

# Filter data for non-working days (workingday == 0)
bikeshare_non_workingday <- bikeshare[bikeshare$workingday == 0, ]

# Creating a scatter plot of count versus hour, color scale based on temp for non-working days
ggplot(bikeshare_non_workingday, aes(x = hour, y = count, color = temp)) +
  geom_point(position=position_jitter(w=1, h=0)) + # Adding jitter to points
  scale_color_gradientn(colors=c('blue', 'green', 'yellow', 'red')) + # Custom color gradient
  labs(title = "Count vs Hour (Non-Working Days) with Temperature Gradient", x = "Hour of Day", y = "Count", color = "Temperature") +
  theme_minimal()

#build the model
temp.model <- lm(count ~ temp, data = bikeshare)
summary(temp.model)
#if temp=25
new_data <- data.frame(temp = 25)
predicted_count <- predict(temp.model, new_data)
predicted_count
#
bikeshare$datetime <- as.POSIXct(bikeshare$datetime, format="%Y-%m-%d %H:%M:%S")
bikeshare$hour <- format(bikeshare$datetime, "%H")

# Change 'hour' column to numeric values using sapply() and as.numeric
bikeshare$hour <- sapply(bikeshare$hour, as.numeric)
#
model <- lm(count ~ season + holiday + workingday + weather + temp + humidity + windspeed + hour, data = bikeshare)
summary(model)