############apply function in R##############


# General structure : apply(object, margin, function)
# Minimum 3 arguments (object, margin, function)
# 1st argument is the object we are working with
# 2nd specifies which dimension to iterate over(1 = row, 2 = column,
#                                               c(1,2) = both)
# 3rd specifies the function we want to apply

data <- matrix(c(10,20,30,40,50,60,70,80,90,100,110,120,130,140,150),
                    nrow = 5, byrow = FALSE)
data

rownames(data) <- c("Day1", "Day2", "Day3", "Day4", "Day5")
colnames(data) <- c("TV", "Radio", "Newspaper") 

data

class(data)  # verify whether it is a matrix

max(data)

max(data[1,]) # max sales by 1st row
max(data[2,]) # max sales by 2nd row
max(data[3,]) # max sales by 3rd row

max(data[,1])  # max sales by 1st column
max(data[,2])  # max sales by 2nd column
max(data[,3])  # max sales by 3rd column

# to get the max or min from each rows and columns requires a lot of writing
# a for loop also involves a fair amount of coding

 for(i in 1:5){
  row <- data[i,]
  max <- max(row)
  print(max)
}

# Apply functions allow us to do same thing with less writing

apply(data, 1, max)  # [object = data, margin = 1(row), func = max]

# Here the max func took each row as an input one by one and all the individual
# outputs were compiled into a single output

apply(data, 2, max)  # [object = data, margin = 2(row), func = max]

Sales.df <- data.frame (TV = c(10, 20, 30, 90, 50, 60),
                        Radio = c(20, 50, 30, 40, 80, 60),
                        Newspaper = c(30, 20, 50, 40, 9, 60),
                        Computer = c(60, 45, 78, 92, 45.78, 56.7))

class(Sales.df)
Sales.df
apply(Sales.df, 1, mean)


# Data frames are not always simple. This one is matrix like.
# All the elements in the df are numeric, but they don't have to be

Sales.df$ Day <- as.factor(1:6)
Sales.df

Sales.df <- Sales.df[,c(5, 1:4)]
Sales.df
class(Sales.df$Day)

apply(Sales.df, 1, mean)

# The command does not work because we added factor to every row. We cannot
# calculate mean of numeric values and factors. But we can exclude the day column
# b indicing the respective columns

apply(Sales.df[,2:4], 1, mean)

# The day factor was excluded from the calculation of the mean, by selecting the
# columns we wanted to include.
# We can also easily specify the columns that we want to exclude.

apply(Sales.df[,-1], 1, mean)

# negative sign exlcuded the first column, -2 for 2nd column and so on.

apply(Sales.df[, -c(1,2,4)], 1, mean)
Sales.df
Sales.df[4,5] <- NA
Sales.df

apply(Sales.df[, -1], 1, mean)

# We can ignore this NA and get a numeric output of this row.

apply(Sales.df[,-1], 1, mean, na.rm = TRUE)

# We can make our own func that does not exist and apply

data

percent <- function(x){x/max(x)}

apply(data, 2, percent)


#**************************************************************************

# lapply()
# Genreal structure: lapply(object, func,...)
# object = list, Df, Vector
# Output = List

year <- list(Jan = c(2,4,5,3,7,8,3,3,3,9), Feb = c(9,4,5,7,7,8,5,3,3,2),
             Mar = c(12,7,5,3,2,8,3,7,3,9), Apr = c(2,6,5,5,7,8,3,5,9,3),
             May = c(2,4,3,7,8,3,4,3,9,6))
year

lapply(year, mean)

# Can also be applied to df

year.df <- data.frame(Jan = c(2,4,5,3,7,8,3,3,3,9), Feb = c(9,4,5,7,7,8,5,3,3,2),
                      Mar = c(12,7,5,3,2,8,3,7,3,9), Apr = c(2,6,5,5,7,8,3,5,9,3),
                      May = c(2,4,3,7,8,3,4,3,9,6))

year.df

lapply(year.df, mean)

# We don't have to specify the margin in lapply(),
# it is assumed we are working with the columns.

# Also works well on vectors

random <- c("Welcome to Sankhkyiki Robotics")
random

lapply(random, nchar)

random <- c("Welcome", "to", "Sankhkyiki", "Robotics")
random

lapply(random, nchar)
nchar(random)

# Same output but lapply() returns the output in the form of a list
# rather than a vector


#**************************************************************************

# sapply()
# General structure: sapply(object, func, ...)
# Object = List, Df, Vector
# Output is simplified if possible, it will be returned as vector or a matrix
# instead of a list if it is possible to simplify the output in this way.


year

sapply(year, mean)         # Output in the form of vector 

sapply(year.df, mean)
# Same o/p. aaply() does the same thing but we have to specify the margin.

sapply(random, nchar)
# We get a nice vector based output with the actual elements written as headings above the respective output


sequence <- function(x){
  seq(nchar(x))
}

seq(4)
seq(5)

sapply(random, sequence)

# We get a  list returned.
# All the sequences are different in lenght,
# so R cannot combine them to form a matrix, it cannot simplify further.


#**************************************************************************


# tapply()
# General structure: tapply(x, Index, func, ...)
# x = Vector, Column of a df, Element of a list.

StudentID <- 1:18
StudentID

Age <- c(32,45,34,57,35,89,22,36,78,64,28,21,13,18,33,41,68,37)
Age

Treatment <- c('a', 'c', 'c', 'c', 'b', 'b', 'a', 'a', 'a', 'b', 'b', 'b',
               'c','c','b','a','a','c')
Treatment

mean(Age)
tapply(Age, Treatment, mean)

# This func says that Age is the vector to which we want to perform a func,
# the treatment vector holds the group that will be used to subset the vector
# and mean will be th func that will be applied to each subset of Age vector

school.df <- data.frame(StudentID, Treatment, Age)
school.df

tapply(school.df$Age, school.df$Treatment, mean)

# In order to refer to a specific column in a df that is not attached, we have to 
#type the name of df followed by a dollar sign and then the name of the column.

school.list <- list(StudentID = StudentID, Treatment = Treatment, Age = Age)
school.list

tapply(school.list$Age, school.list$Treatment, mean)


#**************************************************************************

# Note: The plyr and dplyr func packages in R also provide many equivalent
# options to many members of the apply() family.