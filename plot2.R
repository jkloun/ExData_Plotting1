library(data.table)


alldata <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
alldata$Date2 <- as.Date(alldata$Date, format = "%d/%m/%Y")
smalldata <- alldata[alldata$Date2 >= "2007-02-01" & alldata$Date2 <= "2007-02-02",]
smalldata$newdate <- as.POSIXct(paste(smalldata$Date2, smalldata$Time), format = "%Y-%m-%d %H:%M:%S")


###Plot2
par("ps" = 10)
with(smalldata,plot(newdate, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab=""))

dev.copy(png, "plot2.png")
dev.off()

