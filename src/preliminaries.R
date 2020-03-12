# preliminaries.R
#   preliminary data analysis of COVID-19
# by: Noah Syrkis

# imports
library(coronavirus)
library(ggplot2)

coronavirus %>%
  group_by (
    date,
    Country.Region
           ) %>%
  filter (
    cases > 100
  ) %>%
  summarize (
    total = cumsum(cases)
  ) %>%
  ggplot (
    aes(
      x = date,
      y = total,
      color = Country.Region
    )) +
    geom_line() +
    scale_y_log10()