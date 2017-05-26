#' Check the grammar of an in-progress document within RStudio
#' If you have an 'UntitledX' document check the grammar before saving the file.
#' @return a print out of suggestions for grammar fixes
#' @export
write_good_ip <- function(){
  # Check a in-progress Untitled document before saving
  untitled <- rstudioapi::getActiveDocumentContext()
  # remove empty lines
  untitled_text <- untitled$contents[untitled$contents != "" ]
  # remove a bunch of other things
  untitled_text <- prep_text(untitled_text)
  cmd <- paste0("write-good --text='", untitled_text, "'")
  sapply(cmd, system)
}

prep_text <- function(text){

  # remove all line breaks, http://stackoverflow.com/a/21781150/1036500
  text <- gsub("[\r\n]", " ", text)

  # don't include front yaml
  text <- gsub("---.*--- ", "", text)

  # don't include text in code chunks: https://regex101.com/#python
  text <- gsub("```\\{.+?\\}.+?```", "", text)

  # don't include text in in-line R code
  text <- gsub("`r.+?`", "", text)

  # don't include HTML comments
  text <- gsub("<!--.+?-->", "", text)

  # don't include LaTeX comments
  # how to do this? %%

  # don't include inline markdown URLs
  text <- gsub("\\(http.+?\\)", "", text)

  # don't include images with captions
  text <- gsub("!\\[.+?\\)", "", text)

  # don't include # for headings
  text <- gsub("#*", "", text)

  # don't include html tags
  text <- gsub("<.+?>|</.+?>", "", text)

  # don't include LaTeX \eggs{ham}
  # how to do? problem with capturing \x


  if(nchar(text) == 0){
    stop("You have not selected any text. Please select some text with the mouse and try again")
  } else {

  return(text)

  }

}
