library("ggplot2")
library("dplyr")

# Given a dataframe, the function creates a scatter plot that compares
# each year's average budget to each year's average gross income
budget_vs_income <- function(data) {
  years <- unique(data$year)

  # computes the average gross income from each year
  gross_data <- data %>%
    select(gross, year) %>%
    group_by(year) %>%
    mutate(avg_gross = mean(gross))
  gross_values <- unique(gross_data$avg_gross)

  # computes the average bugdet from each year
  budget_data <- data %>%
    select(budget, year) %>%
    group_by(year) %>%
    mutate(avg_budget = mean(budget[budget > 0]))
  budget_values <- unique(budget_data$avg_budget)

  # combines the average gross income and budgets from each year into
  # a dataframe
  all_data <- data.frame(years, gross_values, budget_values)

  # creates a scatter plot
  scatter_plot <- ggplot(data = all_data) +
    geom_point(mapping = aes(x = budget_values, y = gross_values,
                             color = years), cex = 3) +
    labs(
      title = "Average Budget vs. Gross Income from 1986 to 2016",
      x = "Budget ($)",
      y = "Gross Income ($)",
      color = "Year"
    )

  return(scatter_plot)
}

# This chart displays the relationship between the average yearly
# budget and average yearly gross incomes of movies over a thirty
# year period. The information was displayed on this type of graph,
# because it clearly depicts the linear relationship between the
# variables. Each year, the average budget for movies as well as the
# average gross income has consistently increased.