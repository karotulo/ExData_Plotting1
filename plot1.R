# Read data & convert the dates
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

## Filter by 2007-02-01 & 2007-02-02
data_filtered <- data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]

# Open the png device
png(filename="plot1.png", width=480,height=480)

# Plot the histogram
hist(data_filtered$Global_active_power, xlab="Global Active Power (kilowatts)", 
     main="Global Active Power",col="red")

# Close the device
dev.off()