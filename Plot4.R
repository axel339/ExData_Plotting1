data <- read.table("Data/household_power_consumption.txt", sep=";", header = TRUE, colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), nrows = 2075259, na.strings="?")
my_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
par(cex=0.7, mar=c(4.1,4.1,4.1,2.1), mfcol = c(2,2))
days <- cbind(my_data$Date,my_data$Time) #bind columns $date and $time
days <- apply(days,1,paste,collapse=" ") #paste them together by row
days <- strptime(days, format = "%d/%m/%Y %H:%M:%S") #format the newly created "day+time" variable so that R can interpret it
plot(days, my_data$Global_active_power, xlab="", ylab = "Global Active Power", type = "l",cex.lab=.7, cex.axis=.7, cex.main=.7, cex.sub=.7)
with(my_data, plot(days, my_data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering",cex.lab=.7, cex.axis=.7, cex.main=.7, cex.sub=.7))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col = c(1,2,4), text.width = 75000, cex=0.7, y.intersp=0.4, bty="n")
with(my_data, lines(days, my_data$Sub_metering_1, col="black"))
with(my_data, lines(days, my_data$Sub_metering_2, col="red"))
with(my_data, lines(days, my_data$Sub_metering_3, col="blue"))
plot(days, my_data$Voltage, xlab="datetime", ylab = "Voltage", type = "l", cex.lab=.7, cex.axis=.7, cex.main=.7, cex.sub=.7)
plot(days, my_data$Global_reactive_power, xlab="datetime", ylab = "Global_reactive_power", type = "l", cex.lab=.7, cex.axis=.7, cex.main=.7, cex.sub=.7)
dev.copy(png, "Plot4.png", width = 480, height = 480)
dev.off()