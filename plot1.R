library(lubridate)
library(ggplot2)
library(png)

db <- read.table("household_power_consumption.txt", 
                 sep = ";", header = TRUE, as.is = TRUE, na.strings = "?")

db <- db[db$Date=="1/2/2007"|db$Date=="2/2/2007",]
db[,1] <- dmy(db[,1])
db[,2] <- hms(db[,2])

png(filename='figure/plot1.png', width=480, height=480, units='px')
hist(db[,3], col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
