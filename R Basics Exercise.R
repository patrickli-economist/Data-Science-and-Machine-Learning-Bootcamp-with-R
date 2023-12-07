#What is two to the power of five?
2^5

#Create a vector called stock.prices with the following data points: 23,27,23,21,34
stock_price <- c(23,27,23,21,34)

#Assign names to the price data points relating to the day of the week, starting with Mon, Tue, Wed, etc...
#using name function
stock_price <- c(23,27,23,21,34)
week_day <- c("mon","tue","wed","tur","fri")
names(stock_price) <- c(week_day)

#What was the average (mean) stock price for the week? (You may need to reference a built-in function)
mean(stock_price)

#Create a vector called over.23 consisting of logicals that correspond to the days where the stock price was more than $23
#Use the over.23 vector to filter out the stock.prices vector and only return the day and prices where the price was over $23
over_23 <- stock_price[stock_price>23]

#Use a built-in function to find the day the price was the highest
stock_price[stock_price==max(stock_price)]




