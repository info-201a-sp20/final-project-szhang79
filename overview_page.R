library(shiny)
library(knitr)
library(lintr)


overview_main <- fluidPage(
  h1("Overview"),
  p("Our project focuses on analyzing specific features of movies and how they
    have changed over time. By looking at different qualities of movies such as
    increases in budget, the ratings of movies, and general income of movies, we
    can get a better understanding of which types of movies have seen a growth
    in budget and popularity. Our dataset, called",
    a("movies,", href = "https://www.kaggle.com/danielgrijalvas/movies"), "spans
    from 1986 - 2016. It provides data such as the budget, rating, gross
    revenue, and genre of the movie. Using these characteristics, sorted by
    year, we can evaluate the trends and patterns of these movies over time, if
    any, to get a better understanding of the future of the movie industry."),
)

overview_page <- tabPanel(
  "Overview",
  overview_main
)
