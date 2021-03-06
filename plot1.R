#This R script will create a Plot 1 for the Exploratory Data Analysis Project
#plot1.R

pow <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(pow) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpow <- subset(pow,pow$Date=="1/2/2007" | pow$Date =="2/2/2007")

#Calling the base plot function
hist(as.numeric(as.character(subpow$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

#Including the Annotation for the Graph
title(main="Global Active Power")


