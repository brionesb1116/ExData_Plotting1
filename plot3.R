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
sub1 <- as.numeric(subset$Sub_metering_1)
sub2 <- as.numeric(subset$Sub_metering_2)
sub3 <- as.numeric(subset$Sub_metering_3)

# plot 3, the line graphs and its creation of a .png file
plot(time, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(time, sub2, type="l", col="red")
lines(time, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.copy(png, "plot3.png", width=480, height=480)
dev.off()
