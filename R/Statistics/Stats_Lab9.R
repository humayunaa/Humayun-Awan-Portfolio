# Problem 1
#(i_ii)
data <- c(4.8, 7.6, 1.2, 3.5, 2.9, 0.8, 0.5, 2.3)

sample(data, replace=TRUE)

set.seed(19)
estimate <- rep(0, 1000)
for(i in 1:1000){
  x <- sample(data, replace=TRUE)   #will be different every time #ignore exp(l)
  estimate[i] <- mean(x)
}

hist(estimate)
estimate_density <- density(estimate)
#lines(estimate_density, col="red")

mean(estimate_density)
estimate_density

empirical_estimate <- estimate/length(estimate)
empirical_estimate
lines(empirical_estimate, col="blue")
mean(empirical_estimate)
sd(empirical_estimate)

#(iv)
?Chisquare
?replicate

#(a) #(b)
set.seed(19)

rchisq(data, df=5)
estimate_2 <- rep(0, 1000)

for (i in 1:1000) {
  y <- rchisq(data, df = 4.5)  # Generating chi-squared samples
  estimate_2[i] <- mean(y)  # Calculating the mean of each sample
}

hist(estimate_2, prob=TRUE, breaks = 20)

#(c)
lines(density(estimate_2), col="blue", lwd=2)

#(d)
empirical_estimate2 <- estimate_2/length(estimate_2)
mean(empirical_estimate2)
sd(empirical_estimate2)

#problem2
?Binomial
# Random variable X follows binomial distribution with parameters n=12 and p,
# where p is a random variable with Beta distribution with parameters a=2 and
# b=3. Using set.seed(79) and M=10,000 simulations with a for loop calculate the
# empirical mean and variance of X. Compare these to the theoretical mean and
# variance of X.

set.seed(79)

M <- 10000

n <- 12

a <- 2
b <- 3
p_vals <- rbeta(M, a, b)

x <- numeric(M)

for(i in 1:10000){
  p <- p_vals[i]
  x[i] <- rbinom(1, n, p)
}
x
mean(x)
emp_mean <- mean(x)
emp_var <- var(x)

emp_mean
emp_var

theo_mean <- n * (mean(p_vals))
theo_mean

theo_var <- (n * (var(p_vals) * (1 - (var(p_vals)))))^0.5
theo_var
var(p_vals)