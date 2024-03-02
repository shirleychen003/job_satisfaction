#### Preamble ####
# Purpose: Simulates... [...UPDATE THIS...]
# Author: Jessica Im
# Date: 1 March 2024
# Contact: jessica.im@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? N/A


#### Workspace setup ####
library(tidyverse)
library(janitor)


#### Simulate data ####
simulated_data <-
  tibble(
    "Participant" = 1:160,
    Response = sample(
      x = c(1:5),
      size = 160,
      replace = TRUE
    ),
    # Randomly pick an option, with replacement, 160 times
    "Year" = sample(
      x = c("1989", "1998", "2006", "2016"),
      size = 160,
      replace = TRUE
    )
  )

simulated_data

#### Simulate cleaned data ####
simulated_data_clean <-
  tibble(
    "Year" = sample(
      x = c("1989", "1998", "2006", "2016"),
      size = 4,
      replace = TRUE
      ),
    "Proportion Important (%)" = sample(
      x = c(18:60),
      size = 4,
      replace = TRUE
    ),
    "Proportion Very Important (%)" = sample(
      x = c(25:80),
      size = 4,
      replace = TRUE
    ),
  )

simulated_data_clean


