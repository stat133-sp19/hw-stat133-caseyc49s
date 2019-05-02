context("Binomial Functions")

test_that("bin_choose works as expected when k <= n", {
  
  expect_equal(bin_choose(5, 2), 10)
  expect_equal(bin_choose(5, 5), 1)
  expect_equal(bin_choose(5, 1:3), c(5, 10, 10))
  
  expect_length(bin_choose(5, 1:3), 3)
  expect_length(bin_choose(5, 1), 1)
  
})

test_that("bin_choose returns errors as expected", {
  
  expect_error(bin_choose(5, 6), 
               "k cannot be greater than n")

})

test_that("bin_probability works as expected for valid inputs", {
  
  expect_equal(bin_probability(2, 5, 0.5), 0.3125, tolerance = 0.001)
  expect_equal(bin_probability(0:2, 5, 0.5), c(0.03125, 0.15625, 0.31250), tolerance = 0.001)
  expect_equal(bin_probability(55, 100, 0.45), 0.01075277, tolerance = 0.001)
  
  expect_length(bin_probability(1,1,0), 1)
  expect_length(bin_probability(0:5, 5, 0.5), 6)
  
})

test_that("bin_probability errors as expected for invalid inputs", {
  
  expect_error(bin_probability(0.5, 5, 0.5), 
               "\n'success' must be a vector of integers")
  expect_error(bin_probability(2, -5, 0.5), 
               "\n'trials' must be nonnegative")
  expect_error(bin_probability(2, 5, 100),
               "\n'prob' value must be between 0 and 1")
  
})

test_that("bin_distribution works as expected", {
  x <- data.frame(list(
    success = 0:5,
    probability = c(
      0.03125,
      0.15625,
      0.31250,
      0.31250,
      0.15625,
      0.03125)))
  class(x) <- c("bindis", "data.frame")
  
  y <- data.frame(list(
    success = 0:3,
    probability = c(
      0.512,
      0.384,
      0.096,
      0.008)))
  class(y) <- c("bindis", "data.frame")
  
  z <- data.frame(list(
    success = 0:3,
    probability = c(
      0, 
      0, 
      0, 
      1)))
  class(z) <- c("bindis", "data.frame")

  expect_equal(bin_distribution(5, 0.5), x, tolerance = 0.001)
  expect_equal(bin_distribution(3, 0.2), y, tolerance = 0.001)
  expect_equal(bin_distribution(3, 1), z, tolerance = 0.001)
  
  expect_is(bin_distribution(3, 1), c("bindis", "data.frame"))
  
})

test_that("bin_cumulative works as expected", {
  w <- data.frame(list(
    success = 0:5,
    probability = c(
      0.03125,
      0.15625,
      0.31250,
      0.31250,
      0.15625,
      0.03125),
    cumulative = c(
      0.03125,
      0.18750,
      0.50000,
      0.81250,
      0.96875,
      1.00000)))
  class(w) <- c("bincum", "data.frame")
  expect_equal(bin_cumulative(5, 0.5), w, tolerance = 0.001)
  expect_is(bin_cumulative(5, 0.5), c("bincum", "data.frame"))
  expect_length(bin_cumulative(5, 0.5), 3)
  
})
