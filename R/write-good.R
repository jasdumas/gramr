#' Write Good
#'
#' Supply a RMarkdown document to the write-good linter
#'
#' @import htmlwidgets
#'
#' @export
write_good <- function(document, passive = T, illusion = T,
                       so = T, thereIs = T, weasel = T,
                       adverb = T, tooWordy = T, cliches = T,
                       eprime = T
                       ) {

  # create a list that contains the settings
  settings <- list(
    document = document,
    passive = '--passive',
    illusion = '--illusion',
    so = '--so',
    thereIs = '--thereIs',
    weasel = '--weasel',
    adverb = '--adverb',
    tooWordy = '--tooWordy',
    cliches = '--cliches',
    eprime = '--emprime'
  )

  # pass the data and settings using 'x'
  x = list(
    settings = settings
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'write-good',
    x,
    package = 'gramr'
  )
}

#' Shiny bindings for write-good
#'
#' Output and render functions for using write-good within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a write-good
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name write-good-shiny
#'
#' @export
write_goodOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'write-good', width, height, package = 'gramr')
}

#' @rdname write-good-shiny
#' @export
renderWrite_good <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, write_goodOutput, env, quoted = TRUE)
}
