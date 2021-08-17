library(dplyr)
library(lubridate)
library(tidyr)

dat = read.csv("Womply - National - Daily.csv", sep = ",")

dat = dat %>% mutate_if(is.character, as.numeric)
dat = dat %>%
  mutate(date = make_date(year, month, day))

dat = dat[,c(24,4, 6, 7, 5)]

datlong=pivot_longer(dat,c(revenue_inclow, revenue_incmiddle, revenue_inchigh), names_to = "income_quartile", values_to= "revenue")


saveRDS(datlong, file = "Womply - National.rds")
