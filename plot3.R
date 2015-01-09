library(dplyr)

#read data
data <- read.table("household_power_consumption.txt", 
                   sep = ";", na.strings = "?", header = TRUE)

#select data from the dates 2007-02-01 and 2007-02-02
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
data <- na.omit(data)

#convert the Date variable to Date class, 
#create new variable "DateTime" and convert to Date/Time class

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format = "%Y-%m-%d %H:%M:%S")

#create the PNG file
png(file = "plot3.png", width = 480, height = 480, bg = "transparent")

#make the plot
plot(data$DateTime, data$Sub_metering_1, type = "n", xlab = "", 
     ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_1, type = "l")
lines(data$DateTime, data$Sub_metering_2, type = "l", col = "red")
lines(data$DateTime, data$Sub_metering_3, type = "l", col = "blue")?legend
legend("topright", col = c("black", "red", "blue"), lty = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off()