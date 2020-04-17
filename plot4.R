## Reading the txt fiel into R
d<-read.delim("household_power_consumption.txt", sep = ";")

##Subsetting the data for the required dates
d_sub<- subset(d,d$Date=="1/2/2007" | d$Date =="2/2/2007")

## Creating time axis for the plot
datetime <- strptime(paste(d_sub$Date, d_sub$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")

##converting factor values in Global active power, global reactove power, voltage and sub_metering_1/2/3 to numeric
l<-c(3:5,7:9)
for (i in l){
  d_sub[,i]<-as.character(d_sub[,i])
  d_sub[,i]<- as.numeric(d_sub[,i])
}

## Deviding the canvas and plotting graphs sequentially and exporting in png file
png("plot4.png", width=480, height=480, units = "px", bg = "white")
par(mfrow=c(2,2))
##plot1
plot(datetime, d_sub$Global_active_power, type="l", xlab="", ylab="Global Active Power")

##plot2
plot(datetime, d_sub$Voltage, type="l", xlab="datetime", ylab="Voltage")

##plot3
plot(datetime, d_sub$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, d_sub$Sub_metering_2, type="l", col="red")
lines(datetime, d_sub$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"), col = c("black", "red", "blue"), lwd = 2)

##plot4
plot(datetime, d_sub$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()