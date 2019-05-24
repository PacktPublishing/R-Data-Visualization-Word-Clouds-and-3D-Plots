
?sunflowerplot

install.packages("HistData")
library(HistData)

head(Galton)

View(head(Galton,8))

sunflowerplot(Galton$parent,Galton$child,col = "blue",
              seg.col = "red", xlab = "Parent", ylab ="Child")
##############################################################

install.packages("hexbin")
library(hexbin)

set.seed(356)

x = rnorm(1000)
y = rnorm(1000)

?distributions

bins = hexbin(x,y)

plot(bins)
plot(bins , border = TRUE)

plot(bins, border = "red")

smb = smooth.hexbin(bins)
plot(smb)



install.packages(c("quantmod","googleVis"))

library(quantmod)
library(googleVis)

prices = c("FB")

getSymbols(prices, src = "yahoo", from =as.Date ("2013-01-01"),
           to = as.Date("2013-12-31"))

data =data.frame(date = as.Date(index(FB)),
                 open = as.numeric(FB$FB.Open))

fb <- gvisCalendar(data, datevar="date",
                   numvar="open",
                   options=list(title="Daily Prices of Facebook stock",
                                height=320,width = 1000, calendar="{yearLabel:
                                {color: '#FF0000'},
                                cellSize: 14,cellColor :{strokeWidth: 0.5},
                                monthOutlineColor:{stroke:'white',strokeWidth: 5}}"))

plot(fb)
###########################################

install.packages("aplpack")
library(aplpack)

data1 = read.csv("worldecon.csv", header = TRUE, sep =",")

head(data1)

faces(data1[1:10,3:9], labels = data1$Code, 
      main = "A comparative view using Chernoff faces")

#######################################################################

install.packages(c("HistData","plotrix"))

library(HistData)
library(plotrix)

data = Nightingale[13:24,]

month = c("Apr 1855","May","Jun","Jul","Aug","Sep","Oct",
          "Nov","Dec","Jan 1856", "Feb","Mar")

radial.pie(data$Disease,labels=month, boxed.radial =
             FALSE,show.grid = TRUE,sector.colors =c(rep("#60B1FF",12)),
           grid.col= "white",mar=c(2,10,2,10),show.grid.labels = 0,
           axis = FALSE, label.prop= .9)

###########################################################################


install.packages("igraph")

library(igraph)

net = read.csv("network.csv", sep = ",", header = TRUE)

g = graph.data.frame(net)

plot(g)

E(g)$label = LETTERS[1:6]
V(g)$label = LETTERS[1:6]

plot(g, vertex.size = 25, edge.arrow.size = 0.8)

plot(g, vertex.size = 25, edge.arrow.size = 0.8,edge.curved =
       TRUE, layout = layout.circle)

tkplot(g)

############################################################################


install.packages("plotrix")
library(plotrix)

oil = read.csv("oil.csv")

radial.plot(oil[,21],rp.type="p",lwd =3,line.col="blue",
            labels=oil$Month, clockwise = TRUE, start = 1.5,
            grid.unit = c("$"), main = "Oil prices in 2013")


plot.new()

radial.plot(oil[,2],rp.type="p",lwd =3,line.col="blue",
            labels=oil$Month, clockwise = TRUE, start = 1.5, grid.unit =
              c("$"), main = "Oil prices cysles 1994-2013",
            radial.lim = c(0,4))


for(i in 3:21){
  radial.plot(oil[,i],rp.type="p",lwd =3,line.col="blue",
              labels=oil$Month, clockwise = TRUE, start = 1.5, add = TRUE) }

summary(oil)

#############################################################################


install.packages(c("plotrix","RColorBrewer"))

library("plotrix")
library("RColorBrewer")

data = read.csv("cancer.csv", sep = ",", header = TRUE)

View(data)

pyramid.plot(data$Men_g,data$Women_g,labels=data$Causes,
             unit = NA, gap = 60000,laxlab=c(0,100000,150000,200000),
             raxlab=c(0,100000,150000,200000),
             top.labels = c("Male", "Cancer", "Female"),
             lxcol = "#99d8c9",rxcol = "#bcbddc")

pyramid.plot(data$Men_d,data$Women_d,labels=data$Causes,
             unit = NA, gap = 60000,laxlab=c(0,100000,150000,200000),
             raxlab=c(0,100000,150000,200000),lxcol = "#2ca25f",
             rxcol ="#8856a7", add = TRUE, space = 0.5)

legend("topleft", fill = c("#99d8c9","#2ca25f"),
       legend=c("New Cases","Death"), border = FALSE, bty= "n")

legend("topright", fill = c("#bcbddc","#8856a7"),
       legend=c("New Cases","Death"), border = FALSE, bty = "n")

?legend()

