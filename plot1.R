data_loc = "household_power_consumption.txt"
# read in feb 1 and 2, 2007
dat <- read.csv2(data_loc,skip=66636,nrows=2880,as.is=T)
names(dat) <- names(read.csv2(data_loc,nrows=1))

# plot
hist(as.numeric(dat$Global_active_power),
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")

#print png
dev.copy(png, file="plot1.png")
dev.off()