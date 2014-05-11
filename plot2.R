#
# Plot2 - Single Line Chart
# Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007
# using the "Individual household electric power consumption Data Set" 

Sys.setlocale(locale = "C")

#Read in all the data
powerdata<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",
                      colClasses=c("character", "character",  "numeric",  "numeric",  "numeric",  "numeric",  "numeric",  "numeric",  "numeric"))

#Pull out just the data for those two days
plotData <- subset(powerdata, powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007")

# output to png the Global Active Power line plot

png(filename="plot2.png")

plotData$DateTime <- strptime(paste(plotData$Date, plotData$Time), "%d/%m/%Y %H:%M:%S")

plot(plotData$DateTime,as.numeric(type.convert(as.character(plotData$Global_active_power), dec = ".")), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#Close the graph
dev.off()
Sys.setlocale(locale = "")