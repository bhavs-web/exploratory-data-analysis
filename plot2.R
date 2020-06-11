file <- "C:/Users/hardi/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt"
householddata <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetData <- householddata[householddata$Date %in% c("1/2/2007","2/2/2007") ,]
dt <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subsetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dt, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

