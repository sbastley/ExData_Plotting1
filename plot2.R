##Exdata folder within directory above working directory which is git repository
dat <- read.csv2("../exdata-data-household_power_consumption/household_power_consumption.txt", na.strings="?", colClasses="character")

data <- dat[dat$Date=="1/2/2007"|dat$Date=="2/2/2007",]
rm(dat)
##strptime to label x axis with day names
dates <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")


png(file="plot2.png")
with(data, plot(dates, data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l"))

dev.off()