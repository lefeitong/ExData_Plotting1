data <- read.table("C:/Users/Lefei/Downloads/exdata-data-household_power_consumption/
                   household_power_consumption.txt",sep=";",header=TRUE)
firstDate<-as.Date("2007-02-01","%Y-%m-%d")
secondDate<-as.Date("2007-02-02","%Y-%m-%d")
d<-data
d[,1]<-as.Date(d[,1],"%d/%m/%Y")
d2<-subset(d,Date==firstDate|Date==secondDate)
dq<-paste(as.character(d2[,1]),as.character(d2[,2]),sep=" ")
sdq<-strptime(dq,"%Y-%m-%d %H:%M:%S")
d2[,3]<-as.numeric(as.character(d2[,3]))
png(filename = "plot2.png",width = 480, height = 480)
plot(sdq,d2[,3],type="l",ylab="Global Active Power (Kilowatts)",xlab="")
dev.off()