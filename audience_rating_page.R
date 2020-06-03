# creates the tab page for audience rating over time analysis
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

# plots the line graph
audience_main_panel <- mainPanel(
  plotlyOutput("audience_ratings_plot"),
)

# notable pattern anaylsis for conclusion page
audience_rating_summary <- "There has been a significant increase in
PG-13 movies and decrease in PG movies over 30 years. In 1986, there
were 53 PG movies and 46 PG-13 movies which is a difference of 7 more
PG movies. 1989 marks the year that PG-13 movies surpassed the number
of PG movies, and the divide has only continued to grow since then. By
2016, there were 84 PG-13 movies and only 25 PG movies, making that a
difference of 59 more PG-13 movies. This pattern could mean that in
the future there will be a much smaller variety of PG movies for
younger children to watch, perhaps even to the level of G movies that
has less than 10 per year."
