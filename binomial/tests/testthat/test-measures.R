context("Summary Measures")

test_that("aux_mean works as expected", {
  
  expect_equal(aux_mean(10, 0.3), 3)
  expect_equal(aux_mean(2, 1), 2)
  expect_equal(aux_mean(5, 0.5), 2.5)
  
  expect_is(aux_mean(10, 0.3), 'numeric')
  expect_length(aux_mean(10, 0.3), 1)
  
})

test_that("aux_variance works as expected", {
  
  expect_equal(aux_variance(10, 0.3), 2.1)
  expect_equal(aux_variance(5, 0.5), 1.25)
  expect_equal(aux_variance(5, 0), 0)
  
  expect_is(aux_variance(10, 0.3), 'numeric')
  expect_length(aux_variance(10, 0.3), 1)
  
})

test_that("aux_mode works as expected", {
  
  expect_equal(aux_mode(10, 0.3), 3)
  expect_equal(aux_mode(5, 0), 0)
  expect_equal(aux_mode(10, 1), 10)
  
  expect_is(aux_mode(10, 0.3), 'numeric')
  expect_length(aux_mode(10, 0.3), 1)
  
})

test_that("aux_skewness works as expected", {
  
  expect_equal(aux_skewness(10, 0.3), 0.2760262, tolerance = 0.001)
  expect_equal(aux_skewness(10, 0), Inf)
  expect_equal(aux_skewness(10, 1), -Inf)
  
  expect_is(aux_skewness(10, 0.3), 'numeric')
  expect_length(aux_skewness(10, 0.3), 1)
  
})

test_that("aux_kurtosis works as expected", {
  
  expect_equal(aux_kurtosis(10, 0.3), -0.1238095, tolerance = 0.001)
  expect_equal(aux_kurtosis(10, 0), Inf)
  expect_equal(aux_kurtosis(10, 1), Inf)
  
  expect_is(aux_kurtosis(10, 0.3), 'numeric')
  expect_length(aux_kurtosis(10, 0.3), 1)
  
})