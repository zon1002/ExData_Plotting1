
library(lubridate)
#library(ggplot2)
library(png)

db <- read.table("household_power_consumption.txt", 
                 sep = ";", header = TRUE, as.is = TRUE, na.strings = "?")

db <- db[db$Date=="1/2/2007"|db$Date=="2/2/2007",]
db[,1] <- dmy(db[,1])
db[,2] <- hms(db[,2])

png(filename='figure/plot2.png', width=480, height=480, units='px')
plot(as.POSIXlt(db$Date+db$Time),db$Global_active_power, xlab="", 
     ylab="Global Active Power (kilowatts)", type="l")
dev.off()
