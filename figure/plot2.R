#download and unzip file
#Important note: If your OS is not Windows, the parameter method="curl", should be added to download.file 
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="./exp-data/data.zip")
unzip ("./exp-data/data.zip", exdir = "./exp-data/")

#read data
data_full <- read.table("./exp-data/household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
data <- data_full[(data_full$Date=="1/2/2007" | data_full$Date=="2/2/2007" ), ]

#format date and time
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(dateTime)

#plot2
plot(data$Global_active_power~data$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="./exp-data/plot2.png", height=480, width=480)
dev.off()