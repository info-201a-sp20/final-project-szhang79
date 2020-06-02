audience_rating_page <- tabPanel(
  "Audience Ratings",
  p("This graph aims to show how the number of movies rated G, PG, PG-13, and R
  fluctuated between 1986 and 2016."),
  sidebarLayout(
    audience_side_panel,
    audience_main_panel
  )
)

# control widgets for graph settings
audience_side_panel <- sidebarPanel(
  h2("Graph Settings"),
  h4("Pick a range of years:"),
  sliderInput(
    inputId = "rating_years",
    label = "Years",
    min = 1986,
    max = 2016,
    value = c(2000, 2010),
    sep = ""
  ),
  h4("Pick the audience rating(s):"),
  checkboxGroupInput(
    inputId = "audience_ratings",
    label = "Ratings",
    choiceNames = list("G", "PG", "PG-13", "R"),
    choiceValues = list("G", "PG", "PG-13", "R"),
    selected = list("G", "PG", "PG-13", "R")
  )
)

# line graph
audience_main_panel <- mainPanel(
  plotlyOutput("audience_ratings_plot"),
)
