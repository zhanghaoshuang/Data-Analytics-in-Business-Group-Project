
# Install packages
if(!require(readr)) install.packages("readr")
if(!require(tidyverse)) install.packages("tidyverse")


# Load packages
library(readr)
library(tidyverse)

# Read data and create a data frame
income_df <- read.csv('../../Data/Train.csv',
                      header = TRUE,
                      na = c('', 'NA'),
                      strip.white = TRUE) # remove the stripping of leading and trailing white space

# Change headers to lower case
names(income_df) <- tolower(names(income_df))


# Remove unused columns
cols <- c('age', 'gender', 'education', 'class',
          'race', 'employment_commitment', 
          'employment_stat', 'wage_per_hour', 
          'working_week_per_yea',
          'industry_code_main', 
          'citizenship', 'working_week_per_year',
          'income_above_limit')

df <- income_df[, which(names(income_df) %in% cols)] %>%
  filter(age >= 18) %>%
  filter(!class %in% c('Without pay', 'Never worked')) %>%
  filter(!employment_commitment %in% c('Not in labor force', 'Unemployed part- time', 'Unemployed full-time')) %>%
  na.omit()



