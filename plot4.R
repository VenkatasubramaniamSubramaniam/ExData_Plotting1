
#plot4.R - Creates a 4 plots in panels on 1 screen and saves it as png file with size width and heigh equal to 480

## Getting ALL the data
readingCompleteFile <- read.csv(".\\R_WorkingDirectory\\data\\household_power_consumption.txt"
                                , header=T, sep=';', na.strings="?", check.names=F, stringsAsFactors=F
                                , comment.char="", quote='\"')
readingCompleteFile$Date <- as.Date(readingCompleteFile$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(readingCompleteFile, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(readingCompleteFile)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
