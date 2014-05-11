#
# Plot4 - Four Line Charts
# Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007
# using the "Individual household electric power consumption Data Set"

Sys.setlocale(locale = "C")

#Read in all the data
powerdata<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",
                      colClasses=c("character", "character",  "numeric",  "numeric",  "numeric",  "numeric",  "numeric",  "numeric",  "numeric"))

#Pull out just the data for those two days
plotData <- subset(powerdata, powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007")

# output to png the Global Active Power line plot

png(filename="plot4.png")

plotData$DateTime <- strptime(paste(plotData$Date, plotData$Time), "%d/%m/%Y %H:%M:%S")

#Set up the graphs to be 2 across and 2 up&down = 4 total
par(mfrow = c(2, 2))

#Define each of the 4 graphs

#graph1
plot(plotData$DateTime,as.numeric(type.convert(as.character(plotData$Global_active_power), dec = ".")), type = "l", xlab = "", ylab = "Global Active Power")

#graph2
plot(plotData$DateTime,as.numeric(type.convert(as.character(plotData$Voltage), dec = ".")), type = "l", xlab = "datetime", ylab = "Voltage")

#graph3
# Color each line a different color for graph 3
plot(plotData$DateTime,as.numeric(type.convert(as.character(plotData$Sub_metering_1), dec = ".")), type = "l", xlab = "", ylab = "Energy sub metering", col = "black")

points(plotData$DateTime,as.numeric(type.convert(as.character(plotData$Sub_metering_2), dec = ".")), type = "l", xlab = "", ylab = "Energy sub metering", col = "red")

points(plotData$DateTime,as.numeric(type.convert(as.character(plotData$Sub_metering_3), dec = ".")), type = "l", xlab = "", ylab = "Energy sub metering", col = "blue")

#Add a legend
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#graph4
plot(plotData$DateTime,as.numeric(type.convert(as.character(plotData$Global_reactive_power), dec = ".")), type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#Close the graph
dev.off()
Sys.setlocale(locale = "")