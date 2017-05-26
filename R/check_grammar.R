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
