library(gramr)
context("write-good check of Rmd file")

write_good_check_of_Rmd_file <- write_good_file("test.Rmd")

test_that("it works on an Rmd file", {
  expect_equal(nrow(write_good_check_of_Rmd_file), 2)
  expect_equal(ncol(write_good_check_of_Rmd_file), 3)
})
