#' @title Binomial Random Variable
#' @description Creates an object of class 'binvar' (binomial random variable)
#' @param trials number of trials (integer)
#' @param prob probability of success in one trial (integer)
#' @return 'binvar' object with attributes trials and prob
#' @export
#' @examples
#' # Random Variable with 10 trials and probability 0.3
#' bin_variable(trials = 10, prob = 0.3)
bin_variable <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  res <- list(
    trials = trials,
    prob = prob)
  class(res) <- "binvar"
  res
}

# Binomial Variable Print
#' @export
print.binvar <- function(x, ...) {
  cat('"Binomial Variable"', '\n\n')
  cat("Parameters", '\n')
  cat("- number of trials: ", x$trials, "\n")
  cat("- prob of success : ", x$prob)
  invisible(x)
}

# Binomial Variable Summary
#' @export
summary.binvar <- function(x, ...) {
  obj <- list(
    trials = x$trials,
    prob = x$prob,
    mean = aux_mean(x$trials, x$prob),
    variance = aux_variance(x$trials, x$prob),
    mode = aux_mode(x$trials, x$prob),
    skewness = aux_skewness(x$trials, x$prob),
    kurtosis = aux_kurtosis(x$trials, x$prob)
  )
  class(obj) <- "summary.binvar"
  obj
}

# Print Binomial Variable Summary
#' @export
print.summary.binvar <- function(x, ...) {
  cat('"Summary Binomial"', '\n\n')
  cat('Parameters', '\n')
  cat("- number of trials: ", x$trials, '\n')
  cat("- prob of success : ", x$prob, '\n\n')
  cat('Measures', '\n')
  cat('- mean    :', x$mean, '\n')
  cat('- variance:', x$variance, '\n')
  cat('- mode    :', x$mode, '\n')
  cat('- skewness:', x$skewness, '\n')
  cat('- kurtosis:', x$kurtosis, '\n')
}