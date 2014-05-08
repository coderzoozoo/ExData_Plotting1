par(mfcol=c(1,1), mar=c(5.1,4.1, 4.1,2.1), oma=c(0,0,0,0))
data = read.table(pipe('egrep -i \'^1/2/2007|^2/2/2007\' household_power_consumption.txt'), sep=";", na.strings="?")
data <- data[complete.cases(data),]
hist(data$V3,col="red", xlab="Global Active Power (killowatts)", main="Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()