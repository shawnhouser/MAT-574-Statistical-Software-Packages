# Problem 1
sum.geom <- function (x, r, n) {
	if (x == 0) {
		return(0)
	} else if (r == 0) {
		return(x)
	} else if (r == 1) {
		return(x*n)
	} else if (is.infinite(n)) {
		if (r < 1) {
			return(x/(1-r))
		} else {
			return(inf)
		}
	} else {
		return((x*(1-r**n))/(1-r))
	}
}

sum.geom(0, 0.75, 25)
# [1] 0

sum.geom(3, 0, 25)
# [1] 3

sum.geom(3, 1, 25)
# [1] 75

sum.geom(5, 0.75, 25)
# [1] 19.98495

# Problem 2
vector.norm <- function (vec) {
	return(sqrt(sum(vec**2)))
}

vec.cos <- function (v1, v2) {
	if (length(v1) != length(v2)) {
		return(NaN)
	}
	
	numerator <- sum(v1*v2)
	norm1 <- vector.norm(v1)
	norm2 <- vector.norm(v2)
	
	if (norm1 == 0 | norm2 == 0) {
		return(NaN)
	} else {
		return(numerator/(norm1*norm2))
	}
}

vec.cos(
	c(12, 3, 45, 22, 67),
	c(91, 32, 17, 13, 90)
)
# [1] 0.7316315

vec.cos(
	c(0, 0, 0, 0, 0),
	c(91, 32, 17, 13, 90)
)
# [1] NaN

vec.cos(
	c(12, 3, 45, 22, 67, 11),
	c(91, 32, 17, 13, 90)
)
# [1] NaN

# Problem 3
choose.rec <- function (n = 0, x = 0) {
	if (n == x | x == 0) {
		return(1)
	} else {
		a <- choose.rec(
			n = n-1,
			x = x-1
		)
		b <- choose.rec(
			n = n-1,
			x = x
		)
		return(a + b)
	}
}

choose.rec(10, 3)
# [1] 120

choose.rec(10, 10)
# [1] 1

choose.rec(10, 0)
# [1] 1

# Problem 4
Test.Conf.Int.for.variance <- function (vec, s_0 = 1, test.type = "two") {
	# h0: s_t = s_0
	# ha: s_t != s_0 (two tail)
	# ha: s_t < s_0 (lower one tail)
	# ha: s_t > s_0 (upper one tail)
	df <- length(vec) - 1
	test.statistic = (df) / (sd(vec)/s_0)^2
	p.value <- pchisq(test.statistic, df = df)
	
	lower <- 0
	upper <- Inf

	if (test.type == "up") {
		upper <- qchisq(0.95, df = df)
	} else if (test.type == "low") {
		lower <- qchisq(0.05, df = df)
	} else {
		upper <- qchisq(1 - 0.025, df = df)
		lower <- qchisq(0.025, df = df)
	}

	print(paste("range is", lower, "to", upper))
	print(paste("with a test statistic of", test.statistic))
	print(paste("and a p-value of", p.value))
	# prob of seeing this under the null hypothesis

	if (test.statistic <= lower | upper <= test.statistic) {
		print("You should reject the given h_0 in favor of h_a")
		return(TRUE) # reject
	} else {
		print("You should keep h_0 as there is not enough evidence to support h_a")
		return(FALSE) # do not reject
	}
}

cholesterol.level <- c(
	1.7, 2.5, 2.2, 1,9, 3.6, 6.9, 5.1, 4.2, 5.5,
	7.2, 3.0, 5.8, 4.9, 9.9, 7.1, 5.4, 6.2, 4.5,
	6.3, 8.2, 5.7, 4.4, 7.9, 3.2, 4.8, 3.5, 7.6
)

Test.Conf.Int.for.variance(cholesterol.level, 1, "two")
# [1] "range is 14.5733827308217 to 43.194510966156"
# [1] "with a test statistic of 5.40854206246373"
# [1] "and a p-value of 2.41554938124745e-06"
# [1] "You should reject the given h_0 in favor of h_a"
# [1] TRUE

Test.Conf.Int.for.variance(cholesterol.level, 2, "two")
# [1] "range is 14.5733827308217 to 43.194510966156"
# [1] "with a test statistic of 21.6341682498549"
# [1] "and a p-value of 0.244273000957636"
# [1] "You should keep h_0 as there is not enough evidence to support h_a"
# [1] FALSE

Test.Conf.Int.for.variance(cholesterol.level, 3, "two")
# [1] "range is 14.5733827308217 to 43.194510966156"
# [1] "with a test statistic of 48.6768785621736"
# [1] "and a p-value of 0.993554949410195"
# [1] "You should reject the given h_0 in favor of h_a"
# [1] TRUE

Test.Conf.Int.for.variance(cholesterol.level, 4, "two")
# [1] "range is 14.5733827308217 to 43.194510966156"
# [1] "with a test statistic of 86.5366729994197"
# [1] "and a p-value of 0.999999962794112"
# [1] "You should reject the given h_0 in favor of h_a"
# [1] TRUE

Test.Conf.Int.for.variance(cholesterol.level, 1, "low")
# [1] "range is 16.1513958496641 to Inf"
# [1] "with a test statistic of 5.40854206246373"
# [1] "and a p-value of 2.41554938124745e-06"
# [1] "You should reject the given h_0 in favor of h_a"
# [1] TRUE

Test.Conf.Int.for.variance(cholesterol.level, 1, "up")
# [1] "range is 0 to 40.1132720694136"
# [1] "with a test statistic of 5.40854206246373"
# [1] "and a p-value of 2.41554938124745e-06"
# [1] "You should keep h_0 as there is not enough evidence to support h_a"
# [1] FALSE

# Problem 5
t.test.my.function <- function (v1, v2) {
	df = length(v1) + length(v2) - 2
	mid <- mean(v1) - mean(v2)
	t.value <- qt(0.95, df = df)
	sp <- ((length(v1) - 1)*var(v1) + (length(v2) - 1)*var(v2)) / df
	
	lower <- mid - t.value * sp * sqrt(1/(df + 2))
	upper <- mid + t.value * sp * sqrt(1/(df + 2))
	
	if (0 <= lower | upper <= 0) {
		print(paste("range is", lower, "to", upper, "it doesnt include 0"))
		print("you should reject h_0 and instead say the means are different")
		return(TRUE)
	} else {
		print(paste("range is", lower, "to", upper, "it does include 0"))
		print("you should not reject h_0 and use the assumption the means are the same")
		return(FALSE)
	}
}


datax <-c(
	11.6, 9.3, 11.7, 12.7, 13.4, 9.2,
	7.9, 14.1, 12.0, 10.6, 12.0, 10.1,
	12.1, 11.6, 10.7, 12.1, 9.9
)
datay <- c(
	18.1, 15.2, 17.2, 11.9, 14.7, 12.0,
	12.9, 12.7, 10.9, 14.5, 12.8, 12.9,
	14.9, 13.5, 12.8, 11.9, 10.7
)
t.test.my.function(datax, datay)
# [1] "range is -3.245652022742 to -1.29552444784624 it doesnt include 0"
# [1] "you should reject h_0 and instead say the means are different"
# [1] TRUE

# Problem 6
g1 <- c(10.6, 10.2, 10.5, 10.3, 10.8, 9.8, 10.6, 10.7, 10.2, 10.0)
g2 <- c(9.9, 9.8, 9.6, 10.1, 10.2, 10.1, 9.7, 9.5, 9.6, 9.8)

pdf(file = "problem6.pdf")

boxplot(g1, g2)

par(mfrow = c(1, 2))
biggest <- max(c(max(g1), max(g2)))
smallest <- min(c(min(g1), min(g2)))
hist(g1, breaks = seq(from = smallest, to = biggest, by = 0.1))
hist(g2, breaks = seq(from = smallest, to = biggest, by = 0.1))

par(mfrow = c(1, 2))
qqnorm(g1)
qqnorm(g2)

graphics.off()

# These look normally distributed to me

var.test(g1, g2)
#         F test to compare two variances
# data:  g1 and g2
# F = 1.8061, num df = 9, denom df = 9, p-value = 0.3917
# alternative hypothesis: true ratio of variances is not equal to 1
# 95 percent confidence interval:
#  0.4486201 7.2715173
# sample estimates:
# ratio of variances 
#           1.806142 

# Because our p-value is above 0.05 we fail to reject the null hypothesis
# and we consider the two variances to be equivilent

t.test(g1, g2, alternative = "t")
#         Welch Two Sample t-test
# data:  g1 and g2
# t = 4.2368, df = 16.628, p-value = 0.000581
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#  0.2706369 0.8093631
# sample estimates:
# mean of x mean of y 
#     10.37      9.83 

# Because our p-value is so small, we reject h_0 and conclude that the
# two populations have different

# Problem 7
values <- read.table("headinjuries.txt", header = TRUE)
small <- subset(values, carsize == "Small")$headinjuries
medium <- subset(values, carsize == "Medium")$headinjuries
large <- subset(values, carsize == "Large")$headinjuries

png("./question1.png")
boxplot(small, medium, large)
graphics.off()

# It seems that the larger the car is, the larger the variance in
# the damage that can happen is. This would make me want to do a ANOVA test

# h_0 = all of the variances are identical
# h_a = at least one dataset has a different variance

fit <- aov(headinjuries ~ carsize, data = values)
#         One-way analysis of means (not assuming equal variances)
# data:  headinjuries and carsize
# F = 0.60428, num df = 2.000, denom df = 16.781, p-value = 0.5579

# With a p-value this large, i can conclude nothing
# This means that part B is not done

# Problem 8
values <- read.table("GPA.txt", header = TRUE)
fit <- lm(GPA ~ ACT, data = values)
summary(fit)
# Residuals:
#      Min       1Q   Median       3Q      Max 
# -2.74004 -0.33827  0.04062  0.44064  1.22737 
# 
# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)    
# (Intercept)  2.11405    0.32089   6.588  1.3e-09 ***
# ACT          0.03883    0.01277   3.040  0.00292 ** 
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 0.6231 on 118 degrees of freedom
# Multiple R-squared:  0.07262,   Adjusted R-squared:  0.06476 
# F-statistic:  9.24 on 1 and 118 DF,  p-value: 0.002917

# t-test
# H_0 = b1 is 0
# H_a = b1 is not 0
b1 <- fit$coefficients[2]
t.test.statistic <- b1 / 0.6231 # Residual standard error
# 0.06231283 
# Because this is so cose to 0 and within the bounds of our t distribution
# ranges, we fail to reject h_0 and say that including the ACT into the
# calculation has no effect

anova(fit)
# Analysis of Variance Table
# 
# Response: GPA
#            Df Sum Sq Mean Sq F value   Pr(>F)   
# ACT         1  3.588  3.5878  9.2402 0.002917 **
# Residuals 118 45.818  0.3883                    
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# We see that the p value from the ANOVA says otherwise. The ANOVA test
# tells us to reject H_0 while the t test does not.

# 0.07262 of the variation in GPA is explained by the ACT score

# Problem 9
# Put this in a file called data.txt

# age group reactiontime
# age1 group1 0.384
# age1 group1 0.248
# age1 group1 0.191
# age1 group2 0.338
# age1 group2 0.495
# age1 group2 0.691
# age1 group3 0.586
# age1 group3 0.509
# age1 group3 0.364
# age2 group1 0.203
# age2 group1 0.331
# age2 group1 0.438
# age2 group2 0.485
# age2 group2 0.389
# age2 group2 0.629
# age2 group3 0.626
# age2 group3 0.858
# age2 group3 0.529
# age3 group1 0.494
# age3 group1 0.467
# age3 group1 0.302
# age3 group2 0.585
# age3 group2 0.782
# age3 group2 0.529
# age3 group3 0.520
# age3 group3 0.854
# age3 group3 0.700

values <- read.table("data.txt", header = TRUE)
Two.Way.Results.Inter <- lm(reactiontime ~ age + group + age*group, data = values)
anova(Two.Way.Results.Inter)
# Analysis of Variance Table
# 
# Response: reactiontime
#           Df  Sum Sq  Mean Sq F value   Pr(>F)   
# age        2 0.11320 0.056601  3.0460 0.072542 . 
# group      2 0.37246 0.186231 10.0221 0.001188 **
# age:group  4 0.02931 0.007328  0.3943 0.810011   
# Residuals 18 0.33448 0.018582                    
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Our p-value for the joint is 0.810011 making it very unlikely that this
# interaction had any significant effect. It appears that the result
# was dominated by the group variable

groups <- as.factor(values$group)
ages <- as.factor(values$age)
png("problem9c_a.png")
interaction.plot(groups, ages, values$reactiontime)
graphics.off()

png("problem9c_b.png")
interaction.plot(ages, groups, values$reactiontime)
graphics.off()

Two.Way.Results.NO.Inter <- lm(reactiontime ~ age + group, data = values)
anova(Two.Way.Results.NO.Inter)
# Analysis of Variance Table
# 
# Response: reactiontime
#           Df  Sum Sq  Mean Sq F value    Pr(>F)    
# age        2 0.11320 0.056601   3.423 0.0507834 .  
# group      2 0.37246 0.186231  11.262 0.0004286 ***
# Residuals 22 0.36379 0.016536                      
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# H_0: all three groups have the same variance
# H_a: at least group has a different variance

# 22 degrees of freedom

oneway.test(values$reactiontime ~ values$group)
#         One-way analysis of means (not assuming equal variances)
# 
# data:  values$reactiontime and values$group
# F = 10.417, num df = 2.000, denom df = 15.625, p-value = 0.001334

oneway.test(values$reactiontime ~ values$age)
#         One-way analysis of means (not assuming equal variances)
# 
# data:  values$reactiontime and values$age
# F = 1.9673, num df = 2.000, denom df = 15.921, p-value = 0.1724

# There does appear to be a significant difference in means of the three
# ages, but there does for the three groups. that is strange. Perhaps the
# participants did one test at 2 am and there are other factors unknown

png("problem9i.png")
plot(
	values$reactiontime, resid(Two.Way.Results.NO.Inter)
)

# The assumptions of the ANOVA test seem to be valid