# Shawn Houser
# 2019-09-24
# Homework 1

# One
15^2 * pi
# [1] 706.8583

# Two
(1:100)^2 * pi
# [1]     3.141593    12.566371    28.274334    50.265482    78.539816
# [6]   113.097336   153.938040   201.061930   254.469005   314.159265

# Three
(1:100 - 32)/1.8
# [1] -17.2222222 -16.6666667 -16.1111111 -15.5555556 -15.0000000 -14.4444444
# [7] -13.8888889 -13.3333333 -12.7777778 -12.2222222 -11.6666667 -11.1111111

# Four
onehundred <- 1:100

# Four a
sum(onehundred)
# [1] 5050

# Four b
sum(onehundred^2)
# [1] 338350

# Four c
sum(sqrt(onehundred))
# [1] 671.4629

# Five
colors <- c("red", "green", "blue")
rep(rev(colors), 98:100)

# Six
W1 <- c(rep(c(5, 8, 2), 40), rep(c(1, 4, 2, 0), 30))

# Seven
W2 <- c(
	cos(seq(from = 2, to = 240, by = 2)/7),
	1 / sqrt(1 + 0.3 * seq(from = 1, to = 240, by = 2)^2)
)

# Eight
W3 <- W1 == 4 | W1 == 8

# Nine
W4 <- ifelse(W3 == TRUE & W2 < 0.17, "B", ifelse(W3 == FALSE, "A", "C"))

# Ten
saved <- data.frame(
	"Seq" = W1,
	"Num" = W2,
	"TVal" = W3,
	"Class" = W4
)

# Ten a
class(saved)
# [1] "data.frame"

# Ten b
class(saved$Num)
# [1] "numeric"

# Ten c
class(saved$Tval)
# [1] "logical"

# Eleven
saved <- data.frame(
	"Seq" = W1,
	"Num" = W2,
	"TVal" = W3,
	"Class" = W4,
	stringsAsFactors = FALSE
)

# Eleven a
class(saved$Class)
# [1] "character"

# Twelve
saved[c(1, 4, 6, 10, 11, 20, 30, 100, 119),]
#     Seq        Num  TVal Class
# 1     5  0.9594606 FALSE     A
# 4     5  0.4149967 FALSE     A
# 6     2 -0.1429975 FALSE     A
# 10    5 -0.9598162 FALSE     A
# 11    8 -0.9999992  TRUE     B
# 20    8  0.8424943  TRUE     C
# 30    2 -0.6574631 FALSE     A
# 100   5 -0.9561910 FALSE     A
# 119   8 -0.8485703  TRUE     B

# Interim
x1 <- c(1.1, -2.3, 2.5, 0.5, -3.2, -4, -5.2, -2.2, -2.2, 3)
p1 <- c(0.1, 0.1, 0.05, 0.15, 0.2, 0.05, 0.1, 0.1, 0.05, 0.1)
x2 <- c(5, 8, 2, 3.3, 5.6, 8.2, 4.4)
f1 <- factor(c("M", "M", "F", "f", "f", "F", "m", "m", "M", "M", "F"))

# Thirteen
y1 <- x1[seq(from = 1, to = length(x1), by = 2)]
# [1]  1.1  2.5 -3.2 -5.2 -2.2

# Fourteen
y2 <- ifelse(x1 > 0, x1, 0)
# [1] 1.1 0.0 2.5 0.5 0.0 0.0 0.0 0.0 0.0 3.0

# Fifteen
y3 <- log(x1)
# Warning message:
# In log(x1) : NaNs produced
# [1]  0.09531018         NaN  0.91629073 -0.69314718         NaN         NaN
# [7]         NaN         NaN         NaN  1.09861229
y3 <- log(x2)
# [1] 1.6094379 2.0794415 0.6931472 1.1939225 1.7227666 2.1041342 1.4816045

# Sixteen
third_moment <- mean( (x1 - mean(x1))^3 )
# [1] 4.4538

# Seventeen
y4 <- ifelse(x1 > 0, 0, 1)

# Eightteen
f2 <- factor(toupper(f1))
#  [1] M M F F F F M M M M F

