library(lubridate)
library(ggplot2)
library(png)

db <- read.table("household_power_consumption.txt", 
                 sep = ";", header = TRUE, as.is = TRUE, na.strings = "?")

db <- db[db$Date=="1/2/2007"|db$Date=="2/2/2007",]
db[,1] <- dmy(db[,1])
db[,2] <- hms(db[,2])

png(filename='figure/plot4.png', width=480, height=480, units='px')

par(mfrow=c(2,2))
# Top Left
plot(as.POSIXlt(db$Date+db$Time),db$Global_active_power, xlab="", 
     ylab="Global Active Power", type="l")

# Top Right
plot(as.POSIXlt(db$Date+db$Time), db$Voltage, xlab="datetime", 
     ylab="Voltage", type="l")

# Bottom Left
lcols <- c("black","red","blue")
lgd <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
plot(as.POSIXlt(db$Date+db$Time), db$Sub_metering_1, xlab="", 
     ylab="Energy sub metering", type="l",col=lcols[1])
lines(as.POSIXlt(db$Date+db$Time),db$Sub_metering_2,col=lcols[2])
lines(as.POSIXlt(db$Date+db$Time),db$Sub_metering_3,col=lcols[3])
legend("topright","(x,y)", legend=lgd, col=lcols, lty=1,bty = "n")

# Bottom Right
plot(as.POSIXlt(db$Date+db$Time), db$Global_reactive_power, xlab="datetime", 
     ,ylab="Global_reactive_power", type="l")


dev.off()
