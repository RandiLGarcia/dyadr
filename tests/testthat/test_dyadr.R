context("dyadr")

test_that("var_labels error works", {
  expect_error(var_labels(iris), "labels")
})
