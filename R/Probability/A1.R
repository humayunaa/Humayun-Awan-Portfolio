################################Task-1##########

library(extraDistr)

alpha_values <- c(0.5, 1, 2, 5, 10)

r_values <- c(0.1, 1, 2, 5, 10)

par(mfrow=c(2, 3))

for (i in 1:length(alpha_values)) {
  for (j in 1:length(r_values)) {
    alpha <- alpha_values[i]
    r <- r_values[j]
    x <- seq(0, 10, length=100)
    y <- dgamma(x, shape=alpha, rate=r)
    
    if (alpha > 0) {
      type <- "p"
    } else {
      type <- "l"
    }
    plot(x, y, type=type, main=paste0("alpha=", alpha, ", r=", r),
         xlab="x", ylab="Density")
  }
}

#############################Task-2 and Task-3#################
library(extraDistr)

alpha <- runif(1, 0.5, 8)
r <- runif(1, 1, 10)

f_x <- function(x) dgamma(x, shape = alpha, rate = r)

F_x <- function(x) pgamma(x, shape = alpha, rate = r)

x <- seq(0, 10, by = 0.1)

par(mfrow = c(1, 2), mar = c(5, 5, 2, 2))
plot(x, f_x(x), type = "l", main = "Probability Density Function", xlab = "x", ylab = "f(x)")
points(x, f_x(x), type = "p")
plot(x, F_x(x), type = "l", main = "Cumulative Distribution Function", xlab = "x", ylab = "F(x)")
points(x, F_x(x), type = "p")

##########################Task-4, 5, 6#######
#!/usr/bin/env Rscripts

library(extraDistr)
par(mfrow=c(2,2)) #arrange plots next to each other in a 2 times 2 matrix

##########################TASK4############################

total = 25
random = rdunif(1, 4, 12)
m = random  # success e.g 6 balls
n = total - m
k = 9
x = seq(0, 9, 1)
y = dhyper(x, m, n, k)

plot(x, y, type="p", col="purple", lwd=2, main='Hypergeometric Distribution', xlab='No. of Successes', ylab='Density')
#help("dhyper")

############################TASK5#######################
help(dbinom)
p = m/total
y2 = dbinom(x, k, p)
plot(x, y2, type ="p", col="pink", lwd=2, main='Binomial Distribution', xlab='No. of Successes', ylab='Density')
plot(x, y, type="p", col="purple", lwd=2, main='Hypergeometric Distribution', xlab='No. of Successes', ylab='Density')
diff = y - y2
plot(x, diff, type="p", col="green", lwd=2, main="Difference of two densities", xlab='No. of Successes', ylab='Density')

############################TASK6###########################

total6 = 1000
random6 = rdunif(1, 400, 700)
m6 = random6
n6 = total6 - m6
k6 = 40
x6 = seq(0, 40, 1)
y6h = dhyper(x6, m6, n6, k6)

p6 = m6/total6
y6b = dbinom(x6, k6, p6)

plot(x6, y6b, type ="p", col="red", lwd=2, main='Binomial Distribution', xlab='No. of Successes', ylab='Density')
plot(x6, y6h, type="p", col="blue", lwd=2, main='Hypergeometric Distribution', xlab='No. of Successes', ylab='Density')
diff6 = y6h - y6b
plot(x6, diff6, type="p", col="orange", lwd=2, main="Difference of two densities", xlab='No. of Successes', ylab='Density')