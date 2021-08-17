library(dplyr)
library(lubridate)
library(tidyr)

dat = read.csv("Employment - National - Daily.csv", sep = ",")
head (dat)
dat = dat %>% mutate_if(is.character, as.numeric)

dat = dat %>%
  mutate(date = make_date(year, month, day))

dat1 = dat %>%
  select(date, emp, emp_incq1, emp_incmiddle, emp_incq4)
dat1 = dat1 %>%
  rename(emp_inclow = emp_incq1, emp_inchigh = emp_incq4)

dat1 = pivot_longer(dat1, c(emp_inchigh, emp_incmiddle, emp_inclow), names_to = "income_quartile", values_to = "employment")
dat2 = dat %>%
  select(date, emp_ss40, emp_ss60, emp_ss65, emp_ss70)
dat2 = dat2 %>%
  rename(trade_transportation_utilities = emp_ss40, professional_business = emp_ss60, education_health = emp_ss65, leisure_hospitality = emp_ss70 )
dat2 = pivot_longer(dat2, c(trade_transportation_utilities, professional_business, education_health, leisure_hospitality), names_to = "category", values_to = "employment")


  

saveRDS(dat1, file = "Employment - Income.rds")
saveRDS(dat2, file = "Employment - Categories.rds")


