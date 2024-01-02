library(ggplot2)
library(ggthemes)
head(mpg)
mpg_df <- mpg

#Histogram of hwy mpg values:mpg_hist <- ggplot(df_mpg, aes(x = mpg)) + geom_histogram(color="pink",fill="pink")
hwy_hist <- ggplot(mpg_df, aes(x = hwy)) +
  geom_histogram( binwidth= 1, color = "pink", fill = "pink")

# Now print the histogram
print(hwy_hist)

#Barplot of car counts per manufacturer with color fill defined by cyl count
bar_maker <- ggplot(mpg_df,aes(manufacturer,fill=factor(cyl))) + geom_bar()
print(bar_maker)
#
head(txhousing)
#Create a scatterplot of volume versus sales. Afterwards play around with alpha and color arguments to clarify information.
scatter_volumnSales <- ggplot(data=txhousing,aes(x=sales,y=volume)) + geom_point()
print(scatter_volumnSales)
#Add a smooth fit line to the scatterplot from above. Hint: You may need to look up geom_smooth()
scatter_volumnSales + geom_smooth(color='red')