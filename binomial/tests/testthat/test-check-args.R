context("Check binomial arguments")

test_that("check_prob works correctly for numbers between 0 and 1", {

  expect_true(check_prob(0))
  expect_true(check_prob(1))
  expect_true(check_prob(1L))
  expect_true(check_prob(0.5))

})

test_that("check_prob returns error for single values not between 0 and 1", {

  expect_error(check_prob(-0.01),
               "\n'prob' value must be between 0 and 1")
  expect_error(check_prob(1.01),
               "\n'prob' value must be between 0 and 1")
  expect_error(check_prob('i'),
               "\n'prob' must be numeric of length 1")
  expect_error(check_prob(NA_integer_),
               "missing value where TRUE/FALSE needed")

})

test_that("check_prob returns error for inputs with length greater than 1", {

  expect_error(check_prob(c(0.5, 0.5)),
               "\n'prob' must be numeric of length 1")
  expect_error(check_prob(c('i', 'i')),
               "\n'prob' must be numeric of length 1")
  expect_error(check_prob(c(1L, NA_integer_)),
               "\n'prob' must be numeric of length 1")

})

test_that("check_trials works for non-negative integers", {

  expect_true(check_trials(0))
  expect_true(check_trials(500))

})

test_that("check_trials returns errors as expected", {

  expect_error(check_trials(0.5),
               "\n'trials' must be an integer")
  expect_error(check_trials(-1),
               "\n'trials' must be nonnegative")
  expect_error(check_trials(c(1,1)),
               "\n'trials' must be of length 1")
  expect_error(check_trials('H'),
               "\n'trials' must be numeric")

})

test_that("check_success works as expected for single inputs", {

  expect_true(check_success(2, 5))
  expect_true(check_success(0, 100))
  expect_true(check_success(5, 5))

  expect_error(check_success(-1, 5),
               "\n'success' values must each be nonnegative")
  expect_error(check_success(6, 5),
               "\n'success' values must each be less than or equal to 'trials'")
  expect_error(check_success('H', 5),
               "\n'success' must be a numeric vector")
  expect_error(check_success(0.5, 5),
               "\n'success' must be a vector of integers")

})

test_that("check_success works as expected for vector inputs", {

  expect_true(check_success(0:2, 5))
  expect_true(check_success(0:5, 5))
  expect_true(check_success(c(1, 10), 20))
  expect_true(check_success(c(4, 0, 3, 12, 9), 13))

  expect_error(check_success(c(2, 6), 5),
               "\n'success' values must each be less than or equal to 'trials'")
  expect_error(check_success(c(2, -1), 5),
               "\n'success' values must each be nonnegative")
  expect_error(check_success(c(2, 'H'), 5),
               "\n'success' must be a numeric vector")
  expect_error(check_success(c(2, 0.4444), 5),
               "\n'success' must be a vector of integers")

})
