data("iris")
head(iris)
str(iris)
#standardize
scaled_features <- scale(iris[, 1:4])
standardized_iris <- data.frame(scaled_features, Species = iris$Species)
df <- standardized_iris
#split
set.seed(123)
training_size <- floor(0.7 * nrow(df))
training_indices <- sample(seq_len(nrow(df)), size = training_size)
train_set <- df[training_indices, ]
test_set <- df[-training_indices, ]
#train and test
library(class)
train_features <- train_set[, -5] 
test_features <- test_set[, -5]
train_labels <- train_set$Species
knn_pred <- knn(train = train_features, test = test_features, cl = train_labels, k = 1)
print(knn_pred[1:10])
#misclassification rate
incorrect_predictions <- sum(knn_pred != test_set$Species)
total_predictions <- length(knn_pred)
misclassification_rate <- incorrect_predictions / total_predictions
print(misclassification_rate)
#choose k
# Prepare variables to store k values and corresponding error rates
k_values <- 1:10
error_rates <- numeric(length(k_values))

# Loop through k values
for (k in k_values) {
  # Predict using knn
  knn_pred <- knn(train = train_features, test = test_features, cl = train_labels, k = k)
  
  # Calculate misclassification rate
  error_rates[k] <- mean(knn_pred != test_set$Species)
}

# Plot the error rates
plot(k_values, error_rates, type = "b", col = "blue", xlab = "k Value", ylab = "Misclassification Rate",
     main = "Error Rate vs. k Value for KNN on Iris Dataset")