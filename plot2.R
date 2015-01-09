library(dplyr)

#read data
data <- read.table("household_power_consumption.txt", 
                   sep = ";", na.strings = "?", header = TRUE)

#select data from the dates 2007-02-01 and 2007-02-02
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
data <- na.omit(data)

#convert the Date variable to Date classe, 
#create new variable "DateTime" from Date/Time classe

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format = "%Y-%m-%d %H:%M:%S")

#create the PNG file
png(file = "plot2.png", width = 480, height = 480, bg = "transparent")

#make the plot
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")


dev.off()