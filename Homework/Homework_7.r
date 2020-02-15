# Shawn Houser
# 2019-11-18
# Homework 7

# 1.a
fit <- lm(COST ~ PAPER + MACHINE + OVERHEAD + LABOR, data = values)

# Call:
# lm(formula = COST ~ PAPER + MACHINE + OVERHEAD + LABOR, data = values)
# 
# Coefficients:
# (Intercept)        PAPER      MACHINE     OVERHEAD        LABOR  
#    51.72314      0.94794      2.47104      0.04834     -0.05058  

# 1.b
summary(fit)

# Call:
# lm(formula = COST ~ PAPER + MACHINE + OVERHEAD + LABOR, data = values)
# 
# Residuals:
#     Min      1Q  Median      3Q     Max 
# -18.691  -7.407  -1.978   6.675  22.516 
# 
# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)    
# (Intercept) 51.72314   21.70397   2.383   0.0262 *  
# PAPER        0.94794    0.12002   7.898 7.30e-08 ***
# MACHINE      2.47104    0.46556   5.308 2.51e-05 ***
# OVERHEAD     0.04834    0.52501   0.092   0.9275    
# LABOR       -0.05058    0.04030  -1.255   0.2226    
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 11.08 on 22 degrees of freedom
# Multiple R-squared:  0.9988,    Adjusted R-squared:  0.9986 
# F-statistic:  4629 on 4 and 22 DF,  p-value: < 2.2e-16

# Because the p-value is so small, we reject h_0 in favor of h_a
# that the data is linearly related

# 1.c
# 0.9988 of the variation can be explained by the model

# 1.d
fit <- lm(COST ~ PAPER + MACHINE, data = values)
summary(fit)

# Call:
# lm(formula = COST ~ PAPER + MACHINE, data = values)
# 
# Residuals:
#     Min      1Q  Median      3Q     Max 
# -16.858  -6.268  -2.673   6.941  23.166 
# 
# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)    
# (Intercept)  59.4318    19.6388   3.026  0.00583 ** 
# PAPER         0.9489     0.1101   8.622 8.19e-09 ***
# MACHINE       2.3864     0.2101  11.357 3.87e-11 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 10.98 on 24 degrees of freedom
# Multiple R-squared:  0.9987,    Adjusted R-squared:  0.9986 
# F-statistic:  9413 on 2 and 24 DF,  p-value: < 2.2e-16

# with nearly no change in our p-value, we can safely remove the
# overhead and labor dimension from our regression.