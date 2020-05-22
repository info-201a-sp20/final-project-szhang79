# Summary Information Script
movies <- read.csv("data/movies.csv", stringsAsFactors = FALSE)

get_summary_info <- function(dataset) {
  dataset_info <- list()
  dataset_info$number_of_cols <- length(dataset)
  dataset_info$colnames <- colnames(dataset)
  dataset_info$char_types <- sapply(dataset, class)
  dataset_info$number_of_rows <- nrow(dataset)
  dataset_info$example_movies <- sample(unique(dataset$name), size = 10)
  return(dataset_info)
}

get_summary_info(movies)

number_of_cols <- length(movies)
number_of_rows <- nrow(movies)
column_names <- colnames(movies)
char_types <- sapply(movies, class)
example_movies <- sample(unique(movies$name), size = 10)




library(lintr)