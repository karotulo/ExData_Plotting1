# Read data & convert the dates
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

## Filter by 2007-02-01 & 2007-02-02
data_filtered <- data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]
# Once we have the filter, merge date + time in a Date object (faster than for all)
data_filtered$DateTime <- as.POSIXlt(
                            paste(data_filtered$Date, data_filtered$Time), tz="CET")

# Open the png device
png(filename="plot2.png", width=480,height=480)

# Plot the lines
plot(data_filtered$DateTime, data_filtered$Global_active_power, type="n", 
     ylab="Global Active Power (kilowatts)", xlab="")
lines(data_filtered$DateTime, data_filtered$Global_active_power )

# Close the device
dev.off()