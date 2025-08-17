# Creating plot1 (480x480) Histogram of the Global Active Power
txtfile <- "household_power_consumption.txt"

# Load the data 
data <- read.table(txtfile, header = TRUE, sep = ";", na.strings = "?", 
                   colClasses = c("character", "character", rep("numeric", 7)))

# Data dim
dim(data)
View(data)

# Filter the data for two days
data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time),
                                     "%d/%m/%Y %H:%M:%S"))
# plot
png("plot1.png", width = 480, height = 480)
hist(data$Global_reactive_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (Kilowatts)")
dev.off()