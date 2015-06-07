# Read CSV
powerConsumption  <- read.table("household_power_consumption.txt", sep=";", skip=1, col.names=c("Date","Time","Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings=c("?"))


# Strip na, log before and after
nrow(powerConsumption)
powerConsumption  <- na.omit(powerConsumption)
nrow(powerConsumption)

# Convert numerics
powerConsumption$Global_active_power <- as.numeric(powerConsumption$Global_active_power)
powerConsumption$Global_reactive_power <- as.numeric(powerConsumption$Global_reactive_power)
powerConsumption$Voltage <- as.numeric(powerConsumption$Voltage)
powerConsumption$Global_intensity <- as.numeric(powerConsumption$Global_intensity)

powerConsumption $DateTime_str <- paste(powerConsumption$Date, powerConsumption$Time)

powerConsumption$Date <- as.Date(powerConsumption$Date, format = "%d/%m/%Y")

powerConsumption$DateTime <- strptime(powerConsumption$DateTime_str, format = "%d/%m/%Y %H:%M:%S")

PowerSubset <- subset(powerConsumption, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02") )

png("plot1.png")

hist(PowerSubset$Global_active_power, col = c("red"), main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()
