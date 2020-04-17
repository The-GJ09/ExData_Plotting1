## Reading the txt fiel into R
d<-read.delim("household_power_consumption.txt", sep = ";")

##Subsetting the data for the required dates
d_sub<- subset(d,d$Date=="1/2/2007" | d$Date =="2/2/2007")

## Creating time axis for the plot
datetime <- strptime(paste(d_sub$Date, d_sub$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")

##converting factor values in sub_metering_1/2/3 to numeric
l<-7:9
for (i in l){
  d_sub[,i]<-as.character.factor(d_sub[,i])
  d_sub[,i]<- as.numeric(d_sub[,i])
}

##Plotting the graphs and exporting to png file
png("plot3.png", width=480, height=480, units = "px", bg = "white")
plot(datetime, d_sub$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, d_sub$Sub_metering_2, type="l", col="red")
lines(datetime, d_sub$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"), col = c("black", "red", "blue"), lwd = 2)
dev.off()