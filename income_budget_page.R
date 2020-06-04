library(shiny)
library(ggplot2)

# creates the side panel that contains the widgets
income_budget_side_panel <- sidebarPanel(
  h2("Graph Settings"),
  h4("Pick a range of years:"),
  sliderInput(
    inputId = "years_input",
    label = "Years",
    min = 1986,
    max = 2016,
    value = c(1986, 2016),
    sep = ""
  ),
  h4("Pick size of marker:"),
  radioButtons(
    inputId = "size_input",
    label = "Size of Marker",
    choices = list("1" = 2, "2" = 4, "3" = 6, "4" = 8, "5" = 10),
    selected = 2
  )
)

# produces the plot on the page
income_budget_main_panel <- mainPanel(
  plotlyOutput("income_vs_budget"),
)

# creates a tab for income and budget
income_budget_page <- tabPanel(
  "Income vs. Budget",
  p("This graph displays the average annual budget of movies compared to their
  average annual gross income between 1986 and 2016."),
  sidebarLayout(
    income_budget_side_panel,
    income_budget_main_panel
  )
)

# income and budget main takeaways for summary page
income_budget_takeaways <- "There appears to be a linear relationship between
the annual averge gross income and the annual average budget of movies. With
each year, the budget of movies has consistently increased which in turn has
lead to an increase of the gross income for thos same movies. It is highly
likely that the budget of movies as well as the incrome from them will
continue to go up in the future."