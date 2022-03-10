# load your libraries
library("shiny")

# read in your files (make sure to double check path)
source("app_ui.R")
source("meep.R")

# Create your shiny app by defining the UI and server
shinyApp(ui = ui, server = server)
