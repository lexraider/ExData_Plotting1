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

# plot freq vs. date-time
png(file = "plot2.png", bg = "transparent")
plot(dt,
     sub$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()