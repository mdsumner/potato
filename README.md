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

potato <- anglr(aggregate(potato_raster, fact = 6))
## we can exaggerate the relief, or just reduce the radius
##globe_potato <- globe(potato, gproj = "+proj=geocent +a=637")

## forget the globe for now until I can figure it out again
rgl::rgl.clear()
plot(potato)
rgl::aspect3d(1, 1, 0.5)
rgl::rglwidget()
```

![](README-example-2.png)
