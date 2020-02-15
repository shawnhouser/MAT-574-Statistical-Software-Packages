# Shawn Houser
# 2019-10-19
# Homework 4

# 1
data1 <- read.table("hw4prob1.dat", sep = " ")
g1 <- subset(data1, vec == 1)
g2 <- subset(data1, vec == 2)
g3 <- subset(data1, vec == 3)
g4 <- subset(data1, vec == 4)
g5 <- subset(data1, vec == 5)

png(filename = "question1.png") # I like saving as png files

plot(
    g1$V1, g2$V2,
    main = "Five Bivariate Normal Distributions",
    xlim = c(min(data1$V1), max(data1$V1)),
    ylim = c(min(data1$V2), max(data1$V2)),
    xlab = "Coordinate 1",
    ylab = "Coordinate 2",
    type = "p",
    
    col = "red",
    pch = 21
)

points(
    g2$V1, g2$V2,
    col = "green",
    pch = 4 # I don't know if you mean like a biblical cross or an X
)

points(
    g3$V1, g3$V2,
    col = "black",
    pch = 19
)

points(
    g4$V1, g4$V2,
    col = "blue",
    pch = 17
)

points(
    g5$V1, g5$V2,
    col = "yellow",
    pch = 15
)

# 2
graphics.off() # Clears all the plots from the last one
pdf(file = "question2.pdf")
data2 <- read.table("hw4prob2.dat", sep = " ")
hist(
    data2$young,
    xlab = "Income",
    xlim = c(min(data2), max(data2)),
    breaks = seq(from = min(data2), to = max(data2), length.out = 30)
)

hist(
    data2$mid,
    xlab = "Income",
    xlim = c(min(data2), max(data2)),
    breaks = seq(from = min(data2), to = max(data2), length.out = 30)
)

hist(
    data2$old,
    xlab = "Income",
    xlim = c(min(data2), max(data2)),
    breaks = seq(from = min(data2), to = max(data2), length.out = 30)
)

boxplot(
    data2,
    col = c("red", "green", "blue")
)

# 3
graphics.off() # Clears all the plots from the last one
pdf(file = "question3.pdf")
d1x <- sort(rnorm(100, mean = 3, sd = 1))
d1y <- dnorm(d1x, mean = 3, sd = 1)

d2x <- sort(rnorm(100, mean = 2, sd = 2))
d2y <- dnorm(d1x, mean = 2, sd = 2)

d3x <- sort(rnorm(100, mean = 4, sd = 0.5))
d3y <- dnorm(d1x, mean = 4, sd = 0.5)

plot(
    d1x, d1y,
    xlim = c(min(d1x, d2x, d3x), max(d1x, d2x, d3x)),
    ylim = c(min(d1y, d2y, d3y), max(d1y, d2y, d3y)),
    type = "l",
    col = "red"
)

lines(
    d2x, d2y,
    col = "green"
)

lines(
    d3x, d3y,
    col = "blue"
)

legend(
    "topleft",
    legend = c("n(3, 1)", "n(2, 2)", "n(4, 0.5)"),
    col = c("red", "green", "blue"),
    lwd = 2
)

# 4
graphics.off() # Clears all the plots from the last one
pdf(file = "question4.pdf")

times <- 500 / 10
data <- rep(0, times = times)

for (i in 1:times) {
    data[i] = mean(rpois(i * 10, 20))
}

plot(
    (1:times) * 10, data,
    main = "Poisson Random Sample Means",
    xlab = "Sample Size",
    ylab = "Mean of Sample",
    type = "l"
)

points(
    (1:times) * 10, data,
    col = "black",
    pch = 19
)

abline(
    20, 0,
    col = "red"
)
