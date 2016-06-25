# read.file
file <- "household_power_consumption.txt"
hpc <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
hpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]
gAP <- as.numeric(hpc$Global_active_power)
> png("plot1.png", width=480, height=480)
> hist(gAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
> dev.off()