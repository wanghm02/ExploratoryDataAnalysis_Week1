rm(list=ls())
## Reading data into R:
Data_EDA1<-read.table("household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

## Extract the data for the two dates "1/2/2007" and "2/2/2007"
sub<-subset(Data_EDA1,Date=="1/2/2007"|Date=="2/2/2007")
## Changing the class of Date from character to Date
sub$Date<-as.Date(sub$Date,format="%d/%m/%Y")

## Creating the plot 1
png("plot1.png",width=480,height=480)
hist(sub$Global_active_power,main="Global_active_power",col="red",ylab="Frequency",xlab="Global_active_power (kilowatts)")
dev.off()
