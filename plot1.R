
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
 
> data<-data.table::fread(input="household_power_consumption.txt",na.strings="?")
|--------------------------------------------------|
|==================================================|
> data[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
> data[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
> data<-data[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
> png("plot1.png", width=480, height=480) 
> hist(data[, Global_active_power], main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
> dev.off()
null device 
          1 
> save.image("C:\\Users\\janardan\\Documents\\Data science specialization coursera\\Exploratory data analysis\\exdata_data_household_power_consumption\\plot1.RData")
> 
