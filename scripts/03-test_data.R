#### Preamble ####
# Purpose: Testing 02-data_cleaning.R
# Author: Jessica Im
# Date: 11 March 2024
# Contact: jessica.im@mail.utoronto.ca
# License: MIT
# Pre-requisites: Download 02-data_cleaning.R
# Any other information needed? N/A


#### Workspace setup ####
library(tidyverse)


#### Test data ####
clean_GSS_data<-
  read_csv(
    "outputs/data/cleaned_GSS_data.csv",
    show_col_types = FALSE
  )


# Check for missing values in responses to question "helping_others"
# Code references from: https://github.com/shirleychen003/gender-wage-gap/blob/main/scripts/03-test_data.R
missing_values <- sum(is.na(clean_GSS_data$helping_others))
cat("Missing values in question_response:", missing_values, "\n")


# Check that responses range from 'very important' to 'not important at all'
# Code referenced from: https://github.com/InessaDeAngelis/Perceptions_of_Women_in_Politics/blob/main/scripts/03-test_data.R
class(clean_GSS_data$helping_others) == "character"
sum(!(unique(clean_GSS_data$helping_others) %in%
        c("very_important",
        "important",
        "neither",
        "not_important",
        "not_important_at_all",
          NA))) == 0

class(clean_GSS_data$interesting_work) == "character"
sum(!(unique(clean_GSS_data$interesting_work) %in%
        c("very_important",
          "important",
          "neither",
          "not_important",
          "not_important_at_all",
          NA))) == 0

class(clean_GSS_data$social_usefulness) == "character"
sum(!(unique(clean_GSS_data$social_usefulness) %in%
        c("very_important",
          "important",
          "neither",
          "not_important",
          "not_important_at_all",
          NA))) == 0


# Check that years are '1989', '1998', '2006', and '2016'
class(clean_GSS_data$year) == "character"
sum(!(unique(clean_GSS_data$year) %in%
        c("1989",
          "1998",
          "2006",
          "2016",
          NA))) == 0
