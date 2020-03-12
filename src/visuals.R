# visuals.R
#   playing around with data camp tutorial
# by: Noah Syrkis

# import statements
library(ggplot2)

# declarations
china <- coronavirus %>%
  filter(Country.Region == "Mainland China",
         type == "confirmed",
         cases > 50)


# plotting
ggplot(china,
       aes(x = date,
           y = cases,
           color = Province.State,
           size = cases)) +
  geom_point() +
  scale_y_log10() +
  facet_wrap(~ Province.State)

# summaries
china %>%
  summarize(
    total = sum(cases)
  )

# grouping
coronavirus %>%
  filter(
    type == 'confirmed',
    cases > 30,
    Country.Region != 'Mainland China'
  ) %>%
  group_by(Country.Region) %>%
  summarize(
    total = sum(cases)
  ) %>%
  arrange(desc(total))

# visuals
confirmed_by_country <-  coronavirus %>%
  group_by(date, Country.Region) %>%
  filter(
    type == 'confirmed',
    cases > 100,
    Country.Region != 'Mainland China'
  ) %>%
  summarize(
    total = sum(cases)
  ) %>%
  arrange(total)

ggplot(confirmed_by_country,
       aes(x = date,
           y = total,
           color = Country.Region,
           size = total)) +
  geom_point()
