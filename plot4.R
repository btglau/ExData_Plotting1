data_loc = "household_power_consumption.txt"
# read in feb 1 and 2, 2007
dat <- read.csv2(data_loc,skip=66636,nrows=2880,as.is=T)
names(dat) <- names(read.csv2(data_loc,nrows=1))

# full date
f_date <- strptime(paste(dat$Date,dat$Time),"%d/%m/%Y %H:%M:%S")

# set up 2x2 grid
par(mfcol = c(2,2))

# plot (1,1)
plot(f_date,dat$Global_active_power,
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")

# plot(2,1)
plot(f_date,dat$Sub_metering_1,
     type="l",
     ylab="Energy sub metering",
     xlab="")
lines(f_date,dat$Sub_metering_2,
      col="red")
lines(f_date,dat$Sub_metering_3,
      col="blue")
legend("topright",
       lty=1,
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),
       bty="n",
       cex=0.5
)

# plot(1,2)
plot(f_date,dat$Voltage,
     type="l",
     ylab="Voltage",
     xlab="datetime")

# plot(2,2)
plot(f_date,dat$Global_reactive_power,
     type="l",
     ylab="Global_reactive_power",
     xlab="datetime",
     cex.axis = 0.5)

#print png
dev.copy(png, file="plot4.png")
dev.off()