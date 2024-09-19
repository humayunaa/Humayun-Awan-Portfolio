#problem1
#(i)
# Problem 1
# Exponential distribution - mean £1000

#(i)
#(a)
xsum <- rep(0, 1000)
xsum

#problem2
# Problem 2 Possion mean 10 per day

#(i)
#(a)

set.seed(29)
?Poisson
P <- rpois(1000, 10)

#(b) #(c)
hist(P, breaks = seq(-0.5, max(P) + 0.5, by = 1), prob=TRUE, col="skyblue")

#?Normal
mean_P <- mean(P)
sd_P <- sd(P)
x <- seq(min(P), max(P), length.out = 1000)
# Calculate PDF values for the normal distribution
pdf_normal <- dnorm(x, mean = mean_P, sd = sd_P)

# Superimpose the PDF of the normal distribution
lines(x, pdf_normal, col = "red", lwd = 2)

#(ii)
#(a)
#CORRECT~~~
empirical_prob <- sum(P > 10) / length(P)
empirical_prob

#(c)
##CORRECT###
?Poisson
# Calculate the exact Poisson probability of more than 10 claims in a day
prob_exact_poisson <- 1 - ppois(10, lambda = 10)
prob_exact_poisson

#(iii)
#(a) #(b)
?qqplot
qqnorm(P)
qqline(P, col="red")