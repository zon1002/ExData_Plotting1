library(lubridate)
library(png)

# Read whole data table
db <- read.table("household_power_consumption.txt", 
                 sep = ";", header = TRUE, as.is = TRUE, na.strings = "?")
# sub 2007-02-01 and 2007-02-02
db <- db[db$Date=="1/2/2007"|db$Date=="2/2/2007",]

# Convert Date and Time columns
db[,1] <- dmy(db[,1])
db[,2] <- hms(db[,2])

# Lattice method
#==============================================================================
# keys=list(corner=c(1,1),
#           border = TRUE,
#           lines=list(col=c("black","red","blue"), lty=1, lwd=1),
#           text=list(c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# )
# xyplot(Sub_metering_1+Sub_metering_2+Sub_metering_3 ~ 
#        as.POSIXlt(Date+Time), data=db,  ylab="Energy sub metering", xlab="",
#        type="l", col=lcols, key=keys, auto.key=TRUE)
#==============================================================================

# base plotting method

# open png device
png(filename='figure/plot3.png', width=480, height=480, units='px')

# plot data
lcols <- c("black","red","blue") # column's colors
lgds <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3") # column legends
plot(as.POSIXlt(db$Date+db$Time),db$Sub_metering_1, xlab="", 
     ylab="Energy sub metering", type="l",col=lcols[1])

# add new data lines
lines(as.POSIXlt(db$Date+db$Time),db$Sub_metering_2,col=lcols[2])
lines(as.POSIXlt(db$Date+db$Time),db$Sub_metering_3,col=lcols[3])

# add legend
legend("topright", legend=lgds, col=lcols, border=TRUE, lty=1)

# Close png device
dev.off()
