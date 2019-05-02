#' @title Binomial Choose
#' @description Calculates number of ways to have k successes in n trials
#' @param n integer for number of trials (default 10)
#' @param k integer for number of successes (default 0.5)
#' @return Count of combinations with k successes over n trials
#' @export
#' @examples
#' # default
#' bin_choose()
#'
#' # 2 successes in 5 trials
#' bin_choose(n = 5, k = 2)
#'
#' # no successes in 5 trials
#' bin_choose(5, 0)
bin_choose <- function(n = 0, k = 0) {
  if (any(k > n)) {
    stop("k cannot be greater than n")
  }

  return(factorial(n) / (factorial(k) * factorial(n - k)))
}

#' @title Binomial Probability
#' @description Calculates probability of success over trials
#' @param success number of successes (integer)
#' @param trials number of trials (integer)
#' @param prob probability of success in one trial (integer)
#' @return the overall probability of success over trials
#' @export
#' @examples
#' # probability of getting 2 successes in 5 trials
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#'
#' # 2 or less successes in 5 trials
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#'
#' # 55 heads in 100 tosses of a loaded coin with 45% chance of success
#' bin_probability(success = 55, trials = 100, prob = 0.45)
bin_probability <- function(success, trials, prob = 0.5) {
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  return(bin_choose(trials,success) * (prob^success) * (1-prob)^(trials-success) )
}
