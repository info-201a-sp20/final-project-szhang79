# adds the sources to R files with each interactive page scripts
source("audience_rating_page.R")

ui <- navbarPage(
  "Movie Data",
  audience_rating_page
)
