context("test-r6.R")

test_that("R6 gen works", {
  css <- Dandy$new()
  expect_is(css, "R6")
  expect_is(css, "Dandy")
  css$add_style("body", list("font-family" = "Helvetica",
                             "color" = "#24292e"))
  css$add_style("h2", list("font-size" = "3 em",
                           "color" = "#911414",
                           "text-align" = "center"))
  expect_match(css$swag(), 'Helvetica')
  expect_match(css$swag(), '#24292e')
  expect_match(css$swag(), '#911414')
  expect_match(css$swag(), '3 em')
  expect_equal(length(css$styles), 2)
})
