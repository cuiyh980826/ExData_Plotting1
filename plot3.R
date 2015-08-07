## Programm assignment One for Exploratory Data Analysis
## Dataset file is "household_power_consumption.txt" and extract data 
## from the dates 2007-02-01 and 2007-02-02
## Our goal is to make four plots for explorating the next analysis.

## plot3.R will plot  Submetering_1, Submetering_2,Submetering_3
## by date and create plot3.png files.

install.packages("dplyr")
library(dplyr)
library(lubridate)

## read dataset and extract data
alldata<-read.csv("household_power_consumption.txt",sep = ";")
mydata<-filter(alldata,Date == "1/2/2007"|Date == "2/2/2007")

## convert Sub_metering to numeric and delete Null value
Sub_metering_1<-as.numeric(as.character(mydata$Sub_metering_1))
Sub_metering_2<-as.numeric(as.character(mydata$Sub_metering_2))
Sub_metering_3<-mydata$Sub_metering_3

## convert to date
lct <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "C")
date_time<-paste(as.character(mydata$Date),as.character(mydata$Time),
                 sep = " ")
date_time<-strptime(date_time,"%d/%m/%Y %H:%M:%S")

## write to file 
png(filename = "plot3.png",bg = "white")

## plot global active power value by date
plot(date_time,Sub_metering_1,type = "l",
     ylab = "Energy Sub Metering")
points(date_time,Sub_metering_2,type = "l",col = "red")
points(date_time,Sub_metering_3,type = "l",col = "blue")
legend("topright",pch = "——",col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## close device 
dev.off()
