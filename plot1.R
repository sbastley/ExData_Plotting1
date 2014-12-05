##Assumes unzipped Exdata folder within directory above working directory which is git repository
##Use read.csv2 since this the data is semi-colon separated instead of comma separated
##Make column classes character
dat <- read.csv2("../exdata-data-household_power_consumption/household_power_consumption.txt", na.strings="?", colClasses="character")

##Subset two days of data
data <- dat[dat$Date=="1/2/2007"|dat$Date=="2/2/2007",]

##Remove original, large data
rm(dat)

##Convert Global active power column class to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

##Open png device
png(file="plot1.png")

##Make histogram global active power column and color and label it
with(data, hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))

##Close file device
dev.off()