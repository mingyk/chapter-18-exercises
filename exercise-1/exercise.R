# load relevant libraries
library("httr")
library("jsonlite")

# Be sure and check the README.md for complete instructions!


# Use `source()` to load your API key variable from the `apikey.R` file you made.
# Make sure you've set your working directory!
source("apikey.R")

# Create a variable `movie_name` that is the name of a movie of your choice.
movie_name <- "Joker"

# Construct an HTTP request to search for reviews for the given movie.
# The base URI is `https://api.nytimes.com/svc/movies/v2/`
# The resource is `reviews/search.json`
# See the interactive console for parameter details:
#   https://developer.nytimes.com/movie_reviews_v2.json
#
# You should use YOUR api key (as the `api-key` parameter)
# and your `movie_name` variable as the search query!
base_uri <- "https://api.nytimes.com/svc/movies/v2/"
endpoint <- "reviews/search.json"
param <- apikey
query <- c(apikey = param, query = movie_name)
url <- paste0(base_uri, endpoint)

# Send the HTTP Request to download the data
# Extract the content and convert it from JSON
list <- fromJSON(GET(url, query))

# What kind of data structure did this produce? A data frame? A list?
#List

# Manually inspect the returned data and identify the content of interest 
# (which are the movie reviews).
# Use functions such as `names()`, `str()`, etc.
names(list)
str(list)

# Flatten the movie reviews content into a data structure called `reviews`
reviews <- list$results

# From the most recent review, store the headline, short summary, and link to
# the full article, each in their own variables
headline <- reviews$headline
short_sum <- reviews$summary
link <- reviews$link

# Create a list of the three pieces of information from above. 
# Print out the list.
returnlist <- list(headline, short_sum, link)
print(returnlist)