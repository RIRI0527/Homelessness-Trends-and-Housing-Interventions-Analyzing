#### Preamble ####
# Purpose: Simulates the Toronto shelter system flow data
# Author: Ruizi Liu
# Date: 21 September 2024
# Contact: ruizi.liu@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? Run the files "00-simulate_data.R" and "02-data_cleaning.R".


#### Workspace setup ####
library(tidyverse)

#### Test for simulate data ####
simulated_data <- read_csv("data/raw_data/simulated.csv")
#### Test 1: No negative values in 'actively_homeless' and 'moved_to_housing' columns ####
if (any(simulated_data$actively_homeless < 0)) {
  stop("Test 1 failed: Negative values found in 'actively_homeless' column")
}

if (any(simulated_data$moved_to_housing < 0)) {
  stop("Test 1 failed: Negative values found in 'moved_to_housing' column")
}

#### Test 2: Check for missing values in key columns ####
key_columns <- c("date", "actively_homeless", "population_group", "moved_to_housing")
if (any(is.na(simulated_data[key_columns]))) {
  stop("Test 2 failed: Missing values found in key columns")
}

#### Test 3: Ensure 'date' column is in proper Date format ####
# Convert 'date' column to Date type and check for invalid entries
simulated_data <- simulated_data %>%
  mutate(date = as.Date(date, format = "%Y-%m-%d"))

if (any(is.na(simulated_data$date))) {
  stop("Test 3 failed: Invalid dates or incorrect format found in 'date' column")
}

#### Test 4: Ensure 'population_group' contains only expected categories ####
expected_groups <- c("All Population", "Chronic", "Refugees", "Non-refugees", "Families", "Youth", "Indigenous", "Single Adult")
if (!all(simulated_data$population_group %in% expected_groups)) {
  stop("Test 4 failed: Unexpected values found in 'population_group' column")
}

#### If all tests pass ####
cat("All tests passed successfully!\n")

#### Test for cleaned data ####
cleaned_data <- read_csv("data/analysis_data/analysis_data.csv")

#### Test 1: No negative values in 'actively_homeless' and 'moved_to_housing' columns ####
if (any(cleaned_data$actively_homeless < 0)) {
  stop("Test 1 failed: Negative values found in 'actively_homeless' column")
}

if (any(cleaned_data$moved_to_housing < 0)) {
  stop("Test 1 failed: Negative values found in 'moved_to_housing' column")
}

#### Test 2: Check for missing values in key columns ####
key_columns <- c("date", "actively_homeless", "population_group", "moved_to_housing")
if (any(is.na(cleaned_data[key_columns]))) {
  stop("Test 2 failed: Missing values found in key columns")
}

#### Test 3: Ensure 'date' column is in proper Date format ####
# Convert 'date' column to Date type and check for invalid entries
cleaned_data <- cleaned_data %>%
  mutate(date = as.Date(date, format = "%Y-%m-%d"))

if (any(is.na(cleaned_data$date))) {
  stop("Test 3 failed: Invalid dates or incorrect format found in 'date' column")
}

#### Test 4: Ensure 'population_group' contains only expected categories ####
expected_groups <- c("All Population", "Chronic", "Refugees", "Non-refugees", "Families", "Youth", "Indigenous", "Single Adult")
if (!all(cleaned_data$population_group %in% expected_groups)) {
  stop("Test 4 failed: Unexpected values found in 'population_group' column")
}

#### If all tests pass ####
cat("All tests passed successfully!\n")

