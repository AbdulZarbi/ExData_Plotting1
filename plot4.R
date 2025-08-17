# plot4.R
# 2x2 panel of plots

txtFile4 <- "household_power_consumption.txt"

data4 <- read.table(txtFile4, header = TRUE, sep = ";", na.strings = "?",
                   colClasses = c("character","character", rep("numeric", 7)))

data4 <- subset(data4, Date %in% c("1/2/2007", "2/2/2007"))
data4$DateTime <- as.POSIXct(strptime(paste(data4$Date, data4$Time),
                                     "%d/%m/%Y %H:%M:%S"))

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Top-left
plot(data4$DateTime, data4$Global_active_power,
     type = "l", xlab = "", ylab = "Global Active Power")

# Top-right
plot(data4$DateTime, data4$Voltage,
     type = "l", xlab = "datetime", ylab = "Voltage")

# Bottom-left
plot(data4$DateTime, data4$Sub_metering_1,
     type = "l", xlab = "", ylab = "Energy sub metering")
lines(data4$DateTime, data4$Sub_metering_2, col = "red")
lines(data4$DateTime, data4$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),
       lty = 1, bty = "n")

# Bottom-right
plot(data4$DateTime, data4$Global_reactive_power,
     type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()