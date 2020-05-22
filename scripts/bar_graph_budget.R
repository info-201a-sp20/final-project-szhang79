library("ggplot2")
library("dplyr")

# This is a function that returns 4 bar graphs using the given dataframe
# and compares the average budget to the year, grouped by rating.
budget_bar_graph <- function(data) {
  budg_data <- data %>%
    select(budget, year, rating) %>%
    filter(budget != 0,
           rating == "G" | rating == "PG" |
             rating == "PG-13" | rating == "R") %>%
    group_by(year, rating) %>%
    mutate(avg_budg = mean(budget)) %>%
    select(avg_budg, year, rating) %>%
    unique()

  bar_graph <- ggplot(budg_data) +
    geom_col(aes(x = year, y = avg_budg)) +
    facet_wrap(~rating) +
    labs(
      title = "Average Budget Per Year Grouped By Rating",
      x = "Year (1986-2016)",
      y = "Average Budget ($)"
    )

  return(bar_graph)
}

# The four charts compares the relationship of how the budget
# of each type of rating category changes throughout the span of 30
# years. Using a bar graph, wrapped into separate rating categories,
# we are able to see that, besides the rated R category, all the
# categories increase the budget of the movies throughout the years.
# We are also able to see that the rated G movie productions have a trend
# of acquiring a higher budget compared to the other rating categories.