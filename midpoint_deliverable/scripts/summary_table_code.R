library(dplyr)
library(stringr)
library(lintr)

movies <- read.csv("data/movies.csv", stringsAsFactors = FALSE)
movies[, 1][movies[, 1] == 0] <- NA
year <- unique(movies$year)

# mean budget by year
median_budget_year <- movies %>%
  group_by(year) %>%
  summarize(median_budget = median(budget, na.rm = TRUE)) %>%
  pull(median_budget)

# mean movie revenue
mean_revenue_year <- movies %>%
  group_by(year) %>%
  summarize(mean_revenue = mean(gross, na.rm = FALSE)) %>%
  pull(mean_revenue)

# top gross movie
top_grossing_movie <- movies %>%
  group_by(year) %>%
  filter(gross == max(gross, na.rm = FALSE)) %>%
  pull(name)

# Most common ratings
rating_gross_movie <- movies %>%
  group_by(year) %>%
  filter(gross == max(gross, na.rm = FALSE)) %>%
  pull(rating)

# Movie with Highest Budget
movie_highest_budg <- movies %>%
  group_by(year) %>%
  filter(budget == max(budget, na.rm = TRUE)) %>%
  mutate(movie_names = ifelse(
  sum(name == name, na.rm = FALSE) > 1, paste0(name[1], ", ", name[2]),
  name)) %>%
  distinct(movie_names) %>%
  pull(movie_names)

# Summary Table
summary_table <- data.frame(year, median_budget_year, mean_revenue_year,
                    top_grossing_movie, rating_gross_movie, movie_highest_budg)

colnames(summary_table) <- c("Year", "Median Budget", "Mean Revenue",
                          "Top Grossing Movie", "Rating of Top Grossing Movie",
                          "Movie Highest Budget")
