# -------------------------
# Exploratory Data Analysis
# Course Project 1
# Plot 1
# -------------------------
# This script loads PNG graphics device to export a plot as "plot1.png"
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
png(filename = "plot1.png", width = 480, height = 480, units = "px")

# Create plot
with(data = hhpc, expr = hist(Global_active_power, col = "red",
                              main = "Global Active Power",
                              xlab = "Global Active Power (kilowatts)"))

# Close graphics device
dev.off()
