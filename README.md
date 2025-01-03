
<!-- README.md is generated from README.Rmd. Please edit that file -->

# topoclimate.pred

<!-- badges: start -->
<!-- badges: end -->

This R package generates high-resolution estimates of tree-specific
bioclimate variables for landscapes across North America. It calculates
bioclimate based on the fitted model described in [“A tree’s view of the
terrain” (Kling, Baer, and Ackerly, 2024,
Ecography)](https://doi.org/10.1111/ecog.07131), which uses tree species
distributions as climate indicators. The outputs are estimates of
fine-scale climate patterns as experienced by trees, and may not
correspond to microclimate measured using standard approaches.

## Installation

You can install the development version of topoclimate.pred like so:

``` r
devtools::install_github("matthewkling/topoclimate.pred")
```

## Usage

All you need in order to use the package is an elevation raster for a
landscape of interest in the US or Canada.

Here’s a quick example using the `moonshine` elevation dataset (a 10 m
resolution USGS DEM for a landscape near Moonshine Peak in Idaho), which
comes loaded with the package. Note that this is the same dataset used
for the downscaling example in the paper cited above. To get a look at
the data before we use it to calculate bioclimate, let’s make a quick
terrain map for this landscape; we’ll use the `terrain` and `hillShade`
functions from the `raster` package, which loads with this library:

``` r
library(topoclimate.pred)
hillshade <- hillShade(terrain(moonshine, "slope"), terrain(moonshine, "aspect"))
plot(hillshade, col = colorRampPalette(c("black", "white"))(50), legend = F)
```

<img src="man/figures/README-topo-1.png" width="100%" />

To generate microclimate estimates, we simply pass our elevation raster
to the `bioclimate()` function. This function generates a set of terrain
and macroclimate variables for the landscape, and then uses them in
combination with the maximum likelihood estimates for the fitted model
(trained on North American tree species distributions) to estimate
bioclimate. The computation takes several minutes for a landscape of
this extent and resolution, and returns a raster with three layers:
“high_temp” represents summer maximum temperature in degrees C,
“low_temp” represents winter minimum temperature in degrees C, and
“moisture” corresponds to total annual precipitation in mm.

``` r
clim <- bioclimate(moonshine)
plot(clim, col = viridis::viridis_pal()(50), nrow = 1)
```

<img src="man/figures/README-clim-1.png" width="100%" />
