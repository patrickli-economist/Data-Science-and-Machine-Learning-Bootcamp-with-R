#Ex 1: Create a function that will return the product of two integers.
prod <- function(input1,input2){
  result = input1 * input2
  print(paste(result))
}
#Ex 2: Create a function that accepts two arguments, an integer and a vector of integers. It returns TRUE if the integer is present in the vector, otherwise it returns FALSE. Make sure you pay careful attention to your placement of the return(FALSE) line in your function!
num_check<- function(input1,input2){
  a <- input1 %in% input2
  print(a)
}
#Ex 3: Create a function that accepts two arguments, an integer and a vector of integers. It returns the count of the number of occurences of the integer in the input vector.
num_count <- function(para1, para2){
  count <- 0
  for (item in para2){
    if (para1 == item){
      count <- count+1
    }
  }
  print(count)
}
#Ex 4: We want to ship bars of aluminum. We will create a function that accepts an integer representing the requested kilograms of aluminum for the package to be shipped. To fullfill these order, we have small bars (1 kilogram each) and big bars (5 kilograms each). Return the least number of bars needed.
#For example, a load of 6 kg requires a minimum of two bars (1 5kg bars and 1 1kg bars). A load of 17 kg requires a minimum of 5 bars (3 5kg bars and 2 1kg bars).
bar_count <- function(weight){
  five_amount <- weight %/% 5
  one_amount <- weight %% 5
  result <- five_amount + one_amount
  print(result)
}
#Ex 5: Create a function that accepts 3 integer values and returns their sum. However, if an integer value is evenly divisible by 3, then it does not count towards the sum. Return zero if all numbers are evenly divisible by 3. Hint: You may want to use the append() function.
summer <- function(para1, para2,para3){
  initial_vector <- c(para1, para2, para3)
  initial_vector [initial_vector %% 3==0] <- 0
  result <- sum(initial_vector)
  print(result)
}
#Ex 6: Create a function that will return TRUE if an input integer is prime. Otherwise, return FALSE. You may want to look into the any() function. There are many possible solutions to this problem.
prime_check <- function(n) {
  if (n <= 1) {
    return(FALSE)  # Numbers less than or equal to 1 are not prime
  }
  if (n == 2) {
    return(TRUE)   # 2 is the only even prime number
  }
  if (n %% 2 == 0) {
    return(FALSE)  # Exclude even numbers greater than 2
  }
  # Check if there are any divisors other than 1 and n itself
  return(!any(n %% 2:floor(sqrt(n)) == 0))
}