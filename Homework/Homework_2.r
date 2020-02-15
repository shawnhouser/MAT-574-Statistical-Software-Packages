# Shawn Houser
# 2019-10-04
# Homework 2

# 1.a
seq(from = 1, to = 21, by = 2)
# [1]  1  3  5  7  9 11 13 15 17 19 21

# 1.b
seq(from = 50, to = 1, by = -3)
# [1] 50 47 44 41 38 35 32 29 26 23 20 17 14 11  8  5  2

# 1.c
2^(0:10)
# [1]    1    2    4    8   16   32   64  128  256  512 1024
 
# 1.d
matrix(1:16, nrow = 4, ncol = 4, byrow = TRUE)

# 2.a
v2a <- rep(1:4, rep(5, 4))

# 2.b
v2b <- sample(v2a, 20)

# 2.c
v2c <- sapply(v2b, function(x) switch(x, "A", "B", "C", "D"))

# 3.a
B <- matrix(rnorm(10*11, 0, 1), nrow = 10, ncol = 11)

# 3.b
apply(B, 1, max)

# 3.c
apply(B, 2, sd)

# 3.d
b = B[,ncol(B)] # Extract the last column
B = B[,0:(ncol(B)-1)] # Remove the last column
# This changes B so it is no longer the same.
# I could use a different variable name to
# save the original B.

# 3.e
solution <- solve(B, b)

# 3.f
apply(B, 1, sum)
# Yes, I could do this in a loop

# 3.g
A = matrix(rep(0, ncol(B)^2), ncol = ncol(B))
for (i in 1:ncol(B)) {
        sum = 0
        for (j in 1:ncol(B)) {
                sum = sum + B[i,j]
                A[i,j] = sum
        }
}

# 4.a
D <- diag(1/(1:10), nrow = 10, ncol = 10)

# 4.b
U <- diag(5, nrow = 10, ncol = 10) - 1

# 4.c
# The length of the first column vector is 10
U <- scale(U)

# 4.d
X <- U %*% D %*% t(U)

# 4.e
eigen(X)$values
# [1] 9.242802e+00 4.655580e+00 3.117203e+00 2.344299e+00 1.878553e+00
# [6] 1.566690e+00 1.342750e+00 1.173439e+00 1.039398e+00 2.147340e-16

# 4.f
# I am unsure. I know that vector recycling will
# try and coerce vectors to be of equal length
# by repeating one. But my linear algebra skills
# are lacking to see how I could use this to
# to matrix multiplication.
# If the question is just asking if it possible
# I would say no

# 5.a
v5a <- 1:12

# 5.b
cat(v5a[3], v5a[7], v5a[1], v5a[9], sep = ", ")

# 5.c
v5c <- seq(from = 3.4, to = 9.6, length.out = 32)

# 5.d
match(8.0, v5c)
# 24th element

# 5.e
rep(1:5, rep(4, 5))

# 6.setup
m2<-matrix(c(1,6,3,2,3,2,7,1,4,12,8,8,2,9,9,0),4,4)

# 6.a
m2[,2]

# 6.b
m2[3,4]

# 6.c
m[2,2] = 3

# 6.d
diag(m2)

# 7.a
v7a <- rnorm(200, 4, 2)

# 7.b
sum(v7a < 2)
# 29

# 7.c
sum(3 < v7a & v7a < 5)
# 74

# 7.d
mean(v7a)
# [1] 3.970883
sd(v7a)
# [1] 1.863468

# 8.a
file <- read.table("~/hw2example.dat")

# 8.b
dim(file)
# 230x5

# 8.c
fourth <- file[,4]
mean(fourth)
sd(fourth)
min(fourth)
max(fourth)
# They all give NA
mean(fourth, na.rm = TRUE)
sd(fourth, na.rm = TRUE)
min(fourth, na.rm = TRUE)
max(fourth, na.rm = TRUE)
# [1] 4.92087
# [1] 1.028961
# [1] 2.091993
# [1] 7.929153

# I am unsure of what you mean by return
# Do you want me to ouput it to the screen with
# print?
# 8.d

# 8.e

# 8.f
which(is.na(file))
which(is.na(file[1]))
which(is.na(file[2]))
which(is.na(file[3]))
which(is.na(file[4]))
which(is.na(file[5]))
# [1] 328 464 675 816 932
# integer(0)
# [1] 98
# [1]   4 215
# [1] 126
# [1] 12












