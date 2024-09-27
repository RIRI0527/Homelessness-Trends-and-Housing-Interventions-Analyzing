#### Preamble ####
# Purpose: Simulates the Toronto shelter system flow data
# Author: Ruizi Liu
# Date: 21 September 2024
# Contact: ruizi.liu@mail.utoronto.ca
# License: MIT
# Pre-requisites: None


#### Loading the needed packages ####
library(opendatatoronto)
library(tidyverse)

#### Checking the working directory to ensure the write_csv works properly ####
getwd()

#### Downloading the data ####
data <- search_packages("toronto-shelter-system-flow")
data

data <- data %>%
  list_package_resources()
data

data <- data[2,] %>%
  get_resource()
data
 
#### Write the data ####
write_csv(data, "data/raw_data/raw_data.csv")


         
