## load dataset
household_power_consumption <- read.csv("~/Data Science/Coursera/Exploratory 
        Data Analysis/Course Project 1/household_power_consumption.txt", sep=";", 
        na.strings="?")

## format Dates + Times, subset relevant date range
household_power_consumption$Date <- as.Date(household_power_consumption$Date, 
                                            format = "%d/%m/%Y")
household_power_consumption$Time <- strptime(household_power_consumption$Time, 
                                             format = "%H:%M:%S")
mydata <- household_power_consumption[household_power_consumption$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]

## set png graphical device
png("plot1.png", width = 480, height = 480)

## plot
hist(mydata$Global_active_power, breaks = 15, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

## turn off png device
dev.off()