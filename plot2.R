## Reading Relevent data
data=read.table('household_power_consumption.txt', header=T, sep=';', stringsAsFactors=F, na.strings='?', skip=66636, nrow=2880)
colnames(data) <- c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')

Date <- strptime(paste(data$Date, data$Time, sep=' '), format = '%d/%m/%Y %H:%M:%S')

data <- data.frame(Date, data[,3:3])

colnames(data) <- c('Date', 'Global_Active_power')

## Draw the histogram of plot 1 in a png file
png('plot2.png')
plot(data$Date, data$Global_Active_power, type='l', ylab='Global Active Power (kilowatts)', xlab='')
dev.off()