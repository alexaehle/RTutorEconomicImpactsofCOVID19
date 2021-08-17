
dat = read.csv("GeoIDs - City.csv", sep = ",")

dat = dat[,c(1,2,4)]

saveRDS(dat, file = "GeoIDs - City.rds")