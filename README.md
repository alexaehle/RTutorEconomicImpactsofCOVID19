This package constitutes an interactive R problem set based on the RTutor package (https://github.com/skranz/RTutor). 

The problem set is based on the paper The Economic Impacts of COVID-19: Evidence from a New Public Database Built Using Private Sector Data from Chetty et al.(2020).

Link to the paper: https://opportunityinsights.org/wp-content/uploads/2020/05/tracker_paper.pdf 

In this problem set, various analyses are carried out to examine the impact of the COVID-19 pandemic on the economy. 
The areas of consumer spending, small business revenues and employment are studied in more detail. 
In addition, the impact of government measures is partly investigated.

## 1. Installation

RTutor and this package is hosted on Github. To install everything, run the following code in your R console.
```s
install.packages("RTutor",repos = c("https://skranz-repo.github.io/drat/",getOption("repos")))

if (!require(devtools))
  install.packages("devtools")

devtools::install_github("alexaehle/RTutorEconomicImpactsofCOVID19")
```

## 2. Show and work on the problem set
To start the problem set first create a working directory in which files like the data sets and your solution will be stored. Then adapt and run the following code.
```s
library(RTutorEconomicImpactsofCOVID19)

# Adapt your working directory to an existing folder
setwd("C:/problemsets/RTutorEconomicImpactsofCOVID19")
# Adapt your user name
run.ps(user.name="Jon Doe", package="RTutorEconomicImpactsofCOVID19",
       auto.save.code=TRUE, clear.user=FALSE)
```
If everything works fine, a browser window should open, in which you can start exploring the problem set.
