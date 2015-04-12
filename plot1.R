create_plot1 <- function () {
        mydata <- read.csv('household_power_consumption.txt', 
                           sep = ';', dec='.', 
                           header=TRUE, 
                           na.strings='?')
        
        mydata$Date <- as.Date(mydata$Date, 
                               format="%d/%m/%Y")
        
        mydata2<-mydata[mydata$Date == "2007-02-01" | mydata$Date == "2007-02-02",]
        
        png(file = "plot1.png", width = 480, height = 480, units = "px")
        
        hist(mydata2$Global_active_power, 
             col="red", 
             xlab="Global Active Power (kilowatts)", 
             main="Global Active Power")
        
        dev.off()
}