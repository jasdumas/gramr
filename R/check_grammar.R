#' check_grammar
#'
#' @description Checks a piece of text for common grammatical errors and returns a list of
#' suggestions.
#'
#' @param text
#' The text to check
#' @param options
#' Which rules should be ignored see https://github.com/btford/write-good for details.
#'
#' @return
#' A character vector of suggestions for grammar changes.
#' @export
#'
#' @examples
#'
#' check_grammar("So the cat was stolen.", list(passive = FALSE))
#'
#'
check_grammar <-  function(text, options = list()) {
  ct <- init_write_good()
  suggestions <- ct$call("writeGood",
                         text,
                         options)
  out <- suggestions$reason
  out
}


#' Check the grammar of an in-progress document within RStudio
#' If you have an 'UntitledX' document check the grammar before saving the file.
#' @return a print out of suggestions for grammar fixes
#' @export
#' @importFrom rstudioapi getSourceEditorContext
#' @import V8
#' @examples
#' # don't run during tests
#' # write_good_ip()
write_good_ip <- function(){
  # Check a in-progress Untitled document before saving
  untitled <- rstudioapi::getSourceEditorContext()
  # remove empty lines
  untitled_text <- untitled$contents[untitled$contents != "" ]
  # combine into single chr vector
  untitled_text <- paste0(untitled_text, collapse = " ")
  #  load write-good
  ct <- init_write_good()
  # analyse the text
  write_good_output <- ct$call("writeGood", untitled_text)
  if(is.null(nrow(write_good_output))) {
    message("write-good found no problems. Your writing is good!")
  } else {
    return(write_good_output)
  }
}


#' Check the grammar of a Rmd by filename
#'
#'
#' @param filename the name of an Rmd file. Does not have to be open in RStudio.
#' @return a print out of suggestions for grammar fixes
#' @export

#' @import V8
#' @examples
#' # don't run during tests
#' # write_good_file()
write_good_file <- function(filename = ""){
  # Check a in-progress Untitled document before saving
  file_text <- paste(scan(filename, 'character', quiet = TRUE), collapse = " ")
  #  load write-good
  ct <- init_write_good()
  # analyse the text
  write_good_output <- ct$call("writeGood", file_text)
  if(is.null(nrow(write_good_output))) {
    message("write-good found no problems. Your writing is good!")
  } else {
    return(write_good_output)
  }
}

