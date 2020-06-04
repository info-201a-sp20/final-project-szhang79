library(ggplot2)
library(dplyr)
library(plotly)

data <- read.csv("data/movies.csv")

# computes a bar graph for rating's budget
budget_bar_chart <- function(rating_input, years_input, color_input) {

  #filtering the data
  budg_data <- data %>%
    select(budget, year, rating) %>%
    filter(budget != 0,
           rating %in% rating_input,
           year %in% years_input[1]:years_input[2]) %>%
    group_by(year, rating) %>%
    mutate(avg_budg = mean(budget)) %>%
    select(avg_budg, year, rating) %>%
    unique()

  # creating the bar graph
  bar_graph <- ggplot(budg_data) +
    geom_col(
      aes(
        x = year,
        y = avg_budg,
        text = paste(
          sep = "<br>",
          paste("Year:", year),
          paste0("Average Budget: $", round(avg_budg / 1000000, 2), " mil")
        )
      ),
      fill = color_input
    ) +
    facet_wrap(~rating) +
    labs(
      title = "Average Budget Per Year Grouped By Rating",
      x = "Year",
      y = "Average Budget ($)"
    ) +
    theme(
      plot.title = element_text(face = "bold", hjust = 0.5),
      axis.title.x = element_text(face = "bold"),
      axis.title.y = element_text(face = "bold"),
      axis.text.y = element_text(angle = 50, size = 5)
    )

  bar_plotly <- ggplotly(bar_graph, width = 820, height = 420, tooltip = "text")

  return(bar_plotly)
}
