
R version 3.6.0 (2019-04-26) -- "Planting of a Tree"
Copyright (C) 2019 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[Previously saved workspace restored]

> data <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
> data[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
> data[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
> data <- data[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
> png("plot4.png", width=480, height=480)
> par(mfrow=c(2,2))
> plot(data[, dateTime], data[, Global_active_power], type="l", xlab="", ylab="Global Active Power")
> plot(data[, dateTime],data[, Voltage], type="l", xlab="datetime", ylab="Voltage")
> plot(data[, dateTime], data[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
> lines(data[, dateTime], data[, Sub_metering_2], col="red")
> lines(data[, dateTime], data[, Sub_metering_3],col="blue")
> legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2","Sub_metering_3  "), lty=c(1,1), bty="n", cex=.5) 
> plot(data[, dateTime], data[,Global_reactive_power], type="l", xlab="datetime",ylab="Global_reactive_power")
> dev.off()
null device 
          1 
> 
