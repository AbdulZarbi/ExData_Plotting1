#Plot3 Energy sub-metering lines
txtfile3 <- "household_power_consumption.txt"
data3 <- read.table(txtfile3, header = TRUE, sep = ";", na.strings = "?", 
                    colClasses = c("character", "character", rep("numeric", 7)))
data3 <- na.omit(data)

data3 <- subset(data3, Date %in% c("1/2/2007", "2/2/2007"))
data3$DateTime <- as.POSIXct(strptime(paste(data3$Date, data3$Time),
                                      "%d/%m/%Y %H:%M:%S"))

png("plot3.png", width = 480, height = 480)
plot(data3$DateTime, data3$Sub_metering_1,
     type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(data3$DateTime, data3$Sub_metering_2, col = "red")
lines(data3$DateTime, data3$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty =1, bty = "n")
dev.off()