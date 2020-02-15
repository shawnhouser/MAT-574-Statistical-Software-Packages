# Shawn Houser
# 2019-11-18
# Homework 5

# 1.a
values <- c(111, 109, 88, 64, 67, 58, 76, 65, 80, 96, 86, 71, 72)
pdf(file = "question1.pdf")
par(mfrow = c(1, 2))
hist(values, breaks=seq(from=30, to=150, by=10))
qqnorm(values)
qqline(values)
graphics.off()

# I want to err on the side of caution and say that these do not look
# normally distributed. There is just so few data points that I can
# not say comfortably if it is normally distributed

# 1.b
mean(values)
sd(values)
pnorm(90, mean = mean(values), sd = sd(values))
# [1] 0.7176806

# 1.c
# The new mean is less than the old meaof 90, but without a proper comparison
# of the values before with their standard deviation, no sound concludsion
# can be reached. The sample size is also too small to say, and the new mean
# is so close. I would fail to reject the null hypothesis for all of these reasons



# 2
# 2.a
values <- read.table("DRPscores.txt", header = TRUE)
treatment <- subset(values, Group == 'Treatment')$Scores
control <- subset(values, Group == 'Control')$Scores



# 2.b
pdf(file = "question2.pdf")

par(mfrow = c(1, 2))
hist(treatment, breaks=seq(from=min(values$Scores) - 10, to=max(values$Scores) + 10, by=10))
hist(control, breaks=seq(from=min(values$Scores) - 10, to=max(values$Scores) + 10, by=10))

par(mfrow = c(1, 2))
qqnorm(treatment)
qqline(treatment)
qqnorm(control)
qqline(control)

boxplot(treatment)
boxplot(control)
graphics.off()

# The data does appear to be normally distributed, and with the higher
# amount of samples, I am comfortable saying it is normally distributed



# 2.c
var.test(treatment, control)
# 	F test to compare two variances
# data:  treatment and control
# F = 0.412, num df = 20, denom df = 22, p-value = 0.05067
# alternative hypothesis: true ratio of variances is not equal to 1
# 95 percent confidence interval:
#  0.1724602 1.0026844
# sample estimates:
# ratio of variances 
#          0.4120045

# Because our p value is not below 0.05,
# we fail to reject the null hypothesis

# 2.d
t.test(treatment, control)
# 	Welch Two Sample t-test
# data:  treatment and control
# t = 2.3109, df = 37.855, p-value = 0.02638
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   1.23302 18.67588
# sample estimates:
# mean of x mean of y 
#  51.47619  41.52174

# Because our p-value is below 0.05 we reject the null hypothesis
# that there is no difference in the treatment and control means


# 3.a
g1 <- c(9.9, 10.2, 9.8, 10.5, 9.7, 10.6, 10.2, 10.5, 10.3, 10.8, 9.8, 10.0, 10.6, 10.7, 10.2)
g2 <- c(9.5, 10.0, 9.3, 9.8, 9.7, 9.9, 9.8, 9.6, 10.1, 10.2, 10.1, 9.7, 9.5, 9.6, 9.8)
pdf(file = "question3.pdf")

boxplot(g1, g2)

par(mfrow = c(1, 2))
biggest <- max(c(max(g1), max(g2)))
smallest <- min(c(min(g1), min(g2)))
hist(g1, breaks = seq(from = smallest, to = biggest, by = 0.1))
hist(g2, breaks = seq(from = smallest, to = biggest, by = 0.1))
graphics.off()

# These look normally distributed with the same std and very
# different means

# 3.b
var.test(g1, g2)
#         F test to compare two variances
# data:  g1 and g2
# F = 1.9545, num df = 14, denom df = 14, p-value = 0.2223
# alternative hypothesis: true ratio of variances is not equal to 1
# 95 percent confidence interval:
#  0.6561988 5.8217847
# sample estimates:
# ratio of variances 
#           1.954545

# Because our p-value is above 0.05 we fail to reject the null hypothesis
# and we consider the two standard devia

## 3.c
t.test(g1, g2, alternative = "t")
#        Welch Two Sample t-test
# data:  g1 and g2
# t = 4.2437, df = 25.354, p-value = 0.000258
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#  0.2472122 0.7127878
# sample estimates:
# mean of x mean of y 
# 10.253333  9.773333 

# Because our p-value is so small, we reject h_0 and conclude that the
# two populations have different 