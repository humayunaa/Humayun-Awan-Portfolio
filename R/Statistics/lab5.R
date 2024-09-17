#problem1
#(i)
#PDF, x=120

#(a)
#Normal Distribution, mean=100, var=50
#?Normal
sd <- 50^0.5
dnorm(120, 100, sd)

#(b)
#Uniform distribution interval[90,170]
?Uniform
dunif(120, 90, 170)

#(ii)
# P(80 < N(100,50) < 110)

?Normal
###NOT DONE###

#(iii)
# Find 95th Percentile
#(a) normal distribution mean=100, var=50
?Normal
sd = 50^0.5
qnorm(.95, 100, sd)

#(b)
?Uniform
qunif(.95, 90, 170)

#problem3
#(i)
#(a)
# x=0.5, t-distribution 5 degrees freedom
?TDist
dt(0.5, 5)

#(b)
?FDist
df(0.5, 2, 7)

#(ii)
#plot, lines, labelled graph, PDF, following
# x - (-3.5, 3.5)

#(a)
x <- -3.5:3.5
?TDist
PDFt5 <- dt(x, 5)
plot(x, PDF, type="l", col="blue", lwd=2)

#(b)
PDFt10 <- dt(x, 10)
lines(x, PDFt10, col="red", lwd=2)

#(c)
?NegBinomial
sd_N01 <- 1^0.5
PDF_N01 <- dnorm(x, 0, sd_N01)
lines(x, PDF_N01, col="orange", lwd=2)

#(iv)
?TDist
#(a)
1 - pt(-1.2, 5)

#(b)
t20_v1 <- 1 - pt(1, 20)
t20_v2 <- pt(-1, 20)

1 - (t20_v1 + t20_v2)

#(c)

?FDist
1 - pf(1.5, 2, 7)

#(v)
### quantile - qt
#(a)
qt(0.38, 5)

#(b)
qf(0.38, 2, 7)
?FDist

#(vii)
?FDist
set.seed(59)
S <- rf(500, 2, 7)

# Calculate proportion of simulated values greater than 1.5
#(a)
empirical_prob <- sum(S > 1.5) / length(S)
empirical_prob

#(b)
# Calculate the x value for which P(F_{2, 7} < x) = 0.38
quantile_value <- quantile(S, 0.38)
quantile_value