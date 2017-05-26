#' Check the grammar of an in-progress document within RStudio
#' If you have an 'UntitledX' document check the grammar before saving the file.
#' @return a print out of suggestions for grammar fixes
#' @export
#' @examples
#' # don't run during tests
#' # write_good_ip()
write_good_ip <- function(){
  # Check a in-progress Untitled document before saving
  untitled <- rstudioapi::getSourceEditorContext()
  # remove empty lines
  untitled_text <- untitled$contents[untitled$contents != "" ]
  cmd <- paste0("write-good --text='", untitled_text, "'")
  sapply(cmd, system)
}
