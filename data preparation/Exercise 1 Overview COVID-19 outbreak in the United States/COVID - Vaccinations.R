dat1 = read.csv("owid-covid-data.csv", sep = ",")

dat1 = filter(dat1, dat1$location == "United States")

dat1 = dat1 %>%
  select(date, new_vaccinations, total_vaccinations, people_vaccinated, people_fully_vaccinated) %>%
  mutate(date = as.Date(date))

dat1 = dat1 %>%
  filter(date < "2021-06-24" & date >= "2020-01-29")


saveRDS(dat1, file = "COVID - Vaccinations.rds")



