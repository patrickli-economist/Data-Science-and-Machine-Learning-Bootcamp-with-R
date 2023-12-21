#Ex 1: Write a script that will print "Even Number" if the variable x is an even number, otherwise print "Not Even":
if (x%%2 == 0){
  print ("x is a even number")
}else{
  print("not even")
}
#Ex 2: Write a script that will print 'Is a Matrix' if the variable x is a matrix, otherwise print "Not a Matrix". Hint: You may want to check out help(is.matrix)
if (is.matrix(x)==TRUE){
  print("x is a matrix")
}else{
  print("x is not a matrix")
}

#Ex 3: Create a script that given a numeric vector x with a length 3, will print out the elements in order from high to low. You must use if,else if, and else statements for your logic. (This code will be relatively long)


smaller <- c(0, 0)
larger <-c(0, 0)
largest <-c(0)
smallest <-c(0)
if (x[1]>x[2]){
  larger[1]=x[1]
  smaller[1]=x[2]
}else{
  larger[1]=x[2]
  smaller[1]=x[1]
}
if (x[2]>x[3]){
  larger[2]=x[2]
  smaller[2]=x[3]
}else{
  larger[2]=x[3]
  smaller[2]=x[2]
}
if (larger[1]>larger[2]){
  largest[1]=larger[1]
}else{
  largest[1]= larger[2]
}
if (smaller[1]<smaller[2]){
  smallest[1]=smaller[1]
}else{
  smallest[1]=smaller[2]
}
z <-c(largest[1],smallest[1])
mid <- setdiff(x, z)
result <- c(largest[1],mid, smallest[1])
print(result)

#Ex 4: Write a script that uses if,else if, and else statements to print the max element in a numeric vector with 3 elements.
smaller <- c(0, 0)
larger <-c(0, 0)
largest <-c(0)
smallest <-c(0)
if (x[1]>x[2]){
  larger[1]=x[1]
  smaller[1]=x[2]
}else{
  larger[1]=x[2]
  smaller[1]=x[1]
}
if (x[2]>x[3]){
  larger[2]=x[2]
  smaller[2]=x[3]
}else{
  larger[2]=x[3]
  smaller[2]=x[2]
}
if (larger[1]>larger[2]){
  largest[1]=larger[1]
}else{
  largest[1]= larger[2]
}
if (smaller[1]<smaller[2]){
  smallest[1]=smaller[1]
}else{
  smallest[1]=smaller[2]
}
z <-c(largest[1],smallest[1])
mid <- setdiff(x, z)
result <- c(largest[1])
print(result)



