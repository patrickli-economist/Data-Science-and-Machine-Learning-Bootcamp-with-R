#import dara
df_economist <- read.csv("C:/Users/patri/Desktop/1.csv")
df_economist <- df_economist[,-1]
head(df_economist)
library(ggplot2)
#Use ggplot() + geom_point() to create a scatter plot object called pl. You will need to specify x=CPI and y=HDI and color=Region as aesthetics
pl <- ggplot(data=df_economist,aes(x=CPI,y=HDI)) + geom_point(aes(color=Region))
pl
#Change the points to be larger empty circles. (You'll have to go back and add arguments to geom_point() and reassign it to pl.) You'll need to figure out what shape= and size=
pl <- ggplot(data=df_economist,aes(x=CPI,y=HDI)) + geom_point(aes(color=Region),shape=1,size=3)
pl
#Add geom_smooth(aes(group=1)) to add a trend line
pl <- ggplot(data=df_economist,aes(x=CPI,y=HDI)) + 
  geom_point(aes(color=Region),shape=1,size=3) +
  geom_smooth(aes(group = 1))
pl
#We want to further edit this trend line. Add the following arguments to geom_smooth (outside of aes):
pl <- ggplot(data=df_economist,aes(x=CPI,y=HDI)) + 
  geom_point(aes(color=Region),shape=1,size=3) +
  geom_smooth(aes(group = 1),method = 'lm',formula = y ~ log(x),se = FALSE, color="red")
  
pl
#add label
pl <- ggplot(data=df_economist,aes(x=CPI,y=HDI)) + 
  geom_point(aes(color=Region),shape=1,size=3) +
  geom_smooth(aes(group = 1),method = 'lm',formula = y ~ log(x),se = FALSE, color="red")+
  geom_text(aes(label=Country))
pl


# Subset the data frame for countries to label
pl <- ggplot(df_economist,aes(x=CPI,y=HDI,color=Region)) + geom_point()
pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

pl3 <- pl + geom_text(aes(label = Country), color = "gray20", 
                       data = subset(df_economist, Country %in% pointsToLabel),check_overlap = TRUE)
pl3

pl4 <- pl3 + theme_bw() 
pl4

pl5 <- pl4 + scale_x_continuous(name = "Corruption Perceptions Index, 2011 (10=least corrupt)",
                                limits = c(.9, 10.5),breaks=1:10) 
pl5

pl6 <- pl5 + scale_y_continuous(name = "Human Development Index, 2011 (1=Best)",
                                limits = c(0.2, 1.0))
pl6

pl6 + ggtitle("Corruption and Human development")

library(ggthemes)
pl6 + theme_economist_white()