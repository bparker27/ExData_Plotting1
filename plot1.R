dataFile <- "household_power_consumption.txt"

if(!exists("dataTable")){
  dataTable <- read.table(file = dataFile, header = TRUE, sep = ";", na.strings = "?")
}
rm("dataFile")

subData <- subset(dataTable, Date == "1/2/2007" | Date == "2/2/2007")

par(mfrow = c(1,1))
hist(subData$Global_active_power, main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col="red")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
rm(list = c("dataTable", "subData"))
