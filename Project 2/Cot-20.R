#date formatting
# %d Day of the month
# %m month 
# %b month(abbreviated)
# %B month (full name)
# %y Year(2-digit)
# %Y year (4-digit)

dates <- c("02/27/98","02/27/98")
str(dates)
correctdates <- as.Date(dates,format="%m/%d/%y")
str(correctdates)

as.Date('April 26, 2001', format='%B %d, %Y')
# fit the as.Date(x, format=), 
#the format to fits the data, the result output will always be %Y-%m-%d format for as.Date function
# %b and %B can use either
as.Date('22JUn2001', format='%d%B%Y')
str(as.Date('22JUn2001', format='%d%B%Y'))

#use POSix
dts <-("2005-10-21 18:47:22")
str(as.POSIXlt(dts))

dtss <- c(1127056501,1104295502)
mydates <- dtss
class(mydates)=c('POSIXt','POSIXct')
class(mydates)=c('')
str(dtss)


#work with correct century
dates1 <- c("02/27/34","02/28/70","02/25/60","01/14/92")
betterdate <- as.Date(dates1,format="%m/%d/%y",origin="1990-01-01") #not the correct
as.Date(ifelse(betterdate > Sys.Date(),format(betterdate, "19%y-%m-%d"),format(betterdate, "%Y-%m-%d")))


# ISOdate function
Sys.setenv(TZ='EST')
ISOdatetime(2005,10,21,11,47,22,tz="EST")
help(ISOdate)


# package lubridate
library(lubridate)

thisday <- today()
thisday
#extract year, day , month
year(thisday)
month(thisday)
day(thisday)
#extract the weekday, monthday and year
wday(thisday)
wday(thisday,label=TRUE)
mday(thisday)
yday(thisday)


#work with time
thismoment <- now()
thismoment
hour(thismoment)
minute(thismoment)
second(thismoment)


mydate <- ymd("2020-10-03")
class(mydate)
ymd("2002 Dec 15")
mdy("Apr 12, 60")
dmy(25081985)


tt <- ("06:15:58")
hms(tt)


#work with different date formats
data1 <- data.frame(dateformats=c("14.01.2009","9/22/2005","March 3 2009","03 10 2010"))
dmx <- mdy(data1$dateformats)
dmx
abc <- dmy(data1$dateformats)
abc
dmx[is.na(dmx)]=abc[is.na(dmx)]
data1$dateformats <- dmx
dmx