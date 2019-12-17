context("dyadr")

test_that("var_labels error works", {
  expect_error(var_labels(iris), "labels")
})

testthat::expect_message(apim("x"), "please enter a formula")

testthat::expect_gt(crsp(esd,esd0),0.3348468)

testthat::expect_equal_to_reference(smallsummary(apim), "p-value")