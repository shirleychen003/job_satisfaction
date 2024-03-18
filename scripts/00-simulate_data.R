#### Preamble ####
# Purpose: Simulates the change in rating of importance from 1998 to 2016
# Author: Jessica Im
# Date: 1 March 2024
# Contact: jessica.im@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? N/A


#### Workspace setup ####
library(tidyverse)
library(janitor)
set.seed(250)

# 160 selected to represent total participants and years selected based on GSS data
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

# Clean the previously simulated data by creating a number of responses for "Important" and "Very Important"
#### Simulate cleaned data ####
simulated_data_clean <-
  tibble(
    "Year" = sample(
      x = c(1989, 1998, 2006, 2016),
      size = 4,
      replace = FALSE
      ),
    Important = sample(
      x = c(18:60),
      size = 4,
      replace = TRUE
    ),
    Very_Important = sample(
      x = c(25:80),
      size = 4,
      replace = TRUE
    ),
  )

# Pivot and graph simulated data to create a connected dot graph
#### Graph simulated data ####
# Pivot simulated data
simulated_data_pivot <-
  simulated_data_clean |>
  pivot_longer(
    cols = c("Important", "Very_Important"),
    names_to = "Response_Type",
    values_to = "Response_Proportion"
  )

# Graph data
simulated_data_pivot |>
  ggplot(mapping = aes(x = Year, y = Response_Proportion, fill = Response_Type)) +
  geom_line(color="grey") +
  geom_point(shape=21, color="black", fill="#69b3a2", size=2) +
  theme_minimal() +
  labs(x = "Year", y = "Proportion Important (%)", caption = "Data source: World Bank.")



