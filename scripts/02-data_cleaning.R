#### Preamble ####
# Purpose: Simulates the Toronto shelter system flow data
# Author: Ruizi Liu
# Date: 21 September 2024
# Contact: ruizi.liu@mail.utoronto.ca
# License: MIT
# Pre-requisites: NONE

#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Clean data ####
# Load the raw data
raw_data <- read_csv("/Users/abcdefg/Desktop/starter_folder-main/data/raw_data/raw_data.csv")

# Convert 'date.mmm.yy.' to Date format.
raw_data$date <- as.Date(paste0('01-', raw_data$`date.mmm.yy.`), format = '%d-%b-%y')

# Filter for 'All Population' and select the required columns
cleaned_data <- raw_data %>%
  select(date, actively_homeless, population_group, moved_to_housing)
cleaned_data

# View the cleaned data (optional, for verification)
head(cleaned_data)

#### Save the cleaned data ####
write_csv(cleaned_data, "/Users/abcdefg/Desktop/starter_folder-main/data/analysis_data/analysis_data.csv")

