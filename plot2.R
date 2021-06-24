## load dataset
household_power_consumption <- read.csv("~/Data Science/Coursera/Exploratory Data Analysis/Course Project 1/household_power_consumption.txt", sep=";", na.strings="?")

## format Times (POSIXct) + Dates
household_power_consumption$Time <- with(household_power_consumption, 
                                        as.POSIXct(paste(Date, Time), 
                                        format = "%d/%m/%Y %H:%M:%S"))
household_power_consumption$Date <- as.Date(household_power_consumption$Date, 
                                            format = "%d/%m/%Y")

## subset relevant data
mydata <- household_power_consumption[household_power_consumption$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]

## set png graphical device
png("plot2.png", width = 480, height = 480)

## plot
with(mydata, plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

## turn off png device
dev.off()