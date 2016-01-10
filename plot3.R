data_loc = "household_power_consumption.txt"
# read in feb 1 and 2, 2007
dat <- read.csv2(data_loc,skip=66636,nrows=2880,as.is=T)
names(dat) <- names(read.csv2(data_loc,nrows=1))

# full date
f_date <- strptime(paste(dat$Date,dat$Time),"%d/%m/%Y %H:%M:%S")

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
       col = c("black","red","blue")
)

#print png
dev.copy(png, file="plot3.png")
dev.off()