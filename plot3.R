par(mfcol=c(1,1), mar=c(5.1,4.1, 4.1,4.1), oma=c(0,0,0,0))
data <- read.table(pipe('egrep -i \'^1/2/2007|^2/2/2007\' household_power_consumption.txt'), sep=";", na.strings="?")
data <- data[complete.cases(data),]
dateTime <- strptime(paste(data$V1, data$V2, sep=" "),format="%d/%m/%Y %H:%M:%S")
plot(dateTime, data$V7, type="l", xlab="", ylab="Energy sub metering")
points(dateTime, data$V8, type="l", col="red")
points(dateTime, data$V9, type="l", col="blue")
legend("topright", lty=1,col=c("black", "red", "blue"), cex = 0.7, pt.cex= 1, ncol=1.1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file="plot3.png")
dev.off()