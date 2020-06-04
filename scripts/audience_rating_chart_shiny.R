library("dplyr")
library("ggplot2")
library("plotly")

data <- read.csv("data/movies.csv")

ratings_chart <- function(years_input, ratings_input) {
  # sort for rating and year data and counts total movie ratings and
  # total of each rating per year
  ratings_data <- data %>%
    select(rating, year) %>%
    filter(
      rating %in% ratings_input,
      year %in% years_input[1]:years_input[2]
    ) %>%
    droplevels.data.frame() %>%
    group_by(year) %>%
    mutate(total_ratings = length(rating)) %>%
    group_by(year, rating) %>%
    mutate(num_ratings = length(rating)) %>%
    unique()
  # makes a line graph from year and rating input
  line_graph <- ggplot(ratings_data, aes(x = year, y = total_ratings)) +
    geom_line(aes(
      x = year,
      y = num_ratings,
      color = rating,
    )) +
    geom_point(aes(
      x = year,
      y = num_ratings,
      color = rating,
      text = paste(
        sep = "<br>",
        paste("Year:", year),
        paste("Movies:", num_ratings),
        paste("Rating:", rating)
      )
    )) +
    scale_x_continuous(n.breaks = 10) +
    scale_y_continuous(n.breaks = 10) +
    labs(
      title = paste("Audience Ratings from",
                    years_input[1],
                    "to",
                    years_input[2]),
      x = "Year",
      y = "Number of movies",
      color = "Audience Rating"
    ) +
    theme(
      plot.title = element_text(face = "bold", size = 15, hjust = 0.5),
      axis.title.x = element_text(face = "bold", size = 10),
      axis.title.y = element_text(face = "bold", size = 10),
      legend.title = element_blank()
    )

  # makes ggplot into interactive plotly graph with hover information
  line_graph_plotly <- ggplotly(line_graph,
                                width = 820,
                                height = 420,
                                tooltip = "text") %>%
    layout(legend = list(
      x = 100,
      y = 0.5,
      title = list(text = "<b> Audience Rating</b>")
    ))

  return(line_graph_plotly)
}
