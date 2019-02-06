library("data.table")

setwd("F:/R Training/Course 4 - Exploratory Data Analysis/Week 1 Assignment")

#Reads in data from file 
powerData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",
          colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

#convert the date data to a Date Variable as is read in as character
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")

#subset the data for just that information on the 1/2/2007 and 2/2/2007
power <- subset(powerData, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

power <- power[complete.cases(power),]

#create a .png file to save the plot to with required height and width
png("plot1.png", width=480, height=480)


hist(power$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency",main = "Global Active Power")

dev.off()