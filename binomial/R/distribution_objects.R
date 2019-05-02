#' @title Bin Distribution
#' @description Creates an object of class 'bindis' (binomial distribution)
#' @param trials number of trials (integer)
#' @param prob probability of success in one trial (integer)
#' @return 'bindis' data.frame with successes and probability
#' @export
#' @examples
#' # binomial probability distribution
#' bin_distribution(trials = 5, prob = 0.5)
bin_distribution <- function(trials, prob = 0.5) {
  success <-  0:trials
  probability <- bin_probability(success, trials, prob)
  res <- data.frame(success, probability)
  class(res) <- c("bindis", "data.frame")
  return(res)
}

# Binomial Distribution Plot
#' @export
plot.bindis <- function(x, ...) {
  barplot(x$probability,
          names.arg = x$success,
          xlab = "Successes",
          ylab = "Probability")
  title("Binomial Distribution")
}

#' @title Cumulative Binomial Distribution
#' @description Creates an object of class 'bincum' (cumulative binomial distribution)
#' @param trials number of trials (integer)
#' @param prob probability of success in one trial (integer)
#' @return 'bincum' data.frame with successes, probability, and cumulative probability
#' @export
#' @examples
#' # binomial probability distribution
#' bin_cumulative(trials = 5, prob = 0.5)
bin_cumulative <- function(trials, prob) {
  bincum <- bin_distribution(trials, prob)
  bincum$cumulative <- cumsum( bincum$probability )
  class(bincum) <- c("bincum", "data.frame")
  return(bincum)
}

# Cumulative Binomial Distribution Plot
#' @export
plot.bincum <- function(x, ...) {
  plot(x = x$success,
       y = x$cumulative,
       xlab = "Successes",
       ylab = "Cumulative")
  lines(x = x$success,
        y = x$cumulative)
  title("Cumulative Binomial Distribtion")
}

