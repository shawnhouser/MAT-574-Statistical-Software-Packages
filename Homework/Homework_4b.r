# Shawn Houser
# 2019-11-17
# Homework 4

# 1
factorial.n <- function (n) {
	res <- 1
	if (n == 0) {
		return(1)
	}
	for (i in 1:n) {
		res = res * i
	}
	return(res)
}

factorial.n(0)
# [1] 1
factorial.n(5)
# [1] 120
factorial.n(10)
# [1] 3628800



# 2
matrix.vector <- function (A, b) {
	height <- nrow(A)
	width <- ncol(A)	
	result_vector <- rep(0, times = width)
	for (x in 1:width) {
		for (y in 1:height) {
			result_vector[x] <- result_vector[x] +  b[x] * A[y, x]
		}
	}
	return(result_vector)
}

matrix.vector(matrix(c(1, 1, 1, 2, 2, 2), nr = 2, byrow = T), c(11, 22, 33))
# [1] 33 66 99



# 3
least.squares <- function (x, y) {
	bnum <- sum((x - mean(x)) * (y - mean(y)))
	b <- bnum / sum((x - mean(x))**2)
	a <- mean(y) - b * mean(x)
	return(c(b, a))
}

x <- c(1000, 550, 97, 90, 85, 126, 300, 110, 65, 650, 600, 660, 270, 680, 540, 600, 330)
y <- c(600, 625, 560, 585, 590, 500, 700, 570, 540, 785, 765, 611, 600, 625, 650, 635, 522)

least.squares(x, y)
# [1]   0.1398863 559.9028013
lm(y ~ x)

# Call:
# lm(formula = y ~ x)

# Coefficients:
# (Intercept)            x  
#    559.9028       0.1399



# 4
sinc <- function (x, iter) {
	result <- 0	
	for (i in 0:iter) {
		exp = i * 2
		denom = exp + 1
		val = (x ** exp) / factorial.n(denom)
		if (i %% 2 == 0) {
			result = result + val
		} else {
			result = result - val
		}
	}
	return(result)
}

sinc(0.01, 1000)
# [1] 0.9999833



# 5
mean.st.dev <- function (x) {
	total <- 0
	for (i in x) {
		total = total + i
	}
	mean <- total / length(x)

	total_squared <- 0
	for (i in x) {
		total_squared = total_squared + ((i - mean) ** 2)
	}

	std = sqrt(total_squared / (length(x) - 1))
	return(c(mean, std))
}

mean.st.dev(x)
# [1] 397.2353 282.9316
mean(x)
# [1] 397.2353
sd(x)
# [1] 282.9316

