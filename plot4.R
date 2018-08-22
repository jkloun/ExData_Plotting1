library(data.table)


alldata <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
alldata$Date2 <- as.Date(alldata$Date, format = "%d/%m/%Y")
smalldata <- alldata[alldata$Date2 >= "2007-02-01" & alldata$Date2 <= "2007-02-02",]
smalldata$newdate <- as.POSIXct(paste(smalldata$Date2, smalldata$Time), format = "%Y-%m-%d %H:%M:%S")

####Plot 4
par(mfrow=c(2,2))
with(smalldata,plot(newdate, Global_active_power, type = "l", ylab = "Global Active Power", xlab=""))
with(smalldata,plot(newdate, Voltage,  type = "l", ylab = "Voltage", xlab="datetime"))

with(smalldata,plot(newdate,Sub_metering_1,  type = "l", ylab = "Energy sub metering", xlab=""))
par(new=T)
with(smalldata,plot(newdate,Sub_metering_2,  type = "l", axes = FALSE, ylab = "", xlab="", col="red", ylim = c(0,38)))
par(new=T)
with(smalldata,plot(newdate,Sub_metering_3,  type = "l", axes = FALSE, ylab = "", xlab="", col="blue", ylim = c(0,38)))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = 1, bty = "n" )

with(smalldata,plot(newdate, Global_reactive_power,  type = "l", ylab = "Global_reactive_power", xlab="datetime"))



dev.copy(png, "plot4.png")
dev.off()

