
<!-- README.md is generated from README.Rmd. Please edit that file -->

# crbiodiversity

<!-- badges: start -->
<!-- badges: end -->

The goal of crbiodiversity is to retrieve biodiversity data of Costa
Rica

## Installation

You can install the development version of crbiodiversity like so:

``` r
# install.packages("devtools")
devtools::install_github("ManuelSpinola/crbiodiversity")
```

## Example

This is a basic example how to use the package:

``` r
library(tidyverse)
#> ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
#> ✔ dplyr     1.1.2     ✔ readr     2.1.4
#> ✔ forcats   1.0.0     ✔ stringr   1.5.0
#> ✔ ggplot2   3.4.2     ✔ tibble    3.2.1
#> ✔ lubridate 1.9.2     ✔ tidyr     1.3.0
#> ✔ purrr     1.0.1     
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
#> ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
library(spocc)
library(sf)
#> Linking to GEOS 3.11.0, GDAL 3.5.3, PROJ 9.1.0; sf_use_s2() is TRUE
library(crgeo)
library(crgrids)
library(crbiodiversity)
```

``` r
loc <- get_locations("Agalychnis callidryas")
#> 2 
#> 3
#> Warning: No species in eBird taxonomy with matching scientific name.:
#> Agalychnis callidryas
```

``` r
head(loc)
#> # A tibble: 6 × 6
#>   name                               longitude  latitude  prov  date       key  
#>   <chr>                              <chr>      <chr>     <chr> <date>     <chr>
#> 1 Agalychnis callidryas (Cope, 1862) -83.950451 10.325009 gbif  2023-01-02 4011…
#> 2 Agalychnis callidryas (Cope, 1862) -83.953133 10.33412  gbif  2023-01-03 4011…
#> 3 Agalychnis callidryas (Cope, 1862) -84.06818  10.4503   gbif  2023-01-03 4014…
#> 4 Agalychnis callidryas (Cope, 1862) -84.068276 10.450406 gbif  2023-01-03 4014…
#> 5 Agalychnis callidryas (Cope, 1862) -84.978972 10.707888 gbif  2023-01-07 4067…
#> 6 Agalychnis callidryas (Cope, 1862) -84.708118 10.438699 gbif  2023-01-07 4014…
```

``` r
get_map("Agalychnis callidryas")
#> 2 
#> 3
#> Warning: No species in eBird taxonomy with matching scientific name.:
#> Agalychnis callidryas
#> Warning: attribute variables are assumed to be spatially constant throughout
#> all geometries
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="100%" />
