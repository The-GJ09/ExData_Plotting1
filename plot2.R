## Reading the txt fiel into R
d<-read.delim("household_power_consumption.txt", sep = ";")

##Subsetting the data for the required dates
d_sub<- subset(d,d$Date=="1/2/2007" | d$Date =="2/2/2007")

##converting factor values in Global Active power colum to numeric
d_sub[,3]<-as.character.factor(d_sub[,3])
d_sub[,3]<- as.numeric(d_sub[,3])

## Creating time axis for the plot
datetime <- strptime(paste(d_sub$Date, d_sub$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")

## Plotting the graph and exporting it to png file
png("plot2.png", width=480, height=480, units = "px", bg = "white")
plot(datetime, d_sub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()