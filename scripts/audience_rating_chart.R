library("dplyr")
library("ggplot2")

# function that creates a line graph that compares the number of each
# type of audience rating over time (30 years) given a dataframe
ratings_chart <- function(data) {
  # selects the rating and year data, then calculates the total number
  # of movies for each year and the total number of each rating
  # (G, PG, PG-13, R) for each year
  ratings_data <- data %>%
    select(rating, year) %>%
    filter(rating %in% c("G", "PG", "PG-13", "R")) %>%
    droplevels.data.frame() %>%
    group_by(year) %>%
    mutate(total_ratings = length(rating)) %>%
    group_by(year, rating) %>%
    mutate(num_ratings = length(rating)) %>%
    unique()

  # makes a line graph with a line for each rating over 30 years
  line_graph <- ggplot(ratings_data, aes(x = year, y = total_ratings)) +
    geom_line(aes(x = year, y = num_ratings, color = rating)) +
    scale_x_continuous(n.breaks = 10) +
    scale_y_continuous(n.breaks = 10) +
    labs(
      title = "Audience Ratings Over 3 Decades",
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
