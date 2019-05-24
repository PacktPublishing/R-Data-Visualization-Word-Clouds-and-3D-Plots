
install.packages("googleVis")

library(googleVis)

data1 = read.csv("final.csv", sep =",", header = TRUE)


chart<- gvisMotionChart(data1, idvar="Country",
                        timevar="Years", xvar = "fert",yvar = "life")

plot(chart)

###############################################


install.packages("devtools")
library(devtools)

install_github('slidify','ramnathv')
install_github('slidifyLibraries','ramnathv', force= TRUE)

library(slidify)
library(slidifyLibraries)

author("plot")

#############################################

install.packages("jsonlite")

install.packages("lubridate")

library(jsonlite)

library(lubridate)

url = "https://api.stlouisfed.org/fred/series/observations?series_id=CPIAUCSL&api_key=40e074a31e766b926f75bb34954e4fa6&file_type=json"

data = readLines(url)

data.value = fromJSON(data)

data.final = data.frame(data.value$observations)

dates = ymd(data.final$date)

plot(dates,data.final$value, type="l", xlab = "Time", ylab = "CPI", main ="CPI")

#########################################

install.packages("shiny")

library(shiny)

library(ISLR)

runApp("shiny")










