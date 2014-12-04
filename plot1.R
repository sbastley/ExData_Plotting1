##Exdata folder within directory above working directory which is git repository

dat <- read.csv2("../exdata-data-household_power_consumption/household_power_consumption.txt", na.strings="?", colClasses="character")
data <- dat[dat$Date=="1/2/2007"|dat$Date=="2/2/2007",]
rm(dat)

data$Global_active_power <- as.numeric(data$Global_active_power)

png(file="plot1.png")

with(data, hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))

dev.off()