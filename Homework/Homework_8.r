# Shawn Houser
# 2019-11-17
# Homework 8

values <- read.table("data.txt", header = TRUE)
Two.Way.Results.Inter <- lm(reactiontime ~ age + group + age*group, data = values)
anova(Two.Way.Results.Inter)
# Analysis of Variance Table
# 
# Response: reactiontime
#           Df  Sum Sq  Mean Sq F value    Pr(>F)    
# age        2 0.12284 0.061421  3.5107 0.0515994 .  
# group      2 0.36721 0.183605 10.4944 0.0009528 ***
# age:group  4 0.02515 0.006288  0.3594 0.8341720    
# Residuals 18 0.31492 0.017495                      
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# There does not seem to be a significant interaction between
# group and age. It seems to be largely dominated by the group variable.

groups <- as.factor(values$group)
ages <- as.factor(values$age)
png("file1.png")
interaction.plot(groups, ages, values$reactiontime)
graphics.off()

png("file2.png")
interaction.plot(ages, groups, values$reactiontime)
graphics.off()

Two.Way.Results.NO.Inter <- lm(reactiontime ~ age + group, data = values)
anova(Two.Way.Results.NO.Inter)
# Analysis of Variance Table
# 
# Response: reactiontime
#           Df  Sum Sq  Mean Sq F value    Pr(>F)    
# age        2 0.12284 0.061421  3.9735 0.0336320 *  
# group      2 0.36721 0.183605 11.8779 0.0003175 ***
# Residuals 22 0.34007 0.015458                      
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# h_0 the interaction has no effect h_a the interaction has an effect

summary(Two.Way.Results.NO.Inter)
# Call:
# lm(formula = reactiontime ~ age + group, data = values)
# 
# Residuals:
#       Min        1Q    Median        3Q       Max 
# -0.178889 -0.090556 -0.008667  0.080167  0.241889 
# 
# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)    
# (Intercept)  0.25722    0.05350   4.808  8.4e-05 ***
# ageage2      0.08244    0.05861   1.407 0.173491    
# ageage3      0.16522    0.05861   2.819 0.009993 ** 
# groupgroup2  0.20056    0.05861   3.422 0.002440 ** 
# groupgroup3  0.27644    0.05861   4.717 0.000105 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 0.1243 on 22 degrees of freedom
# Multiple R-squared:  0.5903,    Adjusted R-squared:  0.5159 
# F-statistic: 7.926 on 4 and 22 DF,  p-value: 0.0004087

# 22 degrees of freedom

oneway.test(values$reactiontime ~ values$group)
#         One-way analysis of means (not assuming equal variances)
# 
# data:  values$reactiontime and values$group
# F = 10.309, num df = 2.000, denom df = 15.658, p-value = 0.001391