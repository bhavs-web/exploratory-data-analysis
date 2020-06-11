file <- "C:/Users/hardi/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt"
householddata <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetData <- householddata[householddata$Date %in% c("1/2/2007","2/2/2007") ,]
dt <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subsetData$Global_active_power)
sub_m1 <- as.numeric(subsetData$Sub_metering_1)
sub_m2 <- as.numeric(subsetData$Sub_metering_2)
sub_m3 <- as.numeric(subsetData$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(dt, sub_m1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, sub_m2, type="l", col="red")
lines(dt, sub_m3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()