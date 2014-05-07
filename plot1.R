

## Reading Relevent data
data=read.table('household_power_consumption.txt', header=T, sep=';', stringsAsFactors=F, na.strings='?', skip=66636, nrow=2880)
colnames(data) <- c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')

data$Date = as.Date(data$Date, format='%d/%m/%Y')

## Draw the histogram of plot 1 in a png file
png('plot1.png')
hist(data$Global_active_power, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)', ylab='Frequency', ylim=c(0, 1200))
dev.off()