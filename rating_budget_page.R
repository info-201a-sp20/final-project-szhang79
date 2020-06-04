library(shiny)
library(ggplot2)

#creates a sidepanel of the widgets
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

# Creates a mainpanel of the plot
rating_mainpanel <- mainPanel(
  plotlyOutput("ratings_plot")
)

# creates a tab page for rating's budget
rating_page <- tabPanel(
  "Rating's Budgets",
  p("This bar graph conveys the budget use of specific to the moving ratings,
   between the years 1986 and 2016."),
  sidebarLayout(
    rating_sidepanel,
    rating_mainpanel
  )
)

# summary analysis of the rating's budget throughout the years
rating_budget_summary <- "Besides the rated R category, all the rating
categories increase the budget of the movies throughout the 30 years.
The rated G movie productions have a trend of acquiring a higher budget
compared to the other rating categories, and the budget increases as the
years progress. The rated R category stays at a consistent budget rate
per yearly, and it is generally far lower budget compared to the other
ratings. Through these important notes in the bar graph, it can be concluded
that the average budget of movies in general have increased over the years,
and specifically G rated movies have a larger budget than the rest of
the ratings."
