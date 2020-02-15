# Shawn Houser
# 2019-10-16
# Homework 3

# 1.a.1
pnorm(2.1, mean = 2, sd = 1)
# [1] 0.5398278

# 1.a.2
1 - pnorm(1.75, mean = 2, sd = 1)
# [1] 0.5987063

# 1.b
pnorm(85, mean = 75, sd = 12) - pnorm(70, mean = 75, sd = 12)
# [1] 0.4592105

# 1.c
qnorm(.90, mean = 75, sd = 12)
# [1] 90.37862

# 1.d
rpois(20, 8)
# [1] 12  9  6  7 12  7  5  6  7  9  4  9 13  8 16  6  6 10  9  8

# 1.e
sum(rbinom(50, 5, 0.5) >= 3) / 50
# 50 coin flips --> rbinom(50, 5, 0.5) 
# count number of >= 3 --> sum(rbinom(50, 5, 0.5) >= 3)
# result
# [1] 0.5

# 1.f
1 - pt(-1, df = 3)
# [1] 0.8044989
1 - pt(-1, df = 7)
# [1] 0.8246917
1 - pt(-1, df = 13)
# [1] 0.8322194
1 - pt(-1, df = 100)
# [1] 0.8401379

# 2
mat <- matrix(rep(0, times = 16), nrow = 4, ncol = 4)
for (i in 1:4) {
    mat[i,] = runif(4, min = 1, max = 20)
}

mat
#           [,1]      [,2]      [,3]      [,4]
# [1,] 10.611310 11.025253  4.592883  1.823533
# [2,] 12.932352 12.425576  7.057476  5.189047
# [3,]  6.877255 13.021174 10.187189 16.625135
# [4,] 12.281555  1.127227  1.791553 15.967811

# 3
print_sum <- function(i) {
    for (j in 1:i) {
        cat("Sum from 1 to ", j, " is ", sum(1:j), "\n")
    }
}

print_sum(4) 
# Sum from 1 to  1  is  1 
# Sum from 1 to  2  is  3 
# Sum from 1 to  3  is  6 
# Sum from 1 to  4  is  10

# 4
vec1 <- runif(100, min = 1, max = 3)
vec2 <- runif(100, min = 1, max = 3)
vecR <- rep(0, times = 100)
for (i in 1:100) {
    if ( vec1[i] < 2 & vec2[i] < 2 ) {
        vecR[i] = "A"
    } else if ( vec1[i] < 2 & vec2[i] >= 2) {
        vecR[i] = "B"
    } else if ( vec1[i] >= 2 & vec2[i] < 2) {
        vecR[i] = "C"
    } else {
        vecR[i] = "D"
    }
}
#vecR
#  [1] "D" "C" "B" "A" "A" "C" "A" "A" "C" "A" "B" "C" "C" "B" "B" "B" "D" "B"
# [19] "A" "A" "B" "D" "C" "C" "D" "B" "B" "A" "C" "B" "D" "B" "C" "A" "A" "D"
# [37] "C" "C" "D" "D" "C" "C" "C" "D" "B" "D" "C" "D" "B" "B" "D" "A" "C" "B"
# [55] "C" "A" "A" "D" "A" "C" "B" "A" "B" "C" "B" "C" "B" "C" "C" "A" "C" "D"
# [73] "D" "C" "A" "A" "A" "B" "D" "A" "B" "B" "B" "C" "B" "D" "A" "A" "D" "D"
# [91] "A" "C" "C" "C" "A" "B" "A" "A" "D" "D"
