library(shiny)
library(miniUI)

# We'll wrap our Shiny Gadget in an addin.
# Let's call it 'clockAddin()'.
write_good_widget <- function() {

  # Our ui will be a simple gadget page, which
  # simply displays the time in a 'UI' output.
  ui <- miniPage(
    gadgetTitleBar("gramr"),
    miniContentPanel(

    )
  )

  server <- function(input, output, session) {


  }

  # We'll use a pane viwer, and set the minimum height at
  # 300px to ensure we get enough screen space to display the clock.
  viewer <- paneViewer(300)
  runGadget(ui, server, viewer = viewer)

}
