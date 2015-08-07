## Programm assignment One for Exploratory Data Analysis
## Dataset file is "household_power_consumption.txt" and extract data 
## from the dates 2007-02-01 and 2007-02-02
## Our goal is to make four plots for explorating the next analysis.

## plot2.R will plot global active power value by date and create 
## plot2.png files.

install.packages("dplyr")
library(dplyr)
library(lubridate)

## read dataset and extract data
alldata<-read.csv("household_power_consumption.txt",sep = ";")
mydata<-filter(alldata,Date == "1/2/2007"|Date == "2/2/2007")
global_active_power<-as.numeric(as.character(mydata$Global_active_power))

## convert to date
lct <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "C")
date_time<-paste(as.character(mydata$Date),as.character(mydata$Time),
                 sep = " ")
date_time<-strptime(date_time,"%d/%m/%Y %H:%M:%S")

## write to file 
png(filename = "plot2.png",bg = "white")

## plot global active power value by date
plot(date_time,global_active_power,type = "l",
     ylab = "Global Active Power(kilowatts)")

## close device 
dev.off()
