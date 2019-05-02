# Private Checker Functions

# private function to check vector of 'prob'
check_prob <- function(prob) {
  if (!is.numeric(prob) | !length(prob) == 1) {
    stop("\n'prob' must be numeric of length 1")
  }
  if (any(prob < 0) | any(prob > 1)) {
    stop("\n'prob' value must be between 0 and 1")
  }
  TRUE
}

# private function to check vector of 'trials'
check_trials <- function(trials) {
  if ( length(trials) > 1) {
    stop("\n'trials' must be of length 1")
  }
  if ( !is.numeric(trials)) {
    stop("\n'trials' must be numeric")
  }
  if ( trials %% 1 != 0) {
    stop("\n'trials' must be an integer")
  }
  if (trials < 0) {
    stop("\n'trials' must be nonnegative")
  }
  TRUE
}

# private function to check vector of 'success'
check_success <- function(success, trials) {
  if ( !is.numeric(success) ) {
    stop("\n'success' must be a numeric vector")
  }
  if ( any(success %% 1 != 0) ) {
    stop("\n'success' must be a vector of integers")
  }
  if ( any(success < 0) ) {
    stop("\n'success' values must each be nonnegative")
  }
  if (any(success > trials)) {
    stop("\n'success' values must each be less than or equal to 'trials'")
  }
  TRUE
}
