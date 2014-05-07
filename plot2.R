#
# Please refer to the README.md file for an explanation on how I read the original #data
#

## Reading Relevent data
data <- read.table('household_power_consumption.txt', header = T, sep = ';', stringsAsFactors = F, na.strings = '?', skip = 66636, nrow = 2880)

colnames(data) <- c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')

## Merging Date and Time columns into one vector with the appropriate format.
Date <- strptime(paste(data$Date, data$Time, sep = ' '), format = '%d/%m/%Y %H:%M:%S')

## Build a new data frame with only the required data for the plot
data <- data.frame(Date, data[,3:3])

## Name the columns appropriately
colnames(data) <- c('Date', 'Global_Active_power')

## Draw plot 2 in a png file
png('plot2.png')
### Set days names to english
Sys.setlocale(category = "LC_TIME", locale = "en_GB.UTF-8")
with(data,
       plot(Date, Global_Active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = '')
)
dev.off()