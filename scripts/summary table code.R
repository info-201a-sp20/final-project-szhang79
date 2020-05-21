library(dplyr)
library(stringr)

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

# range of score
mean_score_year <- movies %>%
  group_by(year) %>%
  summarize(mean_score = mean(score, na.rm = FALSE)) %>%
  pull(mean_score)

# company highest budget per year
company_highestbudg_year <- movies %>%
  group_by(year) %>%
  filter(budget == max(budget, na.rm = TRUE)) %>%
  mutate(companies = ifelse(
  sum(company == company, na.rm = FALSE) > 1, paste0(company[1], ", ",  
  company[2]), company)) %>%
  distinct(companies) %>%
  pull(companies)

summary_table <- data.frame(year, median_budget_year, mean_revenue_year,
                            mean_score_year, company_highestbudg_year, top_grossing_movie)


colnames(summary_table) <- c("Year", "Median Budget", "Mean Revenue",
                             "Mean Score", "Company with Highest Budget Movie", "Top Grossing Movie")
