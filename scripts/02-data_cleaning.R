#### Preamble ####
# Purpose: Cleans the data
# Author: Shirley Chen, Jessica Im
# Date: 2 March 2024
# Contact: sshirleyy.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites:
# 00-simulate_data.R
# 01-download_data.R

#### Workspace setup ####
library(tidyverse)
library(knitr)
library(janitor)

# Open data
raw_GSS_data<-
  read_csv(
    "inputs/data/raw_GSS_data.csv",
    show_col_types = FALSE
  )

# Cleaning
cleaned_GSS_data <-
  clean_names(raw_GSS_data) |>
  drop_na(year, hlpoths, intjob, hlpsoc)

# Remove uncessary columns
cleaned_GSS_data <-
  subset(cleaned_GSS_data, select = c(year, age, sex, hlpoths, intjob, hlpsoc))

# Keep years 1989, 1998, 2006, 2016
selected_years <- c("1989", "1998", "2006", "2016")
cleaned_GSS_data <- cleaned_GSS_data |>
  filter(year %in% selected_years)

# Rename columns to better understand
cleaned_GSS_data <- cleaned_GSS_data |>
  rename(
    helping_others = hlpoths,
    interesting_work = intjob,
    social_usefulness = hlpsoc
  )

# Rename sex responses
cleaned_GSS_data <-cleaned_GSS_data |>
  mutate(sex = recode(sex,
                 '1' = 'male',
                 '2' = 'female'))

# Rename variable responses
cleaned_GSS_data_renamed <-cleaned_GSS_data |>
  mutate(
    helping_others = recode(helping_others, 
                            '1' = 'very_important',
                            '2' = 'important',
                            '3' = 'neither',
                            '4' = 'not_important',
                            '5' = 'not_important_at_all'),
    interesting_work = recode(interesting_work, 
                            '1' = 'very_important',
                            '2' = 'important',
                            '3' = 'neither',
                            '4' = 'not_important',
                            '5' = 'not_important_at_all'),
    social_usefulness = recode(social_usefulness, 
                            '1' = 'very_important',
                            '2' = 'important',
                            '3' = 'neither',
                            '4' = 'not_important',
                            '5' = 'not_important_at_all')
  )

ordered_responses <- c('very_important', 
                       'important',
                       'neutral',
                       'not_important',
                       'not_important_at_all')


#### Save data ####
write_csv(cleaned_GSS_data, "outputs/data/cleaned_GSS_data.csv")
write_csv(cleaned_GSS_data_renamed,"outputs/data/cleaned_GSS_data_renamed.csv")
