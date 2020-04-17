## Reading the txt fiel into R
d<-read.delim("household_power_consumption.txt", sep = ";")

## Converting Date colum to class type date
d[,1]<- as.Date(d[,1], format = "%d/%m/%Y")

##Subsetting the data for the required dates
d_sub<- subset(d, d$Date == "2007-02-01" | d$Date == "2007-02-02")

##converting factor values in Global Active power colum to numeric
d_sub[,3]<-as.character.factor(d_sub[,3])
d_sub[,3]<- as.numeric(d_sub[,3])

## PLotting the histogram with required settings and exporting file to a png file
png("plot1.png", width = 480, height = 480, units = "px", bg = "white")
par(mar= c(4, 4, 2, 1))
hist(d_sub$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()