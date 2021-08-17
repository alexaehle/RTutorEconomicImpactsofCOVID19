library(dplyr)
library(lubridate)

dat = read.csv("COVID - National - Daily.csv",sep=",")

dat = dat %>% mutate_if(is.character, as.numeric)
dat = dat %>%
  mutate(date = make_date(year, month, day))

dat = dat %>%
  select(date, case_count, death_count, test_count, new_case_count, new_death_count, new_test_count)

dat = dat %>%
  filter(date < "2021-06-24" & date >= "2020-01-29")

saveRDS(dat, file = "COVID - National.rds")

