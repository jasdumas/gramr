library(gramr)
context("write-good check of simple Rmd file")


write_good_check_of_Rmd_file <- write_good_file("test.Rmd")

test_that("it works on an Rmd file", {
  expect_equal(nrow(write_good_check_of_Rmd_file), 2)
  expect_equal(ncol(write_good_check_of_Rmd_file), 3)
})

context("write-good check of complex Rmd file")

write_good_check_of_Rmd_file_with_multiple_lines <- write_good_file("test_multiple_lines.Rmd")

test_that("it works on an Rmd file with multiple lines", {
  expect_equal(nrow(write_good_check_of_Rmd_file_with_multiple_lines), 2)
  expect_equal(ncol(write_good_check_of_Rmd_file_with_multiple_lines), 3)
})

