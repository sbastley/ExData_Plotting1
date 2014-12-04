##Exdata folder within directory above working directory which is git repository
dat <- read.csv2("../exdata-data-household_power_consumption/household_power_consumption.txt", na.strings="?", colClasses="character")

data <- dat[dat$Date=="1/2/2007"|dat$Date=="2/2/2007",]
rm(dat)
##strptime to label x axis with day names
dates <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")


png(file="plot4.png")
par(mfcol=c(2,2))
with(data, {
plot(dates, data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")

plot(dates,data$Sub_metering_1,xlab="",ylab="Energy sub metering", type="l")
lines(dates, data$Sub_metering_2, col="red")
lines(dates, data$Sub_metering_3, col="blue")
legend("topright", lty=1, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(dates, data$Voltage, xlab="datetime", ylab="Voltage", type="l")

plot(dates, data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
})
dev.off()