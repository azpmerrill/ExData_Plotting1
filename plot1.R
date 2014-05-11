#
# Plot1 - Bar Chart
# Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007
# using the "Individual household electric power consumption Data Set" 

#Read in all the data
powerdata<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",
                      colClasses=c("character", "character",  "numeric",  "numeric",  "numeric",  "numeric",  "numeric",  "numeric",  "numeric"))

#Pull out just the data for those two days
plotData <- subset(powerdata, powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007")

# output to png the Global Active Power histogram plot with Red bars

png(filename="plot1.png")

hist(as.numeric(type.convert(as.character(plotData$Global_active_power), dec = ".")), 
     main = "Global Active Power", breaks = 14, xlab = "Global Active Power (kilowatts)", col = "red", xaxp = c(0, 6, 3))

#Close the graph
<<<<<<< HEAD
dev.off()
=======
dev.off()
>>>>>>> 47bf79444fbbfd265ef893471dc8e0caf957efac
