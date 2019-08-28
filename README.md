# Intro to Plotting and Aesthetics in R

This is a very basic introduction to using `R` and `R Studio` to plot
biological data that you would otherwise be doing in excel.

`R` is an incredibly powerful tool, not only for statistical computing but also in creating easily readable and aesthetically pleasing plots.

If you find yourself plotting similar data multiple times, creating an `R` script can save you a lot of time in producing publication quality plots with reproducible results.

### In this tutorial we will:
0. Get a very basic introduction to data and plotting in `R`.
1. Play around with some plotting in R with ggplot.
1. Import basic formatted data into R.
2. Plot and interpret a basic protein concentration assay.
2. Plot and interpret a basic enymatic assay.
3. Replot a chromatogram to make things look nicer.

## Getting started.
To begin with, we will be working through an IDE `R Studio` that makes you life a lot easier when writing any kind of R code. You can troubleshoot a lot easier and see your data and plots in the same app.

### Very, *very* brief introduction to `R`
You can create `variables` with simple code like the following, and do some basic computing on them.

```r
x <- 10
y <- 5
sum <- x + y
print(sum)
```

### Open the .html files
These should have worked examples with the data files that are also in this file. Have a play around.