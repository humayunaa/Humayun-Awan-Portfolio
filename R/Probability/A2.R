install.packages("extraDistr")
install.packages("EnvStats")
library(extraDistr)
library(EnvStats)


###TASK1
# generate 10000 random numbers from the exponential distribution with mean 2 (means rate = 1/2)
x <- rexp(10000, rate = 1/2)

# plot histogram with 40 bins(no. of rectangles) and relative frequencies
hist(x, breaks = 40, freq = FALSE, col = "yellow", main = "Histogram of Exponential Distribution", ylab = "Frequency")

# add the density curve of the exponential distribution to the histogram
curve(dexp(x, rate = 1/2), col = "red", add = TRUE)


###TASK2
# calculate the square root of the number of data
n <- length(x)
k <- round(sqrt(n))

# plot histogram with square root of number of data bins and relative frequencies
hist(x, breaks = k, col = "blue", probability = TRUE, main = "Histogram with square root of number of data bins", ylab = "Density")


###TASK3
x <- rnorm(10000)

# plot histogram with 40 bins and relative frequencies
hist(x, breaks = 40, col = "purple", freq = FALSE, main = "Histogram of Standard Normal Distribution with 40 bins")

# add the density curve of the standard normal distribution to the histogram
curve(dnorm(x), col = "red", add = TRUE)

# plot histogram with 100 bins and relative frequencies
hist(x, breaks = 100, col = "green", freq = FALSE, main = "Histogram of Standard Normal Distribution with 100 bins")

# add the density curve of the standard normal distribution to the histogram
curve(dnorm(x), col = "red", add = TRUE)

# plot histogram with 500 bins and relative frequencies
hist(x, breaks = 500, col = "pink", freq = FALSE, main = "Histogram of Standard Normal Distribution with 500 bins")

# add the density curve of the standard normal distribution to the histogram
curve(dnorm(x), col = "red", add = TRUE)


###TASK4
#Generates 10,000 random deviates
r <- rpareto(10000, 1, 1) 
hist(r, breaks = 40, col = "violet")
#problem = only 1 column


###TASK5
alpha <- 0.5
q <- rpareto(10000, 1, alpha)
hist(q, col= "navy", main = "Pareto Distribution α = 0.5", xlab = "x")


alpha <- 1
q <- rpareto(10000, 1, alpha)
hist(q, col= "black", main = "Pareto Distribution α = 1", xlab = "x")


alpha <- 1.5
q <- rpareto(10000, 1, alpha)
hist(q, col= "brown", main = "Pareto Distribution α = 1.5", xlab = "x")


alpha <- 2
q <- rpareto(10000, 1, alpha)
hist(q, col= "orange" , main = "Pareto Distribution α = 2", xlab = "x")
# Little to no change in variance when alpha changes value


###TASK6
#10000 random deviated from pareto distribution with mean 1 standard deviation 1
a <- rpareto(10000, 1, 1)
t <- a[a <= quantile(a,.95)]
hist(t, col="maroon")