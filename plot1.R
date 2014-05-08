## Set global parameters for the plot. Following command sets num of plots, margins,
## and outer margin.
par(mfcol=c(1,1), mar=c(5.1,4.1, 4.1,2.1), oma=c(0,0,0,0))

## Read data from for the dates 1/2/2007 and 2/2/2007
## The data contains millions of rows, so it is appropriate to read only the relevant data.
## Pipe function can be used to read only relevant data.
## All the missing values, denoted by '?', are replaced with NA, while reading the table
data = read.table(pipe('egrep -i \'^1/2/2007|^2/2/2007\' household_power_consumption.txt'), sep=";", na.strings="?")

## Draw the histogram on the screen device. Subset the column for non-na values
hist(data$V3[!is.na(data$V3)],col="red", xlab="Global Active Power (killowatts)", main="Global Active Power")

## Copy the plot to the PNG file. 
## Default width and height of the files created are 480 px and 480 px. So, there
## is no need to set the width and height of the png file
dev.copy(png, file="plot1.png")
dev.off()