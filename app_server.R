# adds the sources to R files with plot scripts
source("scripts/audience_rating_chart_shiny.R")

server <- function(input, output) {
  output$audience_ratings_plot <- renderPlot(
    ratings_chart(input$rating_years, input$audience_ratings)
    )
}
