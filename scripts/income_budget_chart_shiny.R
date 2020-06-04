library("ggplot2")
library("dplyr")
library("plotly")

# Given a dataframe, the function creates a scatter plot that compares
# each year's average budget to each year's average gross income
budget_vs_income <- function(data, years_input, size_input) {
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
  all_data <- filter(all_data, years %in% years_input[1]:years_input[2])
  
  # creates a scatter plot
  scatter_plot <- ggplot(data = all_data) +
    geom_point(mapping = aes(x = budget_values,
                                    y = gross_values,
                                    color = years,
                                    text = paste(
                                      sep = "<br>",
                                      paste("Year:", years),
                                      paste0("Average Budget: $", round(budget_values / 1000000, 2), " mil"),
                                      paste0("Average Gross Income: $", round(gross_values / 1000000, 2), " mil")
                                    )
                                    ),
               cex = as.numeric(size_input)) +
    labs(
      title = "Average Budget vs. Gross Income from 1986 to 2016",
      x = "Budget ($)",
      y = "Gross Income ($)",
      color = "Year"
    ) +
    theme(
      plot.title = element_text(face = "bold", hjust = 0.5),
      axis.title.x = element_text(face = "bold"),
      axis.title.y = element_text(face = "bold")
    )
  
  scatter_plotly <- ggplotly(scatter_plot, width = 820, height = 420, tooltip = "text") %>%
    layout(legend = list(
      x = 100,
      y = 0.5,
      title = list(text = "<b>Income and Budget</b>")
    ))
  
  return(scatter_plotly)
}