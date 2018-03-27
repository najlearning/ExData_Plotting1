#This is an R Script for the Exploratory Data Analysis Project 
#plot4.R


#Reading the file
pow <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(pow) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpow <- subset(pow,pow$Date=="1/2/2007" | pow$Date =="2/2/2007")

#Transforming and reformatting variables
subpow$Date <- as.Date(subpow$Date, format="%d/%m/%Y")
subpow$Time <- strptime(subpow$Time, format="%H:%M:%S")
subpow[1:1440,"Time"] <- format(subpow[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpow[1441:2880,"Time"] <- format(subpow[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


#Composite plot for many graphs
par(mfrow=c(2,2))

#Calling the base plot function for displaying the 4 graphs
with(subpow,{
  plot(subpow$Time,as.numeric(as.character(subpow$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subpow$Time,as.numeric(as.character(subpow$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subpow$Time,subpow$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subpow,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subpow,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subpow,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subpow$Time,as.numeric(as.character(subpow$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})



