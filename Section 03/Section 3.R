

install.packages("quantmod")

suppressWarnings(library(quantmod))

prices = c("MSFT","FB")

getSymbols(prices)

head(MSFT)

head(FB)

chartSeries(MSFT, name = "Microsoft", minor.ticks = FALSE,
            theme = chartTheme("white"))



chartSeries(MSFT, type = c("line"),name = "Microsoft", minor.ticks =FALSE,
            theme = chartTheme("white"))

chartSeries(MSFT, type = c("line"),name = "Microsoft", minor.ticks =FALSE,
            theme = chartTheme("white"), line.type = "h")

chartSeries(MSFT, type = c("line"),name = "Microsoft", minor.ticks =FALSE,
            theme = chartTheme("white"), TA= c("addEMA()"))

chartSeries(MSFT, type = c("line"),name = "Microsoft", minor.ticks =FALSE,
            theme = chartTheme("white"), TA= c("addBBands()"))
##########################################################################








install.packages(c("quantmod","googleVis"))


library(quantmod)
library(googleVis)

prices = c("MSFT")
getSymbols(prices)

msft =data.frame(date = as.Date(index(MSFT)),
                 open =as.numeric(MSFT$MSFT.Open),
                 close = as.numeric(MSFT$MSFT.Close),
                 high = as.numeric(MSFT$MSFT.High),
                 low =as.numeric(MSFT$MSFT.Low))

msft_n = msft[1:20,]

mplot = gvisCandlestickChart(msft_n,xvar = "date", low = "low",
                             open = "open", close = "close",
                             high = "high",options = list
                             (legend = 'none', width = 900,
                             title = "Microsoft stock Price"))
plot(mplot)

###################################################################################


data = read.csv("fredgraph.csv")

datats = ts(data[,2], frequency = 4,start= c(1962,1))

?ts

d = decompose(datats)


plot(d)

d = decompose (datats, type = "multiplicative")

plot(d)

trend = d$trend # extracts the trend component
seasonal = d$seasonal # extracts the seasonal component
resid = d$random # extracts the residual

par(mfrow = c(2,2))
plot(datats) #plots the original series
plot(seasonal) # plots the seasonal component
plot(trend)# plots the trend component
plot(resid) # plots the residual

m = na.omit(resid) # removes the na from series
acf(m) # generates a correlogram

install.packages(c("forecast","fanplot"))

library(forecast)
library(fanplot)

fit = auto.arima(datats)

summary(fit)

fore = matrix(NA, nrow=20, ncol=5)

for(i in 1:20){
  fore[i,] <- simulate(fit, nsim=5)
}

plot(datats, xlim= c(1962,2020),main = "10 yr Tsy Constant
    Maturity Rate (%)", ylab = "10 yr rate(%)", xlab = "Time")

fan(fore, type = "interval", start = c(2014,3), anchor = 2.28)

########################################################################



install.packages("ISLR")

library(ISLR)

reg = lm(mpg~horsepower, data = Auto)

#reg = lm(Auto$mpg~Auto$horsepower+Auto$Weight, data = Auto). 

summary(reg)

coef(reg)

plot(Auto$horsepower,Auto$mpg, pch = 20, col = "red",
     xlab ="Horsepower",ylab= "mpg", main = "A simple Linear Regression")

abline(reg, lwd = 2, col = "blue")

pr = data.frame(horsepower= c(30,34,45))
predict(reg, pr)

?predict

?glm
##############################################################



install.packages("ISLR")

library("ISLR")


summary(Wage)

par(mar = c(6,4,3,6))

boxplot(Wage$wage ~Wage$education, col =
          c("red","green","blue","yellow","white"),
        xlab = "Education",
        ylab = "Wage",
        main ="Relationship between Wage and Level of Education",
        las = TRUE,
        names = c("<HS Grad","HS Grad","Som coll","Coll Grad","ADV degree"))


?boxplot

#################################################################################


install.packages(c("ISLR","vioplot"))

library(ISLR)
library(vioplot)

vioplot(Hitters$AtBat,Hitters$Hits,Hitters$HmRun, horizontal =TRUE, 
        col =c("green"), names = c("At Bat"," Hits", "Home runs"))

###################################################################

install.packages("quantmod")
library(quantmod)

prices = c("MSFT")
getSymbols(prices)

msft = dailyReturn(MSFT)

msft = data.matrix(msft)

shapiro.test(msft)

fake = rnorm(1000,0,1)
shapiro.test(msft)

par(mfrow = c(1,2))

qqnorm(msft, pch = 18, main = "MSFT")

qqline(msft, col = "red", lwd = 3)

qqnorm(fake, pch = 18, main = "fake")
qqline(fake, col = "blue", lwd = 3)
###################################################


install.packages("quantmod")

library(quantmod)

prices = c("MSFT")
getSymbols(prices)

msft_m = monthlyReturn(MSFT)

msft_d = density(msft_m)

hist(msft_m, freq = FALSE, col = "skyblue", xlab = "Returns (Monthly)")

lines(msft_d,col= "blue", lwd = 2)

prices = c("FB","MSFT","AAPL","GOOG")
getSymbols(prices)

msft_d = dailyReturn(MSFT)
aapl_d = dailyReturn(AAPL)
googl_d = dailyReturn(GOOG)
fb_d = dailyReturn(FB)

par(mfrow = c(2,4))

hist(msft_d, main = "Microsoft daily Returns")
hist(aapl_d, main = "Apple daily Returns")
hist(fb_d, main = "Facebook daily Returns")
hist(googl_d, main = "Google daily Returns")
##########################################################

install.packages(c("corrplot","quantmod"))

library(corrplot)
library(quantmod)

rates=c("USD/EUR","USD/GBP","USD/CHF","USD/JPY","USD/CAD","USD/AUD","USD/IDR")

getSymbols(rates,src="oanda", return.class = 'data.frame')

fxdata = cbind(USDAUD,USDCAD,USDCHF,USDEUR,USDGBP,USDIDR,USDJPY)

fxcor = cor(fxdata)

fxcor

par(mfrow=c(2,2))
corrplot(fxcor, method = c("ellipse"))
corrplot(fxcor, method = c("number"))
corrplot(fxcor, method = c("square"))
corrplot(fxcor, method = c("square"), type = "lower")

corrplot(fxcor, method = c("number"),order="hclust",
         addrect = 4, rect.col = "blue")

