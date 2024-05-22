# Install packages
if(!require(tidyverse)) install.packages("tidyverse")

# Load packages
library(tidyverse)

# Read data from process_data.R
source("process_data.R")

# Change all non-numeric data into numeric data
cleaned_df <- df %>%
  mutate(income_above_limit = case_when(
    income_above_limit == 'Below limit' ~ 0,
    TRUE ~ 1)) %>%
  mutate(gender = case_when(
    gender == 'Female' ~ 0,
    gender == 'Male' ~ 1)) %>%
  mutate(education = case_when(
    education == 'High school graduate' ~ 12,
    education == 'Some college but no degree' ~ 13,
    education %in% c('Associates degree-occup /vocationa', 'Associates degree-academic program') ~ 14,
    education == 'Bachelors degree(BA AB BS)' ~ 16,
    education == 'Masters degree(MA MS MEng MEd MSW MBA' ~ 18,
    education %in% c('Doctorate degree(PhD EdD)', 'Prof school degree (MD DDS DVM LLB JD)') ~ 20,
    TRUE ~ 11)) %>%
  mutate(class = case_when(
    class == "Federal government" ~ 0,
    class == "Private" ~ 1,
    class == "Local government" ~ 2,
    class == "Self-employed-incorporated" ~ 3,
    class == "Self-employed-not incorporated" ~ 4,
    TRUE ~ 5)) %>%
  mutate(race = case_when(
    race == "Black" ~ 1,
    race == "Asian or Pacific Islander" ~ 2,
    race == "White" ~ 3,
    race == "Amer Indian Aleut or Eskimo" ~ 4,
    race == "Other" ~ 0)) %>%
  mutate(employment_commitment = case_when(
    employment_commitment == 'Children or Armed Force' ~ 1,
    employment_commitment == 'Full-time schedules' ~ 2,
    TRUE ~ 0)) %>%
  mutate(citizenship = case_when(
    citizenship == 'Foreign born- Not a citizen of U S' ~ 0,
    TRUE ~ 1))

industry_list <- unique(cleaned_df$industry_code_main)
cleaned_df$industry <- match(cleaned_df$industry_code_main, industry_list)

# remove industry_code_main
cleaned_df <- cleaned_df %>%
  select(-industry_code_main) %>%
  select(income_above_limit, everything()) %>%
  mutate(income_above_limit = as.factor(income_above_limit))

### Create 3 separate datasets

# dataset1 contains 0 values of wage_per_hour
dataset1 <- cleaned_df

# dataset2: replace 0 values in wage_per_hour with the average of wage_per_hour for each gender

# Calculate the average wage_per_hour of male and female
avg_wage <- cleaned_df %>%
  group_by(gender) %>%
  summarise(avg_wage_per_hour = mean(wage_per_hour))
'
  gender wage_per_hour
   <dbl>         <dbl>
1      0          115.
2      1          118.
'
# Replace the zero values in wage_per_hour with the average wage_per_hour for each gender
dataset2 <- cleaned_df %>%  
  left_join(avg_wage, by = 'gender') %>%
  mutate(wage_per_hour = ifelse(wage_per_hour == 0, avg_wage_per_hour, wage_per_hour)) %>%
  select(-avg_wage_per_hour)

# dataset3: replace 0 values in wage_per_hour with the average of wage_per_hour, grouped by income_above_limit and gender

# calculate the average wage_per_hour
avg_wage2 <- cleaned_df %>% 
  group_by(income_above_limit, gender) %>%
  summarise_at(vars(wage_per_hour), list(avg_wage_per_hour = mean), na.rm = TRUE)
'
  income_above_limit gender wage_per_hour
               <dbl>  <dbl>         <dbl>
1                  0      0         116. 
2                  0      1         126. 
3                  1      0          91.8
4                  1      1          86.9
'
dataset3 <- cleaned_df %>%  
  left_join(avg_wage2, by = c('income_above_limit', 'gender')) %>%
  mutate(wage_per_hour = ifelse(wage_per_hour == 0, avg_wage_per_hour, wage_per_hour)) %>%
  select(-avg_wage_per_hour)
