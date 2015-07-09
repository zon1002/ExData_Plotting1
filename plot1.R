library(lubridate)
#library(ggplot2)
library(png)
# Read whole data table
db <- read.table("household_power_consumption.txt", 
                 sep = ";", header = TRUE, as.is = TRUE, na.strings = "?")
# sub 2007-02-01 and 2007-02-02
db <- db[db$Date=="1/2/2007"|db$Date=="2/2/2007",]

# Convert Date and Time columns
db[,1] <- dmy(db[,1])
db[,2] <- hms(db[,2])

# Open png device
png(filename='figure/plot1.png', width=480, height=480, units='px')
# plot data
hist(db[,3], col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off() # Close png device
