audience_rating_page <- tabPanel(
  "Audience Ratings",
  sidebarPanel(
    h2("Graph Settings"),
    h4("Pick a range of years:"),
    sliderInput(
      inputId = "rating_years",
      label = "Years",
      min = 1986,
      max = 2016,
      value = c(2000, 2010)
    ),
    h4("Pick the audience rating(s):"),
    checkboxGroupInput(
      inputId = "audience_ratings",
      label = "Ratings",
      choiceNames = list("G", "PG", "PG-13", "R"),
      choiceValues = list("G", "PG", "PG-13", "R"),
      selected = list("G", "PG", "PG-13", "R")
    )
  ),
  mainPanel(
    plotOutput("audience_ratings_plot")
  )
)
