
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dyadr

[![Travis-CI Build
Status](https://api.travis-ci.org/abarylsky/dyadr.svg?branch=master)](https://travis-ci.org/abarylsky/dyadr)

r package for dyadic data analysis

# Description

An R package for assisting people in dyadic data analysis. Contains
functions to organize output from the `gls` and `lme` functions from the
`nlme` package for cross-sectional data. Some functionality exists with
the `lme4` package. Improves user understanding of the Actor-Partner
Independence Model by organizing actor and parter effects for the
purpose of comparing parameters to each other.

# Installation

``` r
# install.packages("devtools")
devtools::install_github("RandiLGarcia/dyadr")
```

# Usage

Here is an example of how to use some of the `dyadr` functions.

First, load the package and get data:

``` r
library(nlme)
library(dyadr)
```

Using the `smallsummary` function

``` r
apim <- gls(Satisfaction_A ~ Tension_A + SelfPos_P,
  na.action = na.omit,
  correlation = corCompSymm(form = ~ 1 | CoupleID),
  data = acipair
)

smallsummary(apim)
#> Correlation structure of class corCompSymm representing
#>       Rho 
#> 0.4715039 
#> 
#> Residual standard error: 0.4052903 
#> 
#>               Value Std.Error  t-value p-value
#> (Intercept)  4.7190    0.2366  19.9475  0.0000
#> Tension_A   -0.3454    0.0329 -10.5032  0.0000
#> SelfPos_P   -0.0656    0.0516  -1.2716  0.2045
#>               2.5 %  97.5 %
#> (Intercept)  4.2553  5.1827
#> Tension_A   -0.4099 -0.2810
#> SelfPos_P   -0.1667  0.0355
```

Using the `crsp` function

``` r
# Empty Model
apimie <- summary(gls(Satisfaction_A ~ 1,
  na.action = na.omit,
  correlation = corCompSymm(form = ~ 1 | CoupleID),
  data = acipair
))
# sd of errors for the model or esd
esd <- as.numeric(apim[6])
# sd of errors for the empty model or esd0
esd0 <- as.numeric(apimie[6])
# the R squared, using the crsp function
crsp(esd, esd0)
#> [1] 0.3348468
```

# Contributing

Feel free to submit pull requests resolving documented issues.

# Authors

  - **Randi L. Garcia** - *Initial work* -
    [dyadr](https://github.com/RandiLGarcia/dyadr)
  - **David A. Kenny** - *Initial work*
