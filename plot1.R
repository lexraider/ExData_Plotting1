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

# plot freq vs. gobal active power
png(file = "plot1.png", bg = "transparent")
hist(sub$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()