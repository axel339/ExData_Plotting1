data <- read.table("Data/household_power_consumption.txt", sep=";", header = TRUE, colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), nrows = 2075259, na.strings="?")
my_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
par(cex=0.8, mar=c(6,4.1,4.1,2.1))
hist(my_data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = 2)
dev.copy(png, "Plot1.png", width = 480, height = 480)
dev.off()