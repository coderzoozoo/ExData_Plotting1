par(mfcol=c(1,1), mar=c(5.1,4.1, 4.1,2.1), oma=c(0,0,0,0))
data <- read.table(pipe('egrep -i \'^1/2/2007|^2/2/2007\' household_power_consumption.txt'), sep=";", na.strings="?")
data <- data[complete.cases(data),]
dateTime <- strptime(paste(data$V1, data$V2, sep=" "),format="%d/%m/%Y %H:%M:%S")
with(data, plot(dateTime, data$V3, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.copy(png, file="plot2.png")
dev.off()