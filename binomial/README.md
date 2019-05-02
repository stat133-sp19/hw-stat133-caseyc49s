# Binomial Package

This package is my __workout 3__ assignment for the Stat 133 class at UC Berkeley. The package contains functions, objects, and methods for binomial distributions. The public scripts included in the package are as follows:

### Summary Measures : [summary_measures](R/summary_measures.R):

1. __`bin_mean`__ : binomial mean
2. __`bin_variance`__ : binomial variance
3. __`bin_mode`__ : binomial mode
4. __`bin_skewness`__ : binomial skewness
5. __`bin_kurtosis`__ : binomial kurtosis

### Binomial Functions : [binomial_functions](R/binomial_functions.R)

1. __`bin_choose`__ : binomial choose calculates n choose k
2. __`bin_probability`__ : binomial probability calculates probability of success in a number of trials

### Distribution Objects : [distribution_objects](R/distribution_objects.R)

1. __`bin_distribution`__ : Constructor of "Binomial Distrubution" object of class `c("bindis", "data.frame")`
    + __`plot.bindis`__ : generic S3 method to plot the binomial distribution
2. __`bin_cumulative`__ : Constructor of "Cumulative Binomial Distrubution" object of class `c("bincum", "data.frame")`
    + __`plot_bincum`__ : generic S3 method to plot the cumulative binomial distribution
    
### Binomial Variable : [bin_variable](R/bin_variable.R)

1. __`bin_variable`__ : Creates a random "Binomial Variable" object of class `"binvar"` 
    + __`print.binvar`__ : generic S3 method to print the random variable
    + __`summary.binvar`__ : generic S3 method that creates a summary of the random variable
    + __`print.summary.binvar`__ : generic S3 method to print the summary of the random variable

## Usage

For more information about how to use this package, please reference the [Vignettes](vignettes). 
