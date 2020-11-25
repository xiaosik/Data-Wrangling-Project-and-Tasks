install.packages("RODBC")
library("RODBC")
library(dplyr)
library(magrittr)
library(nycflights13)

summary(flights)
str(flights)
flights_jan1 <- filter(flights,month==1,day==1)
#logical operator
flights_novdec <- filter(flights,month==11|month==12)
# <> means not equal to , or !: not equal to
filter(flights,!(arr_delay>120|dep_delay>120))
#arrange (the same as 'order by')
arrange(flights,month,year,day)
arrange_delay <- arrange(flights,desc(arr_delay))

#select
select_flights <- select(flights,month,year,day)
arr_fli <- arrange(select_flights,desc(month))
flights %>% select(month,year,day) %>% arrange(desc(month)) # the same as line 19 and 20 
#### SQL equivalent:
#  select month,day,year from flights
#  order by month desc

select(flights,year:day,dep_time:flight)
select(flights,-(year:day),-(dep_time:flight)) # '-'not select 
select (flights,time_hour,air_time,everything())

#add new variable using mutate
flights_my <- select(flights,year:day,ends_with("delay"),air_time,distance)
flights_my %<>% mutate(gain=arr_delay-dep_delay,speed=distance/air_time*60) # %<>% the values will be return to the table 
fligh_gain_speed <- transmute(flights_my,gain=arr_delay-dep_delay,speed=distance/air_time*60)
#transmute only return the columns calculated

dplyr::
select(nycflights13::flights,year:day,ends_with("delay"),air_time,distance)
transmute(flights,hour=dep_time%/%100) # %/% means divide
#create a column or set a column's value as NULL
fligh_gain_speed$gain1 <- NULL

flights%<>%select(year:day,ends_with("delay"),air_time,distance)%>%mutate(gain=arr_delay-dep_delay)
flights%>%count(year,month,day,gain)%>%filter(n>1)

#summarize 
# 'group_by' function in dplyr 

#demonstrate joins
x <- tribble(
  ~key,~val_x,
  1,"x1",
  2,"x2"
)
y <- tribble(
  ~key,~val_y,
  1,"y1",
  2,"y2"
)
#inner join
x %>% inner_join(y,by="key") #inner_join(), left_join(),right_join(), full_join()


