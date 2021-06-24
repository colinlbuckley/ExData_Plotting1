## load dataset
household_power_consumption <- read.csv("~/Data Science/Coursera/Exploratory Data Analysis/Course Project 1/household_power_consumption.txt", sep=";", na.strings="?")

## format Times (POSIXct) + Dates
household_power_consumption$Time <- with(household_power_consumption, 
                                         as.POSIXct(paste(Date, Time), 
                                                    format = "%d/%m/%Y %H:%M:%S"))
household_power_consumption$Date <- as.Date(household_power_consumption$Date, 
                                            format = "%d/%m/%Y")

## subset relevant data
mydata <- household_power_consumption[household_power_consumption$Date %in% 
                                              as.Date(c("2007-02-01", "2007-02-02")), ]

## set png graphical device
png("plot4.png", width = 480, height = 480)

## set mfrow parameter
par(mfrow = c(2, 2))

## first plot (from plot2.R)
with(mydata, plot(Time, Global_active_power, type = "l", xlab = "", 
                  ylab = "Global Active Power (kilowatts)"))

## second plot
with(mydata, plot(Time, Voltage, type = "l", xlab = "datetime"))


## third plot (from plot3.R, minus legend box)
with(mydata, plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(mydata, lines(Time, Sub_metering_2, col = "red"))
with(mydata, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, bty = "n")

## fourth plot
with(mydata, plot(Time, Global_reactive_power, type = "l", xlab = "datetime"))

## turn off png device
dev.off()