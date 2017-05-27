library(gramr)
context("write-good check of simple Rmd file")


write_good_check_of_Rmd_file <- write_good_file("test.Rmd")

test_that("it works on an Rmd file", {
  expect_is(write_good_check_of_Rmd_file, "knitr_kable")
})

context("write-good check of complex Rmd file")

write_good_check_of_Rmd_file_with_multiple_lines <- write_good_file("test_multiple_lines.Rmd")

test_that("it works on an Rmd file with multiple lines", {
  expect_is(write_good_check_of_Rmd_file_with_multiple_lines, "knitr_kable")
})

