# Shawn Houser
# 2019-11-18
# Homework 6

values <- read.table("headinjuries.txt", header = TRUE)
small <- subset(values, carsize == "Small")$headinjuries
medium <- subset(values, carsize == "Medium")$headinjuries
large <- subset(values, carsize == "Large")$headinjuries

png("./question1.png")
boxplot(small, medium, large)
graphics.off()

# It seems that the larger the car is, the larger the variance in
# the damage that can happen is. This would make me want to do a ANOVA test

fit <- aov(headinjuries ~ carsize, data = values)
#         One-way analysis of means (not assuming equal variances)
# data:  headinjuries and carsize
# F = 0.60428, num df = 2.000, denom df = 16.781, p-value = 0.5579

# With a p-value this large, i can conclude nothing

g1 <- c(7.5, 10.0, 8.5, 7.5, 7.0, 9.0, 8.5, 7.5, 8.2, 9.5, 7.5, 8.5, 7.7)
g2 <- c(5.5, 5.0, 6.0, 7.5, 7.0, 8.0, 6.0, 5.5, 5.0, 6.5, 7.5, 5.0, 6.5)
g3 <- c(3.5, 4.0, 4.5, 3.0, 4.5, 4.0, 3.5, 3.0, 3.5, 3.0, 3.5, 4.0, 3.0)
g4 <- c(3.5, 2.0, 4.0, 2.0, 3.0, 1.0, 2.0, 2.5, 3.5, 2.5, 2.5, 1.5, 2.0)

png("./question2.png")
boxplot(g1, g2, g3, g4)
graphics.off()

max_max <- max(c(max(g1), max(g2), max(g3), max(g4)))
min_min <- min(c(min(g1), min(g2), min(g3), min(g4)))

png("./question2_a_part_2.png")
par(mfrow=c(2, 2))
hist(g1, breaks = min_min:max_max)
hist(g2, breaks = min_min:max_max)
hist(g3, breaks = min_min:max_max)
hist(g4, breaks = min_min:max_max)
graphics.off()

# h_0 these all have the same mean
# h_a there are two that have a different mean

actual <- setNames(stack(list(
	g1 = g1,
	g2 = g2,
	g3 = g3,
	g4 = g4
)), c("value", "group"))

fit <- oneway.test(value ~ group, data = actual)
#         One-way analysis of means (not assuming equal variances)
# 
# data:  value and group
# F = 118, num df = 3.000, denom df = 25.805, p-value = 3.45e-15

# We can conclude that there is a difference between the means of some values

pairwise.t.test(actual$value, actual$group, p.adj = "none")
#         Pairwise comparisons using t tests with pooled SD 
# 
# data:  actual$value and actual$group 
# 
#    g1      g2      g3    
# g2 2.7e-07 -       -     
# g3 < 2e-16 3.7e-10 -     
# g4 < 2e-16 3.8e-15 0.0011
# 
# P value adjustment method: none 

# all of these p-values are so small we can consider them all to be seperate
# from each other.

values <- read.table("download.txt", header = TRUE)
early <- subset(values, timeperiod == "Early")$times
evening <- subset(values, timeperiod == "Evening")$times
late <- subset(values, timeperiod == "Late")$times

png("./question3.png")
boxplot(early, evening, late)
graphics.off()

# These appear to be different and normally distributed

# h_0 there is no mean different
# h_a there is at least mean different

fit <- oneway.test(times ~ timeperiod, data = values)

#         One-way analysis of means (not assuming equal variances)
# 
# data:  times and timeperiod
# F = 40.2, num df = 2.000, denom df = 29.687, p-value = 3.561e-09

# we conclude there to be at least one difference in means

pairwise.t.test(values$times, values$timeperiod, p.adj = "none")
#         Pairwise comparisons using t tests with pooled SD 
# data:  values$times and values$timeperiod 
# 
#         Early   Evening
# Evening 1.9e-12 -      
# Late    1.9e-05 1.7e-05
# 

# we can conclude that there is a difference in all of the means