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


#add dateTime variable which combines the Date and Time, format as POSIXct
dateTime <- paste(power$Date, power$Time) 
dateTime <- setNames(dateTime, "DateTime")
dateTime <- as.POSIXct(datetime)

#rejoin this new variable to the power dataset
power <- cbind(power, dateTime)

#create a .png file to save the plot to with required height and width
png("plot3.png", width=480, height=480)


with(power, {
              plot(Sub_metering_1 ~ dateTime, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
              lines(Sub_metering_2 ~ dateTime, type = "l", col  = "red")
              lines(Sub_metering_3 ~ dateTime, type = "l", col = "blue")})

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"),lwd=c(1,1,1))


dev.off()