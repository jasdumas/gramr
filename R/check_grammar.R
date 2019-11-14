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
#' @import V8 knitr
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
  write_good_output_tidy <- kable(write_good_output)
  if(is.null(nrow(write_good_output))) {
    message("write-good found no problems. Your writing is good!")
  } else {
    return(write_good_output_tidy)
  }
}


#' Check the grammar of a Rmd by filename
#'
#'
#' @param filename the name of an Rmd file. Does not have to be open in RStudio.
#' @param exclude_chunks exclude RMarkdown code chunks. Defaults to FALSE.
#' @param verbose display a message in case of good writing. Defaults to TRUE.
#' @return a data.frame with suggestions for grammar fixes
#' @export

#' @import V8 knitr
#' @examples
#' # don't run during tests
#' # write_good_file()
write_good_file <- function(
  filename = "", exclude_chunks = FALSE, verbose = TRUE
) {
  # Check a in-progress Untitled document before saving
  file_text <- scan(filename, 'character', quiet = TRUE)
  if (exclude_chunks) {
    file_text <- remove_chunks(file_text)
  }
  file_text <- paste(file_text, collapse = " ")
  #  load write-good
  ct <- init_write_good()
  # analyse the text
  write_good_output <- ct$call("writeGood", file_text)
  if (is.null(nrow(write_good_output))) {
    if (verbose) {
      message("write-good found no problems. Your writing is good!")
    }
    write_good_output <- data.frame(
      index = integer(0),
      offset = integer(0),
      reason = character(0),
      stringsAsFactors = FALSE
    )
  }
  class(write_good_output) <- c("write_good", "data.frame")
  return(write_good_output)
}

remove_chunks <- function(file_text) {
  chunk_start <- grep("```\\{?r", file_text)
  chunk_end <- which(file_text == "```")
  chunks <- integer(0)
  while (length(chunk_start) && length(chunk_end)) {
    end <- which(chunk_end > chunk_start[1])
    if (length(end) == 0) {
      break
    }
    chunks <- c(chunks, chunk_start[1]:chunk_end[min(end)])
    chunk_start <- chunk_start[-1]
    chunk_end <- chunk_end[-min(end)]
  }
  if (length(chunk_start) > 0) {
    stop("chunk without ending '```'")
  }
  # handles chunks starting and ending with ```
  while (length(chunk_end) %/% 2) {
    chunks <- c(chunks, chunk_end[1]:chunk_end[2])
    chunk_end <- chunk_end[-1:-2]
  }
  if (length(chunks) == 0) {
    return(file_text)
  }
  file_text[-chunks]
}

#' @export
print.write_good <- function(x, ...) {
  print(kable(x))
}
