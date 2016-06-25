file <- "household_power_consumption.txt"
hpc <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
hpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(hpc$Date, hpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

gAP <- as.numeric(hpc$Global_active_power)
gRP <- as.numeric(hpc$Global_reactive_power)
V <- as.numeric(hpc$Voltage)
sM1 <- as.numeric(hpc$Sub_metering_1)
sM2 <- as.numeric(hpc$Sub_metering_2)
sM3 <- as.numeric(hpc$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, gAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, V, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, sM1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sM2, type="l", col="red")
lines(datetime, sM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, gRP, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
