## Set global parameters for the plot. Following command sets num of plots (4 in this case), margins,
## and outer margin
par(mfcol=c(2,2), mar=c(5.1,4.1,4.1,2.1), oma=c(0,0,0,0))

## Read data from for the dates 1/2/2007 and 2/2/2007
## The data contains millions of rows, so it is appropriate to read only the relevant data.
## Pope function can be used to read only relevant data.
## All the missing values, denoted by '?', are replaced with NA, while reading the table
data <- read.table(pipe('egrep -i \'^1/2/2007|^2/2/2007\' household_power_consumption.txt'), sep=";", na.strings="?")

## Create datetime vector
## Combine date and time character values in first and second columns, and convert 
## the resultant vector to the datetime class
dateTime <- strptime(paste(data$V1, data$V2, sep=" "),format="%d/%m/%Y %H:%M:%S")

## Plot 4 differemt plots in the same plot
## Subset dateTime and respective  vectors such that the vectors do not contain
## missing data
with(data, {
        plot(dateTime[!is.na(data$V3) & !is.na(dateTime)], data$V3[!is.na(data$V3) & !is.na(dateTime)], type="l", xlab="", ylab="Global Active Power (kilowatts)")
        plot(dateTime[!is.na(data$V7) & !is.na(dateTime)], data$V7[!is.na(data$V7) & !is.na(dateTime)], type="l", xlab="", ylab="Energy sub metering")
        points(dateTime[!is.na(data$V8) & !is.na(dateTime)], data$V8[!is.na(data$V8) & !is.na(dateTime)], type="l", col="red")
        points(dateTime[!is.na(data$V9) & !is.na(dateTime)], data$V9[!is.na(data$V9) & !is.na(dateTime)], type="l", col="blue")
        legend("topright", lty=1, bty="n",col=c("black", "red", "blue"), cex = 0.7, pt.cex= 1, ncol=1.1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        plot(dateTime[!is.na(data$V5) & !is.na(dateTime)], data$V5[!is.na(data$V5) & !is.na(dateTime)], type="l", xlab="datetime", ylab="Voltage")
        plot(dateTime[!is.na(data$V7) & !is.na(dateTime)],data$V4[!is.na(data$V4) & !is.na(dateTime)], type="l", xlab="datetime", ylab="Global_reactive_power")
})

## Copy the plot to the PNG file. 
## Default width and height of the files created are 480 px and 480 px. So, there
## is no need to set the width and height of the png file
dev.copy(png, file="plot4.png")
dev.off()