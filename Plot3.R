data <- read.table("Data/household_power_consumption.txt", sep=";", header = TRUE, colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), nrows = 2075259, na.strings="?")
my_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
par(cex=0.8, mar=c(4.1,4.1,4.1,2.1), mfcol = c(1,1))
days <- cbind(my_data$Date,my_data$Time) #bind columns $date and $time
days <- apply(days,1,paste,collapse=" ") #paste them together by row
days <- strptime(days, format = "%d/%m/%Y %H:%M:%S") #format the newly created "day+time" variable so that R can interpret it
with(my_data, plot(days, my_data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering", cex.lab=.8, cex.axis=.8, cex.main=.8, cex.sub=.8))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col = c(1,2,4), text.width = 50000, cex=0.8, y.intersp=0.6)
with(my_data, lines(days, my_data$Sub_metering_1, col="black"))
with(my_data, lines(days, my_data$Sub_metering_2, col="red"))
with(my_data, lines(days, my_data$Sub_metering_3, col="blue"))
dev.copy(png, "Plot3.png", width = 480, height = 480)
dev.off()