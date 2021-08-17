library(dplyr)
library(lubridate)

dat=read.csv("Affinity - National - Daily.csv",sep=",")

dat = dat %>% mutate_if(is.character, as.numeric)
dat = dat %>%
  mutate(date = make_date(year, month, day))


dat = dat %>%
  select(date, spend_all, spend_all_q1, spend_all_q2, spend_all_q3, spend_all_q4, spend_aap, spend_acf, spend_aer, spend_gen, spend_grf, spend_hcs,spend_hic, spend_sgh, spend_tws )
dat = dat %>%
filter(date >="2020-01-29" &  date <= "2021-06-6")

saveRDS(dat, file = "Affinity - National.rds")


