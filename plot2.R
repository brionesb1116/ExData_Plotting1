library(data.table)
library(chron)

setwd("~/Documents/r-things")

fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, "powerset.zip")
unzip("powerset.zip")
dataset <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE)
subset <- subset(dataset, Date=="1/2/2007" | Date=="2/2/2007")
time <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# plot 2, the line graph and creation of its .png file
globalActivePower <- as.numeric(subset$Global_active_power)
plot(time, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
