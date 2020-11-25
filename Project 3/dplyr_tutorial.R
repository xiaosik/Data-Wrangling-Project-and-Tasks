install.packages("dplyr")

library(dplyr)
library(tidyverse)
library(magrittr)
library(nycflights13)
flights_jan1<-filter(flights,month == 1, day == 1)
sqrt(2)^2==2
near(sqrt(2)^2,2)
# logical operators
flights_novdec<-filter(flights,month==11 | month==12)
#nov_dec
filter(flights,!(arr_delay>120 | dep_delay>120))
filter(flights,arr_delay<=120 | dep_delay<=120)
#arrange
arrange(flights,month,year,day)
arrange(flights,desc(arr_delay))
#select
select(flights,month,year,day)
flights%>%select(month,year,day)
select(flights,year:day,dep_time:flight)
select(flights,-(year:day),-(dep_time:flight))
select(flights,time_hour,air_time,everything())
# adding new variables using mutate
flight_smy <- select(nycflights13::flights,year:day,ends_with("delay"),air_time,distance)
 flight_smy%<>%mutate(gain=arr_delay-dep_delay,speed=distance/air_time*60)
 flight_smy$gain1<-(flight_smy$arr_delay-flight_smy$dep_delay)
flight_gain_speed <- transmute(flight_smy,gain=arr_delay-dep_delay,speed=distance/air_time*60)
#getting the hour and minute mark...
transmute(nycflights13::flights,hour=dep_time%/%100,min=dep_time %% 100)
flight_gain_speed$gain1 <- NULL
select(flights,year:day,ends_with("delay"),air_time,distance)
select(flights,-origin,-dest)

#pipe operator#
flights%<>%select(year:day,ends_with("delay"),air_time,distance)%>%mutate(gain=arr_delay-dep_delay,speed=distance/air_time*60)
flights%>%count(year,month,day,gain)%>%filter(n>1)
# summarize
summarize(nycflights13::flights,delay=mean(dep_delay,na.rm=TRUE))
by_day <- group_by(nycflights13::flights,year,month,day)
summarize(by_day,delay=mean(dep_delay,na.rm=TRUE))
by_dest <- group_by(nycflights13::flights,dest)
delay <- summarize(by_dest,count=n(),delay=mean(arr_delay,na.rm=TRUE),distance=mean(distance,na.rm=TRUE))
arrange(delay,desc(delay))
filter(delay,count>20 && dest=="BOS")
#### demonstarte joins

x <- tribble(
  ~key,~val_x,
  1,"x1",
  2,"x2",
  3,"x3"
)
  
y <- tribble(
  ~key,~val_y,
  1,"y1",
  2,"y2",
  4,"y3"
)

#inner join
x%>%inner_join(y,by="key")
#outerjoin
x%>%left_join(y,by="key")
#right join
x%>%right_join(y,by="key")
#full join
x%>%full_join(y,by="key")

#duplicate keys

x <- tribble(
  ~key,~val_x,
  1,"x1",
  2,"x2",
  3,"x3",
  1,"x4",
  2,"x5"
)




# demonstrate the above command using the pipe operator #
# Tidy data with tidyr
table1
table2
table3
table4a
table4b
table1%>%mutate(rate=cases/population *10000)
library(ggplot2)
ggplot(table1,aes(year,cases))+geom_line(aes(group=country),color="grey50")+geom_point(aes(color=country))

table4a%>%gather(`1999`,`2000`,key="year",value="cases")
table2
spread(table2,key=type,value=count)
table3
separate(table3,rate,into=c("cases","population"))
separate(table3,year,into=c("century","year"),sep=2)%>%separate(rate, into=c("cases","population"))
table5
unite(table5,new,century,year)


########
# lead and lags #
x <- c(1:10)
lead(x)
lag(x)
min_rank(x)
row_number(x)
percent_rank(x)

