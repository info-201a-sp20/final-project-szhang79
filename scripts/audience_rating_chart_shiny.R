library("dplyr")
library("ggplot2")

data <- read.csv("data/movies.csv")

ratings_chart <- function(years_input, ratings_input) {
  ratings_data <- data %>%
    select(rating, year) %>%
    filter(rating %in% ratings_input,
           year %in% years_input[1]:years_input[2]) %>%
    droplevels.data.frame() %>%
    group_by(year) %>%
    mutate(total_ratings = length(rating)) %>%
    group_by(year, rating) %>%
    mutate(num_ratings = length(rating)) %>%
    unique()
  
  line_graph <- ggplot(ratings_data, aes(x = year, y = total_ratings)) +
    geom_line(aes(x = year, y = num_ratings, color = rating)) +
    scale_x_continuous(n.breaks = 10) +
    scale_y_continuous(n.breaks = 10) +
    labs(
      title = paste("Audience Ratings from", years_input[1], "to", years_input[2]),
      x = "Year",
      y = "Number of movies",
      color = "Audience Rating"
    ) +
    theme(
      plot.title = element_text(face = "bold", hjust = 0.5),
      axis.title.x = element_text(face = "bold"),
      axis.title.y = element_text(face = "bold")
    )
  return(line_graph)
}
