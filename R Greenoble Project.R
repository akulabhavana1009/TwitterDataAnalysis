
install.packages("ggplot2")



library('ggplot2')

rm(list = ls())
grenoble <- read.csv("GRENOBLE.csv")
summary(grenoble)
str(grenoble)

grenoble$created <- strptime(grenoble$created,format = "%Y-%m-%d %H:%M:%S")
strftime(grenoble$created,format="%W")

summary(grenoble)

# Tweet Times Hourly

grenoble$hour <- as.numeric(format(grenoble$created,"%H"))

barplot(table(grenoble$hour), horiz = F,
        main = "Tweets Frequency Hourly",
        xlab = "Tweet Time",
        ylab = "Frequency")

#tweet Times weekly
grenoble$dayOfWeek <- as.character(weekdays(grenoble$created,abbreviate=T))

weeklyTweetsFreq <- sort(table(grenoble$dayOfWeek),decreasing = T)

barplot(weeklyTweetsFreq, horiz = F,
        main = "Weekly Tweets Frequency",
        xlab = "Tweets Weekly",
        ylab = "Frequency")

table(greenoble$isRetweet)


# Monthwise tweet frequency

library(lubridate)
week(as.Date("2015-01-07", format = "%Y-%m-%d"))

x <- as.POSIXct("2014-01-31")
x
ggplot(data = grenoble, aes(x = month(month(weeklyTweetsFreq, label = TRUE)))) +
  geom_bar(aes(fill = ..count..)) +
  xlab("Month") + ylab("Number of tweets") + 
  theme_minimal() +
  scale_fill_gradient(low = "cadetblue3", high = "chartreuse4")
  
#Comparison of the number of re-tweets and original tweets

library("hms")
library("scales")

x <- as.POSIXct("2014-01-31")
x
ggplot(data =grenoble, aes(x = grenoble$created, fill= text)) +
  geom_histogram(bins=48) +
  xlab("Time") + ylab("Number of tweets") + theme_minimal() +
  scale_fill_manual(values = c("chartreuse4", "chartreuse3"),
                    name = "Retweet")
