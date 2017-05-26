#' Title
#'
#' @return
#' @export
#'
#' @examples
parse_rmd <- function(file){
  text_df <- dplyr::data_frame(
    text = readLines(file),
    is_code = FALSE
  )
  text_df$line_num <- 1:nrow(text_df)
  text_df$code_mark = stringr::str_detect(text_df$text, "^```") |
                      stringr::str_detect(text_df$text, "---")
  text_df$is_code[text_df$code_mark] <- TRUE

  flip_flop <- TRUE
  for (i in seq_along(text_df$text)) {
    if (flip_flop) {
      text_df$is_code[i] <- TRUE
    }
    if (text_df$code_mark[i] && i > 1) {
      flip_flop <- !flip_flop
    }
  }

  text_df$grammar_check <- purrr::map(text_df$text, check_grammar)
  text_df
}
