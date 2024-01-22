data <- read.csv("adult_sal.csv")
data <- data[,-1]
frequency <- table(data$type_employer)
data$type_employer <- as.character(data$type_employer) # Convert to character in case it's a factor
data$type_employer <- ifelse(data$type_employer %in% c("Never-worked", "without-pay"), 
                             "unemployed", 
                             data$type_employer)
data$type_employer <- as.factor(data$type_employer)
table(data$type_employer)

data$type_employer <- as.character(data$type_employer)
data$type_employer[data$type_employer == "State-gov" | data$type_employer == "Local-gov"] <- "SL-gov"
data$type_employer[data$type_employer == "Self-emp-inc" | data$type_employer == "Self-emp-not-inc"] <- "self-emp"
data$type_employer <- factor(data$type_employer)
data$type_employer <- droplevels(data$type_employer)

#split
library(caTools)
set.seed(123) 
split <- sample.split(data$type_employer, SplitRatio = 0.7)
trainSet <- data[split, ]
testSet <- data[!split, ]
cat("Training set rows:", nrow(trainSet), "\n")
cat("Test set rows:", nrow(testSet), "\n")

#logistic regression in the training set
trainSet_factors <- lapply(trainSet, as.factor)
trainSet <- as.data.frame(trainSet_factors)

#regression
model <- glm(income ~ marital, family = binomial(), data = trainSet)
summary(model)
#test
testSet$predicted.income = predict(model, newdata=testSet, type="response")
predicted_classes <- ifelse(predicted_probabilities >= 0.2, 1, 0) #just for try---should be 0.5
actual_classes <- testSet$income
confusion_matrix <- table(Predicted = predicted_classes, Actual = actual_classes)
print(confusion_matrix)