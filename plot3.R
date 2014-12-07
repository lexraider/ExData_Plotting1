# set working directory
setwd("C:/Users/Lex/Dropbox/Online Courses/Coursera/Exploratory Data Analysis/Assignment 1")

# import data
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   colClasses = c("character", "character", rep("numeric", 7)))

# subset
sub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# merge date & time
sub$Date <- paste(sub$Date, sub$Time)
dt <- strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S")

# plot
png(file = "plot3.png", bg = "transparent")
plot(dt,
     sub$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering",
     col = "black")
lines(dt,
     sub$Sub_metering_2,
     col = "red")
lines(dt,
     sub$Sub_metering_3,
     col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1,
       col = c("black", "red", "blue"))
dev.off()