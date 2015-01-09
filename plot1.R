library(dplyr)

#read data
data <- read.table("household_power_consumption.txt", 
                   sep = ";", na.strings = "?", header = TRUE)

#select data from the dates 2007-02-01 and 2007-02-02
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
data <- na.omit(data)

#create the PNG file
png(file = "plot1.png", width = 480, height = 480, bg = "transparent")

#make the plot
hist(data$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")


dev.off()