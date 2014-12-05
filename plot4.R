##Assumes unzipped Exdata folder within directory above working directory which is git repository
##Use read.csv2 since this the data is semi-colon separated instead of comma separated
##Makes column classes into character
dat <- read.csv2("../exdata-data-household_power_consumption/household_power_consumption.txt", na.strings="?", colClasses="character")

##Subset two days of data
data <- dat[dat$Date=="1/2/2007"|dat$Date=="2/2/2007",]

##Remove original, large data
rm(dat)

##Use strptime to combine day and time data to label x axis for plots
dates <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

##Open png device
##Type = cairo or cairo-png for more detailed plot lines. Default or windows is harder to see
png(file="plot4.png", type="cairo")

##Change parameters to make two columns and two rows of plots added by column
par(mfcol=c(2,2))

##Make first line plot with global active power by full dates and label it
with(data, {
plot(dates, data$Global_active_power, xlab="", ylab="Global Active Power", type="l")

##Make next line plot with sub metering 1 2 and 3 by full dates and label, color, and make a legend
plot(dates,data$Sub_metering_1,xlab="",ylab="Energy sub metering", type="l")
lines(dates, data$Sub_metering_2, col="red")
lines(dates, data$Sub_metering_3, col="blue")
legend("topright", lty=1, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Make next line plot with voltage by full dates and label it
plot(dates, data$Voltage, xlab="datetime", ylab="Voltage", type="l")

##Make final line plot with global reactive power by full dates and label it
plot(dates, data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
})

##Close file device
dev.off()