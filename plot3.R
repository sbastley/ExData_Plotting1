##Updated plot3.R
##Assumes unzipped Exdata folder within directory above working directory which is git repository
##Use read.csv2 since this data is semi-colon separated instead of comma separated
##Makes column classes into character
dat <- read.csv2("../exdata-data-household_power_consumption/household_power_consumption.txt", na.strings="?", colClasses="character")

##Subset two days of data
data <- dat[dat$Date=="1/2/2007"|dat$Date=="2/2/2007",]

##Remove original, large data
rm(dat)

##Use strptime to combine day and time data to label x axis for plot
dates <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

##Open png device
png(file="plot3.png")

##Make a line plot with sub metering 1 column by full dates and label the plot
with(data, plot(dates,data$Sub_metering_1,xlab="",ylab="Energy sub metering", type="l"))

##Add another line with sub metering 2 by full dates and color it red
lines(dates, data$Sub_metering_2, col="red")

##Add another line with sub metering 3 by full dates and color it blue
lines(dates, data$Sub_metering_3, col="blue")

##Add a legend in the top right corner and gives colored lines and labels to it
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Close file device
dev.off()