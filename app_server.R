# adds the sources to R files with plot scripts
source("scripts/audience_rating_chart_shiny.R")
source("scripts/income_budget_chart_shiny.R")
source("scripts/rating_budget_chart_shiny.R")
movies <- read.csv("data/movies.csv", stringsAsFactors = FALSE)

server <- function(input, output) {
  output$audience_ratings_plot <- renderPlotly({
    ratings_chart(input$rating_years, input$audience_ratings)
  })

  output$income_vs_budget <- renderPlotly({
    budget_vs_income(movies, input$years_input, input$size_input)
  })

  output$ratings_plot <- renderPlotly({
    budget_bar_chart(input$rating, input$years, input$color)
  })
}
