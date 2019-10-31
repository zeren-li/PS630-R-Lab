# PS630 R Lab
## Zeren Li


## Regression in Matrix Notation

Simple Linear Regression:

$$Y_i = \beta_0 +  x_i \beta_1 + \epsilon_i \text{  for  } i = 1,
\ldots, n$$  
 
Rewrite in vectors:

\begin{align*}
  \left[
\begin{array}{c}  y_1 \\ \vdots \\  y_n \end{array} 
  \right]   =  & 
 \left[ \begin{array}{c}  1 \\ \vdots \\ 1 \end{array}  \right]   \beta_0 + 
 \left[ \begin{array}{c}  x_1 \\ \vdots \\  x_n \end{array}
 \right] \beta_1 + 
\left[ \begin{array}{c}  \epsilon_1 \\ \vdots \\ \epsilon_n  \end{array}
\right]
\\
 & \\
\left[
\begin{array}{c}  y_1 \\ \vdots \\  y_n \end{array} 
  \right]   =  & 
 \left[ \begin{array}{cc}  1 &  x_1 \\ \vdots & \vdots \\ 1 & x_n\end{array}  \right]   
 \left[ \begin{array}{c}  \beta_0  \\  \beta_1 \end{array}
 \right] + 
\left[ \begin{array}{c}  \epsilon_1 \\ \vdots \\ \epsilon_n  \end{array}
\right] \\
 & \\ 
\mathbf{Y} = & \mathbf{X} \boldsymbol{\beta} + \boldsymbol{\varepsilon}
\end{align*}

## Data
sa


```{r, echo=T, out.width=5}
data(bodyfat, package="BAS")  #from BAS   help(bodyfat)
dim(bodyfat)
summary(bodyfat)  # anything strange ?
```

## Pairs Plots

```{r pairs, echo=T,fig.height=5}
library(GGally)
ggpairs(bodyfat, columns=c(8,3,5,2))
```

## Ordinary Least Squares

* OLS estimates of parameters $\beta_0$ and $\beta$ minimize sum of squared errors
     $$L(\boldsymbol{\beta}) =  \sum_{i=1}^n (Y_i - (\beta_0 + X_i \beta_1))^2$$
     $$L(\boldsymbol{\beta}) = (\mathbf{Y} - \mathbf{X} \boldsymbol{\beta})^T(\mathbf{Y} - \mathbf{X} \boldsymbol{\beta})$$

* OLS estimate of $\boldsymbol{\beta}$
     $$\hat{\boldsymbol{\beta}} = (\mathbf{X}^T\mathbf{X})^{-1} \mathbf{X}^T\mathbf{Y}
$$

* Ad Hoc
* Equivalent to Maximum Likelihood Estimates with assumption that errors are iid Normal   (Model based)

## Summarizing Model Fit

*  Fitted values 
$$\hat{Y}_i = x_i^T \hat{\beta} $$
*  Residuals (estimates of errors)
$$e_i = Y_i - \hat{Y}_i = \hat{\epsilon}_i$$  
* Sum of Squared Errors  $$\text{SSE} = \sum e_i^2$$
   measures remaining residual variation in response
* MSE = SSE/(n - 2)  (or more generally $ n - p$) is an estimate of $\sigma^2$
* degrees of freedom $n - p$ where $p$ is the number of parameters in the mean function


This repository contains the lab session material for the first course of the quantitative method series of Duke Political Science Ph.D. Program: **Probability and Regressionbility (PS630)**. 

[R Quick Guide](../../tree/master/r-quick-guide): `R`, `RMarkdown` installation and resources

[Lab 1: R Basics](../../tree/master/lab-1): R base function, importing data; manually compute summary stastics

[Lab 2: `dplyr` & T-test ](../../tree/master/lab-2): clean and manage data using `dplyr`, `magrittr`, etc.; manually perform T-test

[Lab 3: `ggplot` & OLS ](../../tree/master/lab-3): data visualization using using `ggplot`, manually perform OLS, export regression table using `stargazer`

[Lab 4: Hypothesis tests, Heteroskedasticity, Regression Diagnostics, Non-linearity ](../../tree/master/lab-4): using `R` to conduct hypothesis tests mannually, run regression diagnostics using `plot()`, logged transformation, and quadratic regression.


Materials are from *Introduction to Econometrics with R* by Christoph Hanck, Martin Arnold, Alexander Gerber and Martin Schmelzer and 
