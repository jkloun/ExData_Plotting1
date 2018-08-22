library(data.table)


alldata <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
alldata$Date2 <- as.Date(alldata$Date, format = "%d/%m/%Y")
smalldata <- alldata[alldata$Date2 >= "2007-02-01" & alldata$Date2 <= "2007-02-02",]
smalldata$newdate <- as.POSIXct(paste(smalldata$Date2, smalldata$Time), format = "%Y-%m-%d %H:%M:%S")


###Plot 3
with(smalldata,plot(newdate,Sub_metering_1,  type = "l", ylab = "Energy sub metering", xlab=""))
par(new=T)
with(smalldata,plot(newdate,Sub_metering_2,  type = "l", axes = FALSE, ylab = "", xlab="", col="red", ylim = c(0,38)))
par(new=T)
with(smalldata,plot(newdate,Sub_metering_3,  type = "l", axes = FALSE, ylab = "", xlab="", col="blue", ylim = c(0,38)))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = 1 )


dev.copy(png, "plot3.png")
dev.off()

