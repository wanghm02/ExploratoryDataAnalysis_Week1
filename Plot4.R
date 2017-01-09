rm(list=ls())
## Reading data into R:
Data_EDA1<-read.table("household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

## Extract the data for the two dates "1/2/2007" and "2/2/2007"
sub<-subset(Data_EDA1,Date=="1/2/2007"|Date=="2/2/2007")

## Changing the class of Date from character to Date
sub$Date<-as.Date(sub$Date,format="%d/%m/%Y")

# Combining the Date and Time variable and creating a new column in dataset named "DateTime":
sub$DateTime <- as.POSIXct(paste(sub$Date, sub$Time))

## Creating the plot 4
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(sub$DateTime,sub$Global_active_power,type="l",ylab="Global active power",xlab="'")

plot(sub$DateTime,sub$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(sub$DateTime,sub$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="'")
lines(sub$DateTime,sub$Sub_metering_2,type="l",col="red")
lines(sub$DateTime,sub$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

plot(sub$DateTime,sub$Global_reactive_power,type="l",ylab="Global reactive power",xlab="datetime")

dev.off()
