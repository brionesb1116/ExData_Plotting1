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

globalActivePower <- as.numeric(subset$Global_active_power)


# plot 1, the histogram and creation of its .png file
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
