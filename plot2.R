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
plot(subData$dateTime, subData$Global_active_power, type = "l", 
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
rm("subData")
