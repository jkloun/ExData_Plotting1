library(data.table)


alldata <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
alldata$Date2 <- as.Date(alldata$Date, format = "%d/%m/%Y")
smalldata <- alldata[alldata$Date2 >= "2007-02-01" & alldata$Date2 <= "2007-02-02",]
smalldata$newdate <- as.POSIXct(paste(smalldata$Date2, smalldata$Time), format = "%Y-%m-%d %H:%M:%S")


###Plot 1
with(smalldata,hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red"))

dev.copy(png, "plot1.png")
dev.off()
