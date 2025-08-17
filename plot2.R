#Plot2 Line plot of Global Active Power Over Time
txtfile2 <- "household_power_consumption.txt"

data2 <- read.table(txtfile2, header = TRUE, sep = ";", na.strings = "?",
                    colClasses = c("character", "character", rep("numeric", 7)))
data2 <- subset(data2, Date %in% c("1/2/2007", "2/2/2007"))
data2$DateTime <- as.POSIXct(strptime(paste(data2$Date, data2$Time)
                                      "%d/%m/%Y %H:%M:%S"))
data2 <- na.omit(data)

png("plot2.png", width = 480, height = 480)
plot(data2$DateTime, data2$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()