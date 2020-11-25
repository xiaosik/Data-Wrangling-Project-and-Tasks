library(dplyr)
library(tidyverse)
library(magrittr)
library(nycflights13)
library(lubridate)

date_convert <- function(year,month,day,time){
  make_datetime(year,month,day,time %/% 100, time %%100)
}

flights13 <- flights %>%
  filter(!is.na(dep_time), !is.na(arr_time)) %>%
  mutate(dep_time = date_convert(year,month,day,dep_time),
         arr_time = date_convert(year,month,day,arr_time),
         sched_dep_time = date_convert(year,month,day,sched_dep_time),
         sched_arr_time = date_convert(year,month,day,sched_arr_time)) %>%
  select(origin, dest, ends_with("time"), ends_with("delay"))



# plot the distribution
flights13 %>%
  filter(!is.na(dep_time)) %>%
  mutate(dep_hour = update(dep_time, yday = 1)) %>%
  mutate(month = factor(month(dep_time))) %>%
  ggplot(aes(dep_hour, color = month)) + geom_freqpoly(binwidth = 50*50)



wrong_time <- flights13 %>%
  mutate(actual_dep_time = sched_dep_time + dep_delay*60) %>%
  filter(actual_dep_time != dep_time)
wrong_time %>% select(dep_time,sched_dep_time,actual_dep_time)


x <- flights13 %>% 
  mutate(minute = minute(dep_time), early = dep_delay<0) %>% 
  group_by(minute) %>% 
  summarise(early = mean(early), na.rm = TRUE, n=n())
  