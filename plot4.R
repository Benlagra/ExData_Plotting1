## Reading Relevent data
data=read.table('household_power_consumption.txt', header=T, sep=';', stringsAsFactors=F, na.strings='?', skip=66636, nrow=2880)
colnames(data) <- c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')

Date <- strptime(paste(data$Date, data$Time, sep=' '), format = '%d/%m/%Y %H:%M:%S', tz='GMT')

data <- data.frame(Date, data[, c(3:5,7:9)])

## Draw the histogram of plot 1 in a png file
png('plot4.png')
par(mfrow=c(2,2))
## First Graph
plot(data$Global_active_power ~ data$Date, type='l', xlab='', ylab='Global Active Power')

## Second graph
plot(data$Voltage ~ data$Date, type='l', xlab='datetime', ylab='Voltage')

## Third Graph
plot(data$Sub_metering_1 ~ data$Date, col=c('black', 'red', 'blue'), type='l', xlab='', ylab='Energy sub metering')
lines(data$Sub_metering_2~data$Date, col='red')
lines(data$Sub_metering_3~data$Date, col='blue')
legend('topright', bty='n', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1, lwd=1)

## Fourth Graph

plot(data$Global_reactive_power ~ data$Date, type='l', xlab='datetime', ylab='Global_reactive_power')
dev.off()