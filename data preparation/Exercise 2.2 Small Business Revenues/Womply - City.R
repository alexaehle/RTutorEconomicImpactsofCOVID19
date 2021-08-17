library(dplyr)
library(lubridate)

dat = read.csv("Womply - City - Daily.csv", sep = ",")

dat = dat %>% mutate_if(is.character, as.numeric)
dat = dat %>%
  mutate(date = make_date(year, month, day))


dat = dat[c(15,4,5)]

saveRDS(dat, file = "Womply - City.rds")
