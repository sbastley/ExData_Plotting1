##Updated plot2.R
##Assumes unzipped Exdata folder within directory above working directory which is git repository
##Use read.csv2 since this data is semi-colon separated instead of comma separated
##Makes column classes into character
dat <- read.csv2("../exdata-data-household_power_consumption/household_power_consumption.txt", na.strings="?", colClasses="character")

##Subset two days of data
data <- dat[dat$Date=="1/2/2007"|dat$Date=="2/2/2007",]

##Remove orignal, large data
rm(dat)

##Use strptime to combine day and time data to label x axis for plot
dates <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

##Open png device
png(file="plot2.png")

##Make a line plot with global active power by full dates and label the plot
with(data, plot(dates, data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l"))

##Close file device
dev.off()