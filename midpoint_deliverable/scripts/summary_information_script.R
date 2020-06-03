# Summary Information Script
movies <- read.csv("data/movies.csv", stringsAsFactors = FALSE)

get_summary_info <- function(dataset) {
  dataset_info <- list()
  dataset_info$number_of_cols <- length(dataset)
  dataset_info$colnames <- colnames(dataset)
  dataset_info$char_types <- sapply(dataset, class)
  dataset_info$number_of_rows <- nrow(dataset)
  dataset_info$ratings <- unique(dataset$rating)
  return(dataset_info)
}

get_summary_info(movies)

# Calculated variables for summary paragraph
number_of_cols <- length(movies)
number_of_rows <- nrow(movies)
column_names <- colnames(movies)
char_types <- sapply(movies, class)
movie_ratings <- unique(movies$rating)

library(lintr)
