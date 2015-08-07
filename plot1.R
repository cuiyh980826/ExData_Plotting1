## Programm assignment One for Exploratory Data Analysis
## Dataset file is "household_power_consumption.txt" and extract data 
## from the dates 2007-02-01 and 2007-02-02
## Our goal is to make four plots for explorating the next analysis.

## plot1.R will plot global active power histgram and create 
## plot1.png files.

install.packages("dplyr")
library(dplyr)

## read dataset and extract data
alldata<-read.csv("household_power_consumption.txt",sep = ";")
mydata<-filter(alldata,Date == "1/2/2007"|Date == "2/2/2007")

## write to file 
png(filename = "plot1.png",bg = "white")

## plot global active power histgram
global_active_power<-as.numeric(as.character(mydata$Global_active_power))
hist(global_active_power,main = "Global Active Power",col = "red", 
     xlab="Global Active Power(kilowatts)")

## close device 
dev.off()

