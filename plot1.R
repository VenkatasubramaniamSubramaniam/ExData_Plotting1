#plot1.R - Creates a Histogram and saves it as png file

## Getting full dataset
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

## Plot 1
hist(data$Global_active_power, main="Global Active Power"
    , xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
