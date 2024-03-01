#### Preamble ####
# Purpose: Downloads and saves the data from the US General Social Survey
# Author: Shirley Chen, Jessica Im
# Date: 29 February, 2024
# Contact: sshirleyy.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(haven)

#### Acquire data ####
converted_gss_data <- read_dta("inputs/data/GSS7218_R1.dta")

#### Save data as CSV file ####
write_csv(converted_gss_data, "inputs/data/raw_GSS_data.csv")