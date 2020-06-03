# adds the sources to R files with each interactive page scripts
source("audience_rating_page.R")
source("income_budget_page.R")
source("rating_budget_page.R")
source("overview_page.R")

ui <- navbarPage(
  "Movie Data",
  overview_page,
  audience_rating_page,
  income_budget_page,
  rating_page
)
