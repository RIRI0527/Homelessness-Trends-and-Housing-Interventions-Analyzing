#### Preamble ####
# Purpose: Simulates the Toronto shelter system flow data
# Author: Ruizi Liu
# Date: 20 September 2024
# Contact: ruizi.liu@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
library(lubridate)
library(here)

# Set seed for reproducibility
set.seed(527)

# Define population groups
population_groups <- c("All Population", "Chronic", "Refugees", "Families", "Youth")

# Generate random dates for 2 years of monthly data
dates <- seq(ymd("2020-01-01"), ymd("2021-12-01"), by = "month")

# Function to simulate numeric columns within reasonable bounds
simulate_column <- function(mean, sd, n) {
  abs(rnorm(n, mean = mean, sd = sd)) %>% round(0) # Ensure positive values
}

# Simulate date and population group
simulated_data <- expand.grid(date = dates, population_group = population_groups) %>%
  mutate(
    actively_homeless = simulate_column(7000, 1000, n()), # Mean of 7000 with some variation
    moved_to_housing = simulate_column(500, 100, n()) # Mean of 500 with some variation
  )

# View the first few rows of the simulated data
head(simulated_data)

#### Save the simulated data to CSV ####
write_csv(simulated_data, here::here("data/raw_data/simulated.csv"))

