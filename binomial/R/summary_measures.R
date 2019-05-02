#' @title Binomial Mean
#' @description Calculates the mean of the distribution
#' @param trials number of trials (integer)
#' @param prob probability of success in one trial (integer)
#' @return Calculated mean
#' @export
#' @examples
#' # distribution with 10 trials and probability 0.3
#' bin_mean(trials = 10, prob = 0.3)
bin_mean <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_mean(trials, prob)
}

#' @title Binomial Variance
#' @description Calculates the variance of the distribution
#' @param trials number of trials (integer)
#' @param prob probability of success in one trial (integer)
#' @return Calculated variance
#' @export
#' @examples
#' # distribution with 10 trials and probability 0.3
#' bin_variance(trials = 10, prob = 0.3)
bin_variance <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_variance(trials, prob)
}

#' @title Binomial Mode
#' @description Calculates the mode of the distribution
#' @param trials number of trials (integer)
#' @param prob probability of success in one trial (integer)
#' @return Calculated mode
#' @export
#' @examples
#' # distribution with 10 trials and probability 0.3
#' bin_mode(trials = 10, prob = 0.3)
bin_mode <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_mode(trials, prob)
}

#' @title Binomial Skewness
#' @description Calculates the skewness of the distribution
#' @param trials number of trials (integer)
#' @param prob probability of success in one trial (integer)
#' @return Calculated skewness
#' @export
#' @examples
#' # distribution with 10 trials and probability 0.3
#' bin_skewness(trials = 10, prob = 0.3)
bin_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_skewness(trials, prob)
}

#' @title Binomial Kurtosis
#' @description Calculates the kurtosis of the distribution
#' @param trials number of trials (integer)
#' @param prob probability of success in one trial (integer)
#' @return Calculated kurtosis
#' @export
#' @examples
#' # distribution with 10 trials and probability 0.3
#' bin_kurtosis(trials = 10, prob = 0.3)
bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_kurtosis(trials, prob)
}

# private auxilliary function to calculate mean
aux_mean <- function(trials, prob) {trials*prob}

# private auxilliary function to calculate variance
aux_variance <- function(trials, prob) { trials * prob * (1 - prob) }

# private auxilliary function to calculate mode
aux_mode <- function(trials, prob) {
  if (prob == 1) {
    return(trials)
  }
  (trials * prob + prob) %/% 1
}

# private auxilliary function to calculate skewness
aux_skewness <- function(trials, prob) { (1 - 2 * prob) / sqrt(aux_variance(trials, prob))}

# private auxilliary function to calculate kurtosis
aux_kurtosis <- function(trials, prob) {(1 - 6*prob*(1 - prob)) / aux_variance(trials, prob)}
