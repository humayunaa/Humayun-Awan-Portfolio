#Problem1
#(i)

# prob male child is 0.51 independetly
# (a)
---
# (b)
# 3 failures before 1st success - 4th child is male
dgeom(3, .51)

#(ii)
num_daughters_prob = c(dgeom(0, .51),
dgeom(1, .51),
dgeom(2, .51),
dgeom(3, .51),
dgeom(4, .51),
dgeom(5, .51),
dgeom(6, .51),
dgeom(7, .51),
dgeom(8, .51),
dgeom(9, .51),
dgeom(10, .51))

num_daughters_prob
num_daughters = c(0:10)
num_daughters

barplot(num_daughters_prob, names.arg = num_daughters,
        xlab = "Number of Daughters",
        ylab = "Probability",
        main = "Daughters before 1st Son",
        col = "blue")

#(iii)
#(a)
iii_a = pgeom(4, .51)   # correct

#(b)
iii_b = 1 - pgeom(2, .51)   ## 2 not 1. MORE THAN 2 not 2 or more. # correct


#(c)
iii_c = pgeom(1, .51) - pgeom(0, .51)
   # correct

#(iv)
?Geometric
x = 0:10
y = c(dgeom(0, .51),
      dgeom(1, .51),
      dgeom(2, .51),
      dgeom(3, .51),
      dgeom(4, .51),
      dgeom(5, .51),
      dgeom(6, .51),
      dgeom(7, .51),
      dgeom(8, .51),
      dgeom(9, .51),
      dgeom(10, .51))

CDF <- cumsum(y)
# cumsum() = CDF values for each point
# ecdf() = CDF function

length(CDF)

# graph
plot(x, CDF, type = "s", lwd = 2, col = "blue", main = "Stepped Graph",
     xlab = "Number of Daughters", ylab = "CDF")
grid()

#(v)
# pgeom(n, p) >= k --- qgeom(k, p) = n
# (a)
qgeom(0.9, 0.49)

# (b)
answer = 1 - qgeom(0.4, 0.49) # same as qgeom(0.6, 0.49)
answer

#(vi_vii)
#ensure same random
set.seed(47)

G <- rgeom(1000, 0.49)

counts <- table(G)
counts
empirical_probs <- counts / length(G)
empirical_probs

iii_a
iii_b
iii_c

counts1 <- c(iii_a, iii_b, iii_c)
counts1
counts1_table <- table(counts)
counts1_table

emp2 <- counts1_table / length(G)
emp2

#problem2
qbinom(0.588, 4, 0.6) ##3: correct

qbinom(0.222, 4, 0.6) ##2: correct

qbinom(0.906, 4, 0.6) ##4: correct