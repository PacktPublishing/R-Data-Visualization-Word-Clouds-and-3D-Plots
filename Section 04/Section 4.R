install.packages(c("wordcloud","RColorBrewer","tm"))

library(wordcloud)
library(RColorBrewer)
library(tm)

pal = brewer.pal(6,"RdGy")

wordcloud("I also want to thank all the members of Congress and my
          administration who are here today for the wonderful work that
          they do. I want to thank Mayor Gray and everyone here at THEARC
          for having me..", min.freq = 1, scale=c(2,0.5),
          random.color = TRUE, color = pal)

wordcloud(c("inequality","law","policy","unemploy","job",
            "Economy","Democracy","Republicans","challenge","congress",
            "America","growth"),freq=c(26,9,2,7,30,26,1,4,3,9,57,9),
            min.freq = 0, col = "red")
################################################################################




install.packages(c("wordcloud","tm"))

library(tm)
library(wordcloud)

file = readLines("obama.txt")

?readLines()

doc = Corpus(VectorSource(file))

doc= tm_map(doc, tolower)
doc= tm_map(doc, removePunctuation)
doc= tm_map(doc, removeNumbers)
doc= tm_map(doc, removeWords,stopwords("english"))
doc= tm_map(doc, removeWords,c("applause","must", "will","know"))

wordcloud(as.character(doc), scale= c(2,0.5))  #wordcloud(doc, scale=c(2,0.5)) #tm=0.5

?wordcloud()

windowsFonts(JP1 = windowsFont("MS Mincho"))
par(family = "JP1")
wordcloud(doc, scale= c(2,0.5))

######################################################################

install.packages(c("tm","wordcloud"))

library(wordcloud)
library(tm)

files = DirSource("speech/")

data = Corpus(DirSource("speech/"))

data= tm_map(data, content_transformer(tolower))
data=tm_map(data, removePunctuation)
data=tm_map(data, removeNumbers)
data=tm_map(data, removeWords, stopwords("english"))

data=tm_map(data,removeWords,c("applause","Applause","APPLAUSE",
                               "And","But","will","must"))


data = TermDocumentMatrix(data)
data = as.matrix(data)

colnames(data)= c("bush","obama")

comparison.cloud(data,max.words = 250, title.size = 2,
                 colors = brewer.pal(3,"Set1"))

###########################################################


##################

install.packages(c("corrplot","tm"))

library(corrplot)

library(tm)

data(crude)

data= tm_map(crude, content_transformer(tolower))
data=tm_map(data, removePunctuation)
data=tm_map(data, removeNumbers)
data=tm_map(data, removeWords, stopwords("english"))
data = TermDocumentMatrix(data)

findFreqTerms(data, 14)

findAssocs(data, c("oil","crude"), c(0.56))

data = as.matrix(data)

crf = cor(data)

corrplot(crf, method = c("ellipse"))

#################################################

install.packages("sysfonts")
library(sysfonts)

download.file("http://simonsoftware.se/other/xkcd.ttf",
              dest="xkcd.ttf", mode="wb")


font.paths()
system("mkdir ~/.fonts")
system("cp xkcd.ttf -t ~/.fonts")
font.files()
font.add("xkcd", regular = "xkcd.ttf")
font.families()
windowsFonts(xk = windowsFont("xk"))
par(family = "xk")

windowsFonts(xk = windowsFont("xkcd"))

fake1 = c(2000:2005)
fake_us = c(10,15,7,19,5,8)
fake_jp = c(20,10,9,10,12,14)
data = cbind(fake1,fake_us,fake_jp)
data= data.frame(data)
colnames(data)= c("years","USA", "Japan")

par(family = "xk")

plot(data$years,data$USA, type = "l", lwd = 3,
     main = "GDP growth rate", xlab = c("YEARS"),
     ylab = c("GDP growth"))

lines(data$years,data$Japan, type = "l", lwd = 3, col = "red")
text(2005,15, "Japan")
text(2005,10, "USA")
######################################################

install.packages(c("xkcd","ggplot2"))

library(xkcd)
library(ggplot2)

windowsFonts(xk = windowsFont("xkcd"))

theme_xk = theme(text=element_text(family = "xk" , size = 18),
                 axis.ticks.x = element_line(linetype = 1),
                 line = element_line(linetype = 3))

x = c(1,3,5,7,9,11)
y = c(8,8.2,7,5,1,1.5)
xrange = range(x)
yrange = range(y)

p <- ggplot() + geom_line(aes(x,y),linetype =3)
    +xkcdaxis(xrange,yrange)+geom_point(aes(x,y)) +
    xlab("Time spent with you")+ ylab("how much i like you")+
    labs(title = "our relationship")

p+ theme_xk+annotate("text", x=5, y = 6, label = "We got married!",family = "xk" )










