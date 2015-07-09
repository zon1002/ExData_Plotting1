library(lubridate)
library(png)

db <- read.table("household_power_consumption.txt", 
                 sep = ";", header = TRUE, as.is = TRUE, na.strings = "?")
# sub 2007-02-01 and 2007-02-02
db <- db[db$Date=="1/2/2007"|db$Date=="2/2/2007",]

# Convert Date and Time columns
db[,1] <- dmy(db[,1])
db[,2] <- hms(db[,2])

# open png device
png(filename='figure/plot4.png', width=480, height=480, units='px')

# make 2 by 2 plots
par(mfrow=c(2,2))

# Top Left (1,1)
plot(as.POSIXlt(db$Date+db$Time),db$Global_active_power, xlab="", 
     ylab="Global Active Power", type="l")

# Top Right (1,2)
plot(as.POSIXlt(db$Date+db$Time), db$Voltage, xlab="datetime", 
     ylab="Voltage", type="l")

# Bottom Left (2,1)
lcols <- c("black","red","blue")
lgds <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
plot(as.POSIXlt(db$Date+db$Time), db$Sub_metering_1, xlab="", 
     ylab="Energy sub metering", type="l",col=lcols[1])
lines(as.POSIXlt(db$Date+db$Time),db$Sub_metering_2,col=lcols[2])
lines(as.POSIXlt(db$Date+db$Time),db$Sub_metering_3,col=lcols[3])
legend("topright","(x,y)", legend=lgds, col=lcols, lty=1, bty = "n")

# Bottom Right (2,2)
plot(as.POSIXlt(db$Date+db$Time), db$Global_reactive_power, xlab="datetime", 
     ,ylab="Global_reactive_power", type="l")

# Close device
dev.off()
