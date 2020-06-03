library(shiny)
library(ggplot2)

rating_sidepanel <- sidebarPanel(
  h2("Graph Settings"),
  h4("Pick a range of years:"),
  sliderInput(
    inputId = "years",
    label = "Years",
    min = 1986,
    max = 2016,
    value = c(1990, 2000),
    sep = ""
  ),
  h4("Select which rating to review: "),
  checkboxGroupInput(
    inputId = "rating",
    label = "Rating",
    choices = list(
      "G" = "G",
      "PG" = "PG",
      "PG-13" = "PG-13",
      "R" = "R"
    ),
    selected = "G"
  ), 
  h4("Now color your graph!"),
  radioButtons(
    inputId = "color",
    label = "Colors",
    choices = list(
      "Red" = "firebrick",
      "Blue" = "skyblue2",
      "Green" = "forestgreen",
      "Purple" = "darkorchid1"
    ),
    selected = "skyblue2"
  )
  
)

rating_mainpanel <- mainPanel(
  plotlyOutput("ratings_plot")
)

rating_page <- tabPanel(
  "Rating's Budgets",
  p("This bar graph conveys the budget use of specific to the moving ratings, between
     the years 1986 and 2016."),
  sidebarLayout(
    rating_sidepanel,
    rating_mainpanel
  )
)
