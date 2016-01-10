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
png("plot1.png",width=480,height=480)

# Generate histogram.
hist(dta$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")

# Close PNG file.
dev.off()