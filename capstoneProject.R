batting <-read.csv("Batting.csv")
head(batting)
#Use str() to check the structure. Pay close attention to how columns that start with a number get an 'X' in front of them! You'll need to know this to call those columns!
str(batting)
#Call the head() of the first five rows of AB (At Bats) column
head(batting$AB)
#Call the head of the doubles (X2B) column
head(batting$X2B)
#the Batting Average is equal to H (Hits) divided by AB (At Base). So we'll do the following to create a new column called BA and add it to our data frame:
batting$BA <- batting$H / batting$AB
#Now do the same for some new columns! On Base Percentage (OBP) and Slugging Percentage (SLG). Hint: For SLG, you need 1B (Singles), this isn't in your data frame. However you can calculate it by subtracting doubles,triples, and home runs from total hits (H): 1B = H-2B-3B-HR
batting$OBP <- (batting$H + batting$BB + batting$HBP)/(batting$AB + batting$BB + batting$HBP + batting$SF)
batting$X1B <- batting$H - batting$X2B - batting$X3B - batting$HR
batting$SLG <- ((1 * batting$X1B) + (2 * batting$X2B) + (3 * batting$X3B) + (4 * batting$HR) ) / batting$AB
#Load the Salaries.csv file into a dataframe called sal using read.csv
sal <-read.csv("salaries")
#contain batting data from 1985 and onwards
batting <- batting[batting$yearID>=1985,]
#merge
combo <- merge(batting, sal, by = c('playerID', 'yearID'))
#lost players
lost_players <- subset(combo,playerID %in% c('giambja01','damonjo01','saenzol01') )
#year==2001
lost_players_2001 <- subset(lost_players,yearID==2001)
#summary
mean(lost_players_2001$AB)
mean(lost_players_2001$OBP)
#SUBSAMPLE OF YEAR 2001 IN COMBO
