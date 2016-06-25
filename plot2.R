file <- "household_power_consumption.txt"
hpc <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
hpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(hpc$Date, hpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(datetime, as.numeric(hpc$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
