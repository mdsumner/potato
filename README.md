<!-- README.md is generated from README.Rmd. Please edit that file -->
potato
======

The goal of potato is to provide easy access to a geoid model in R.

Example
-------

This is a basic example which shows you how to load and plot the *potato*.

``` r
library(potato)
library(raster)
#> Loading required package: sp
plot(potato_raster, col = viridis::viridis(64))
```

![](README-example-1.png)

``` r


library(anglr)

globe_potato <- globe(anglr(aggregate(potato_raster, fact = 32)))

#rgl::rgl.clear()
#plot(globe_potato)
#rgl::rglwidget()
```
