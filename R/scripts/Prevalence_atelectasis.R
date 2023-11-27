# Prevalence atelectasis

### This is the prevalence of atelectasis for the total sample:
atelectasis_total <- data %>%
  group_by(atelectasis) %>%
  summarise(n = n()) %>%
  mutate(
    prev = n / sum(n) * 100,
    lower = lapply(n, prop.test, n = sum(n)),
    upper = sapply(lower, function(x) x$conf.int[2]) * 100,
    lower = sapply(lower, function(x) x$conf.int[1]) * 100,
    type_obesity = "Total"
  ) %>%
  mutate_at(3:5, round, 2)
atelectasis_total$confint <- paste(
  atelectasis_total$lower, "-", atelectasis_total$upper
)
atelectasis_total <- atelectasis_total %>% select(-c(lower, upper))

### This is the prevalence of atelectasis by obesity class:
atelectasis_obesity <- data %>%
  group_by(type_obesity, atelectasis) %>%
  summarise(n = n()) %>%
  mutate(
    prev = n / sum(n) * 100,
    lower = lapply(n, prop.test, n = sum(n)),
    upper = sapply(lower, function(x) x$conf.int[2]) * 100,
    lower = sapply(lower, function(x) x$conf.int[1]) * 100
  ) %>%
  mutate_at(4:6, round, 2)
atelectasis_obesity$confint <- paste(
  atelectasis_obesity$lower, "-", atelectasis_obesity$upper
)
atelectasis_obesity <- atelectasis_obesity %>% select(-c(lower, upper))

### This is just to combine the two prior tables:
atelectasis <- atelectasis_total %>%
  bind_rows(atelectasis_obesity) %>%
  relocate(type_obesity, .before = n)

atelectasis

# Location of atelectasis (Unilateral/Bilateral)

### This is the location of atelectasis for the total sample:
atelectasis_total_location <- data %>%
  filter(atelectasis == "Yes") %>%
  group_by(atelectasis_location) %>%
  summarise(Freq = n()) %>%
  mutate(
    Percentage = (round((Freq / sum(Freq) * 100), digits = 2)),
    type_obesity = "Total"
  )
atelectasis_total_location$sumpercent <- paste0(
  atelectasis_total_location$Freq,
  " (", atelectasis_total_location$Percentage, "%)"
)
atelectasis_total_location <- atelectasis_total_location %>%
  select(-c(Freq, Percentage)) %>%
  pivot_wider(names_from = atelectasis_location, values_from = sumpercent)

### This is the location by obesity class:
atelectasis_obesity_location <- data %>%
  filter(atelectasis == "Yes") %>%
  group_by(type_obesity, atelectasis_location) %>%
  summarise(Freq = n()) %>%
  mutate(Percentage = (round((Freq / sum(Freq) * 100), digits = 2)))
atelectasis_obesity_location$sumpercent <- paste0(
  atelectasis_obesity_location$Freq, " (",
  atelectasis_obesity_location$Percentage, "%)"
)
atelectasis_obesity_location <- atelectasis_obesity_location %>%
  select(-c(Freq, Percentage)) %>%
  pivot_wider(names_from = atelectasis_location, values_from = sumpercent)

### This is to bind both of the location results in a single table
location <- atelectasis_total_location %>%
  bind_rows(atelectasis_obesity_location)

location

# This is to bind the results of the prevalence with 95% CI with the location
# I only did this in case I wanted to write a table later.
atelectasis <- atelectasis %>%
  right_join(location, by = "type_obesity") %>%
  mutate(
    confint = replace(confint, atelectasis == "No", NA),
    Unilateral = replace(Unilateral, atelectasis == "No", NA),
    Bilateral = replace(Bilateral, atelectasis == "No", NA)
  )
