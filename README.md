
# coolors

Need a quick color palette for a plot or map in R?

I use [coolors.co](https://coolors.co) multiple times a day to find
color palettes. With how often I was visiting the site and exporting hex
codes, I finally got around to writing this package containing a handful
(currently \~2,000) of the site’s five-color palettes.

## Installation

``` r
# install.packages("devtools")
devtools::install_github("simmwill/coolors")
```

## Basic usage

This simple package has two functions: generate a **coolors** color
palette (randomly by default), and recall the current session’s history
of generated palettes.

``` r
library(coolors)

# generate a few random coolors palettes
palette_coolors()
```

![](man/figures/README-example-1.png)<!-- -->

``` r
palette_coolors()
```

![](man/figures/README-example-2.png)<!-- -->

``` r
palette_coolors()
```

![](man/figures/README-example-3.png)<!-- -->

``` r
# see history, with most recent at top of list
coolors_history()
#> [[1]]
#> Most recent:  
#>           336 
#> 
#> [[2]]
#> [1] 346
#> 
#> [[3]]
#> [1] 450
```

## Other features

We can also use `palette_coolors(n = #)` to generate a palette shorter
or longer than the default five. If shorter than five, the palette will
simply be truncated; if longer, colors will be interpolated.

Let’s use one of the palettes we generated above and confirmed using
`coolors_history()`: palette `336`. We can specify this identifier in
the `palette_num` argument.

``` r
# 100-color palette (nearly a gradient)
palette_coolors(palette_num = 336, n = 100)
```

![](man/figures/README-example2-1.png)<!-- -->

``` r
# 2-color palette (chooses the first two colors)
palette_coolors(palette_num = 336, n = 2)
```

![](man/figures/README-example2-2.png)<!-- -->

Finally, if we just want the hex codes for a palette, we can use `hex =
TRUE`.

``` r
# generate hex codes for palette 336
palette_coolors(palette_num = 336, hex = TRUE)
#> Coolors palette 336
#> [1] "#4f6d7a" "#c0d6df" "#dbe9ee" "#4a6fa5" "#166088"
```

## Notes

All color palettes courtesy of [coolors.co](https://coolors.co) and its
creator, [Fabrizio Bianchi](http://fabrizio.io/). This package also
draws inspiration from several wonderful color palette packages,
including `wesanderson`.
