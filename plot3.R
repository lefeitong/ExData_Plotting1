data <- read.table("C:/Users/Lefei/Downloads/exdata-data-household_power_consumption/household_power_consumption.txt",sep=";",header=TRUE)
firstDate<-as.Date("2007-02-01","%Y-%m-%d")
secondDate<-as.Date("2007-02-02","%Y-%m-%d")
d<-data
d[,1]<-as.Date(d[,1],"%d/%m/%Y")
d3<-subset(d,Date==firstDate|Date==secondDate)
dq<-paste(as.character(d3[,1]),as.character(d3[,2]),sep=" ")
sdq<-strptime(dq,"%Y-%m-%d %H:%M:%S")
d3[,"Sub_metering_1"]<-as.numeric(as.character(d3[,"Sub_metering_1"]))
d3[,"Sub_metering_2"]<-as.numeric(as.character(d3[,"Sub_metering_2"]))
d3[,"Sub_metering_3"]<-as.numeric(as.character(d3[,"Sub_metering_3"]))
png(filename = "plot3.png",width = 480, height = 480)
plot(sdq,d3[,"Sub_metering_1"],type="l",ylab="Energy sub metering",xlab="")
lines(sdq,d3[,"Sub_metering_2"],col="red")
lines(sdq,d3[,"Sub_metering_3"],col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1, col=c('black', 'red', 'blue'))
dev.off()
