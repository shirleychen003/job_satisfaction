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
library(ggplot2)
library(dplyr)


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

simulated_data_clean


#### Graph Simulated Data ####
simulated_data_clean |>
  ggplot(mapping = aes(x = Year, y = Very_Important)) +
  geom_line(color="grey") +
  geom_point(shape=21, color="black", fill="#69b3a2", size=2) +
  theme_minimal() +
  labs(x = "Year", y = "Proportion Important (%)", caption = "Data source: World Bank.")
