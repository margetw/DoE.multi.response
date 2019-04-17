<!-- README.md is generated from README.Rmd. Please edit that file -->

[![Travis build
status](https://travis-ci.org/margetw/DoE.multi.response.svg?branch=master)](https://travis-ci.org/margetw/DoE.multi.response)

DoE.multi.response
==================

The goal of DoE.multi.response is to construct experimental designs that
follow the structure of well studied designs (such as CCDs), but
extended to problems with multiple response variables where there is
some prior information about the relationship between explanatory and
response variables.

Example
-------

This is a basic example which shows you how to solve a common problem:

We have a system with four response variables and 5 explanatory
variables (factors). Suppose we know from previous process knowledge
that:

-   Response 1 is related to factors 1, 2, and 3
-   Response 2 is related to factors 2, 3, and 4
-   Response 3 is related to factors 1, 3, and 5
-   Response 4 is related to factors 1 and 4

We can summarize this prior information with the following table:

| factors    | f1  | f2  | f3  | f4  | f5  |
|------------|-----|-----|-----|-----|-----|
| Response 1 | X   | X   | X   |     |     |
| Response 2 |     | X   | X   | X   |     |
| Response 3 | X   |     | X   |     | X   |
| Response 4 | X   |     |     | X   |     |

One assignment of unique factors for this example is:

``` r
x<-matrix(c(1,1,1,0,0,
            0,1,1,1,0,
            1,0,1,0,1,
            1,0,0,1,0), nrow = 4,byrow = TRUE)
library(DoE.multi.response)
#> Loading required package: DoE.wrapper
#> Loading required package: FrF2
#> Loading required package: DoE.base
#> Loading required package: grid
#> Loading required package: conf.design
#> 
#> Attaching package: 'DoE.base'
#> The following objects are masked from 'package:stats':
#> 
#>     aov, lm
#> The following object is masked from 'package:graphics':
#> 
#>     plot.design
#> The following object is masked from 'package:base':
#> 
#>     lengths
#> Loading required package: rsm
ufactors(x)
#> [1] 1 2 3 4 2
```

And a UF-CCD for this example is:

``` r
ufccd(x)
#> full factorial design needed
#> creating full factorial with 16 runs ...
#>       Block.ccd       X1       X2       X3       X4       X5
#> C1.17         1  0.00000  0.00000  0.00000  0.00000  0.00000
#> C1.18         1  0.00000  0.00000  0.00000  0.00000  0.00000
#> C1.13         1 -1.00000 -1.00000  1.00000  1.00000 -1.00000
#> C1.14         1  1.00000 -1.00000  1.00000  1.00000 -1.00000
#> C1.1          1 -1.00000 -1.00000 -1.00000 -1.00000 -1.00000
#> C1.16         1  1.00000  1.00000  1.00000  1.00000  1.00000
#> C1.15         1 -1.00000  1.00000  1.00000  1.00000  1.00000
#> C1.8          1  1.00000  1.00000  1.00000 -1.00000  1.00000
#> C1.9          1 -1.00000 -1.00000 -1.00000  1.00000 -1.00000
#> C1.5          1 -1.00000 -1.00000  1.00000 -1.00000 -1.00000
#> C1.19         1  0.00000  0.00000  0.00000  0.00000  0.00000
#> C1.6          1  1.00000 -1.00000  1.00000 -1.00000 -1.00000
#> C1.2          1  1.00000 -1.00000 -1.00000 -1.00000 -1.00000
#> C1.3          1 -1.00000  1.00000 -1.00000 -1.00000  1.00000
#> C1.11         1 -1.00000  1.00000 -1.00000  1.00000  1.00000
#> C1.7          1 -1.00000  1.00000  1.00000 -1.00000  1.00000
#> C1.10         1  1.00000 -1.00000 -1.00000  1.00000 -1.00000
#> C1.4          1  1.00000  1.00000 -1.00000 -1.00000  1.00000
#> C1.12         1  1.00000  1.00000 -1.00000  1.00000  1.00000
#> C1.20         1  0.00000  0.00000  0.00000  0.00000  0.00000
#> S2.9          2  0.00000  0.00000  0.00000  0.00000  0.00000
#> S2.6          2  0.00000  0.00000  2.19089  0.00000  0.00000
#> S2.8          2  0.00000  0.00000  0.00000  2.19089  0.00000
#> S2.7          2  0.00000  0.00000  0.00000 -2.19089  0.00000
#> S2.12         2  0.00000  0.00000  0.00000  0.00000  0.00000
#> S2.1          2 -2.19089  0.00000  0.00000  0.00000  0.00000
#> S2.10         2  0.00000  0.00000  0.00000  0.00000  0.00000
#> S2.5          2  0.00000  0.00000 -2.19089  0.00000  0.00000
#> S2.2          2  2.19089  0.00000  0.00000  0.00000  0.00000
#> S2.4          2  0.00000  2.19089  0.00000  0.00000  2.19089
#> S2.11         2  0.00000  0.00000  0.00000  0.00000  0.00000
#> S2.3          2  0.00000 -2.19089  0.00000  0.00000 -2.19089
```
