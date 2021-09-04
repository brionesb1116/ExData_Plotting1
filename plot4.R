library(data.table)
library(chron)

setwd("~/Documents/r-things")

fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, "powerset.zip")
unzip("powerset.zip")

# "household_power_consumption.txt" the file obtained after unzipping
# read "household_power_consumption.txt" to table
dataset <- read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors = F)

# selecting just the subset of dates, 2007-02-01 and 2007-02-02
subset <- subset(dataset, Date=="1/2/2007" | Date=="2/2/2007")
time <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subset$Global_active_power)
globalReactivePower <- as.numeric(subset$Global_reactive_power)
voltage <- as.numeric(subset$Voltage)
globalIntensity <- as.numeric(subset$Global_intensity)
sub1 <- as.numeric(subset$Sub_metering_1)
sub2 <- as.numeric(subset$Sub_metering_2)
sub3 <- as.numeric(subset$Sub_metering_3)

# plot 4, the multiple plots and creation of the .pdf file
par(mfrow=c(2,2))
plot(time, globalActivePower, type="l", xlab = "", ylab = "Global Active Power") # first plot
plot(time, voltage, type="l", xlab="datetime", ylab = "Voltage") # second plot
plot(time, sub1, type="l", xlab="", ylab="Energy sub metering") # third plot
  lines(time,sub2, type="l", col="red")
  lines(time,sub3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, bty="n", col=c("black", "red", "blue"))
plot(time, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power", cex=0.2) # fourth plot
dev.copy(png, "plot4.png", width=480, height=480)
dev.off()
