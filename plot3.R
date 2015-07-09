
library(lubridate)
#library(ggplot2)
library(png)

db <- read.table("household_power_consumption.txt", 
                 sep = ";", header = TRUE, as.is = TRUE, na.strings = "?")

db <- db[db$Date=="1/2/2007"|db$Date=="2/2/2007",]
db[,1] <- dmy(db[,1])
db[,2] <- hms(db[,2])
lcols <- c("black","red","blue")
#keys=list(corner=c(1,1),
#          border = TRUE,
#           lines=list(col=c("black","red","blue"), lty=1, lwd=1),
#           text=list(c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#)
lgd <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
png(filename='figure/plot3.png', width=480, height=480, units='px')
#xyplot(Sub_metering_1+Sub_metering_2+Sub_metering_3 ~ 
#        as.POSIXlt(Date+Time), data=db,  ylab="Energy sub metering", xlab="",
#       type="l", col=lcols, key=keys, auto.key=TRUE)

plot(as.POSIXlt(db$Date+db$Time),db$Sub_metering_1, xlab="", 
     ylab="Energy sub metering", type="l",col=lcols[1])
lines(as.POSIXlt(db$Date+db$Time),db$Sub_metering_2,col=lcols[2])
lines(as.POSIXlt(db$Date+db$Time),db$Sub_metering_3,col=lcols[3])
legend("topright", legend=lgd, col=lcols, border=TRUE, lty=1)

dev.off()
