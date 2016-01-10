data_loc = "household_power_consumption.txt"
# read in feb 1 and 2, 2007
dat <- read.csv2(data_loc,skip=66636,nrows=2880,as.is=T)
names(dat) <- names(read.csv2(data_loc,nrows=1))

# full date
f_date <- strptime(paste(dat$Date,dat$Time),"%d/%m/%Y %H:%M:%S")

# plot
plot(f_date,dat$Global_active_power,
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")

#print png
dev.copy(png, file="plot2.png")
dev.off()