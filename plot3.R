dataFile <- "household_power_consumption.txt"

if(!exists("dataTable")){
  dataTable <- read.table(file = dataFile, header = TRUE, sep = ";", na.strings = "?")
}
rm("dataFile")

subData <- subset(dataTable, Date == "1/2/2007" | Date == "2/2/2007")
rm("dataTable")

subData$dateTime <- paste(subData$Date, subData$Time)
subData$dateTime <- strptime(subData$dateTime, "%d/%m/%Y %H:%M:%S")

par(mfrow = c(1,1))
plot(subData$dateTime, subData$Sub_metering_1, type = "l", 
     ylab = "Energy sub metering", xlab = "", col = "black")
lines(subData$dateTime, subData$Sub_metering_2, type = "l", col = "red")
lines(subData$dateTime, subData$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, lwd = 1)
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()
rm("subData")
