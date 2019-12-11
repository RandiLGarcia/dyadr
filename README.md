# dyadr
[![Travis-CI Build Status](https://api.travis-ci.org/abarylsky/dyadr.svg?branch=master)](https://travis-ci.org/abarylsky/dyadr)
r package for dyadic data analysis

# Description
An R package for assisting people in dyadic data analysis. Contains functions to organize output from the `gls` and `lme` functions from the `nlme` package for cross-sectional data. Some functionality exists with the `lme4` package. Improves user understanding of the Actor-Partner Independence Model by organizing actor and parter effects for the purpose of comparing parameters to each other. 

# Installation
```
install.packages("remotes")
remotes::install_githib("RandiLGarcia/dyadr")
```

# Usage

Here is an example of how to use some of the `dyadr` functions.

First, load the package and get data:
```
library(nlme)
library(dyadr)
riggsp <- read.csv("riggsp.csv") 
```
Using the `smallsummary` function
```
apim = gls(Sat_A ~ Anxiety_A + Anxiety_P, 
                 na.action=na.omit, 
                 correlation=corCompSymm (form=~1|Dyad),
                 data=riggsp)

smallsummary(apim)
```
Using the `crsp` function
```
# Empty Model
        apimie = summary(gls(Sat_A ~ 1, 
                     na.action=na.omit, 
                     correlation=corCompSymm (form=~1|Dyad),
                     data=riggsp))
# sd of errors for the model or esd
        esd = as.numeric(apim[6])
# sd of errors for the empty model or esd0
                esd0 = as.numeric(apimie[6])
# the R squared, using the crsp function                
        crsp (esd,esd0)
```

# Contributing
Feel free to submit pull requests resolving documented issues. 

# Authors
* **Randi L. Garcia** - *Initial work* - [dyadr](https://github.com/RandiLGarcia/dyadr)
* **David A. Kenny** - *Initial work* 