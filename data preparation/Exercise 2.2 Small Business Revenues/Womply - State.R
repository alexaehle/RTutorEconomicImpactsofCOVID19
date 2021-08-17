library(dplyr)
library(lubridate)
library(tidyverse)

dat = read.csv("Womply - State - Daily.csv", sep = ",")

dat = dat %>% mutate_if(is.character, as.numeric)
dat = dat %>%
  mutate(date = make_date(year, month, day))

dat = dat[c(25,4,5)]

dat=dat[dat$date >= "2020-03-25" & dat$date <= "2020-04-14",]

GeoIDs = read.csv("GeoIDs - State.csv", sep = ",")

GeoIDs = GeoIDs[c(1,2)]

GeoIDs = GeoIDs %>%
  mutate(statename = tolower(statename))

dat = left_join(dat, GeoIDs)
dat = dat[c(1, 2, 4, 3)]

saveRDS(dat, file = "Womply - State.rds")


