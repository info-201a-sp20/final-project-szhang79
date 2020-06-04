source("audience_rating_page.R")
source("income_budget_page.R")
source("rating_budget_page.R")

summary_main <- fluidPage(
  h1("Takeaways from Movies Dataset"),
  h3("Audience Ratings:"),
  p(audience_rating_summary),
  h3("Income vs Budget:"),
  p(income_budget_takeaways),
  h3("Rating's Budget:"),
  p(rating_budget_summary)
)

summary_page <- tabPanel(
  "Summary Takeaway",
  summary_main
)
