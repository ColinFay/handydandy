context("test-r6.R")

test_that("R6 gen works", {
  a <- Dandy$new()
  expect_is(a, "R6")
  expect_is(a, "Dandy")
})
