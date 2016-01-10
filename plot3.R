# Load household power consumption data.
household_power_consumption <- read.csv("C:/Coursera/Peng Exploratory Data Analysis/Workspace/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors = FALSE)

# Create a formatted date.
household_power_consumption$DateF <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")

# Get only the subset we want.
dta <- subset(household_power_consumption, "2007-02-01" <= DateF & DateF <= "2007-02-02")

# Combine date and time into one column.
dta$DateTime <- strptime(paste(dta$Date, dta$Time), format="%d/%m/%Y %H:%M:%S")
dta$DateTime <- as.POSIXct(dta$DateTime)

# Order the data by date and time.
dta <- dta[order(dta$DateTime),]

# Open PNG file.
png("plot3.png",width=480,height=480)

# Generate plots.
with(dta, {
  # Initial line plot with Sub_metering_1 data
  plot(DateTime, Sub_metering_1, type="l", 
       xlab="", ylab="Energy sub metering") 
  
  # Now add the other sub-metering data with more lines
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
  
  # Create the legend in the upper right, setting line width (required)
  # and the colors appropriately for the legend labels.
  legend("topright",
         legend=c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"),
         lwd=1,
         col=c("black", "red", "blue")
  )
})

# Close PNG file.
dev.off()