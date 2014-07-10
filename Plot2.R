data <- read.table("Data/household_power_consumption.txt", sep=";", header = TRUE, colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), nrows = 2075259, na.strings="?")
my_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
par(cex=0.8, mar=c(6,4.1,4.1,2.1))
days <- cbind(my_data$Date,my_data$Time) #bind columns $date and $time
days <- apply(days,1,paste,collapse=" ") #paste them together by row
days <- strptime(days, format = "%d/%m/%Y %H:%M:%S") #format the newly created "day+time" variable so that R can interpret it
plot(days, my_data$Global_active_power, xlab="", ylab = "Global Active Power (kilowatts)", type = "l")
dev.copy(png, "Plot2.png", width = 480, height = 480)
dev.off()