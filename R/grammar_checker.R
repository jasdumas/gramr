# Define UI for application that draws a histogram

#' Start grammar checker
#'
#' @description Start the grammar checker
#'
#' @return
#' @export
#'
#' @examples
run_grammar_checker <- function(){
ui <- shiny::fluidPage(
   # Application title
   shiny::titlePanel("Check Grammar"),
   shiny::textInput(inputId = 'text', label = 'Text to Check', value = "So the cat was stolen."),
   shiny::checkboxGroupInput(inputId = 'options',
                      label = "Ignore",
                      choiceNames = list("Passive Voice",
                                         "Duplicate words (the the)",
                                         "'So' at start of sentence",
                                         "'There is/are; at start of sentence",
                                         "Avoid weasel words",
                                         "Wordiness",
                                         "Problematic Adverbs",
                                         "Cliches",
                                         "Avoid 'Being' words"),
                      choiceValues = list("passive", "illusion", "so", "thereIs","weasle",
                                          "adverb", "toWordy", "cliches", "eprime")
   ),
   shiny::verbatimTextOutput(outputId = "text")

)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$text <- shiny::renderText({
    option_list <- lapply(input$options, function(x)FALSE)
    names(option_list) <- input$options
    out <- check_grammar(input$text, option_list)
    out <- paste(out, collapse = "\n")
    out
  })
}

# Run the application
shiny::shinyApp(ui = ui, server = server)
}
