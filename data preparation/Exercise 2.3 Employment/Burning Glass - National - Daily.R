library(dplyr)
library(lubridate)
library(tidyr)

dat = read.csv("Burning Glass - National - Weekly.csv", sep = ",")
head (dat)
dat = dat %>% mutate_if(is.character, as.numeric)

dat = dat %>%
  mutate(date = make_date(year, month, day_endofweek))

dat1 = dat[c(17, 4:9)]

dat1 = dat1 %>%
rename(manufacturing = bg_posts_ss30, financial_activities = bg_posts_ss55, professional_business = bg_posts_ss60, education_health = bg_posts_ss65, hospitality_leisure = bg_posts_ss70 )

dat1 = pivot_longer(dat1, c(manufacturing, financial_activities, professional_business, education_health, hospitality_leisure),names_to = "category", values_to = "job_postings" )

saveRDS(dat1, file = "Burning Glass - National.rds")



