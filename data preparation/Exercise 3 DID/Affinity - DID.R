library(tidyverse)

dat = readRDS("Affinity - National - Daily.rds")

dat = dat %>%
  select(1,3,6)

dat = filter(dat, date >= "2020-04-01" & date <= "2020-04-30" )
datlong = pivot_longer(dat, c(2,3), names_to = "income_quartile", values_to = "spend")

datlong = datlong %>%
  mutate(period = ifelse(date<"2020-04-15", "pre", "post"))

datlong = datlong %>%
  group_by(income_quartile, period) %>%
  mutate( mean = mean(spend))

saveRDS(datlong, "Affinity - DID.rds" )
