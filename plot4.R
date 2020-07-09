# -------------------------
# Exploratory Data Analysis
# Course Project 1
# Plot 4
# -------------------------
# This script loads PNG graphics device to export a plot as "plot4.png"
#
# -------------------------
options(scipen = 999)
Sys.setlocale(category = "LC_ALL", locale = "English_United Kingdom.1252")

# Read txt file from working directory
hhpc <- read.csv(file = "./data/household_power_consumption.txt", sep = ";",
                 header = TRUE, stringsAsFactors = FALSE, na.strings = "?")

# Subset data of interest
hhpc <- subset(hhpc, Date %in% c("1/2/2007", "2/2/2007"))

# Transform Date and Time
hhpc$DateTime <- strptime(paste(hhpc$Date, hhpc$Time), "%d/%m/%Y %H:%M:%S")

# Open graphics device
png(filename = "plot4.png", width = 480, height = 480, units = "px")

# Create plot
par(mfrow = c(2,2))

with(hhpc, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = ""))

with(hhpc, plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

with(hhpc, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(hhpc, lines(DateTime, Sub_metering_2, col = "red"))
with(hhpc, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black","red","blue"), legend = colnames(hhpc[,7:9]), bty = "n")

with(hhpc, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime"))

# Close graphics device
dev.off()
