library(AER) 
set.seed(1)
# generate data
x1 <- rnorm(100,1,2)
x12 <- x1^2
x2 <- rnorm(100,2,3)
x22 <- x2^2
y <- rnorm(100,10,4)

# full model
m1 <- lm(y ~ x1 +x2  )
squared_residuals <- resid(m1) ^ 2
m_bp_stage2 <- lm(squared_residuals ~ x1 + x2 + x1*x2 + x12 + x22)
(R_squared <- summary(m_bp_stage2)$r.squared)
n = length(y);k = 5
(lm_st <- n*(R_squared))
(1 - pchisq(lm_st, df = k ))

bptest(m1,varformula = ~ x1 + x2 + x1*x2 + x12 + x22 )


#  simplified version
yhat <- predict(m1)
bptest(m1, varformula =  ~ yhat + I(yhat^2))

squared_residuals <- resid(m1) ^ 2
m_bp_stage2 <- lm(squared_residuals ~  yhat + I(yhat^2))
(R_squared <- summary(m_bp_stage2)$r.squared)
n  = 100
k = length(m1$coefficients) -1
(lm_st <- n*(R_squared))
(1 - pchisq(lm_st, df = k))


int = rep(10,100)
lm(y ~ x1 + x2 ) %>% summary()
lm(y ~ x1 + x2 + int) %>% summary()
