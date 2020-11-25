install.packages("RODBC")
library("RODBC")
library(dplyr)
library(tidyr)
library(tidyverse)
# use OBDC driver connect to data base
myconn<-odbcConnect("dartmouth","sxiao","sxiao@qbs181")
Demo181 <- sqlQuery(myconn,"select * from dbo.Demographics")
text181 <- sqlQuery(myconn,"select * from dbo.text")
conditions181 <- sqlQuery(myconn,"select * from dbo.conditions")

# merge the tables
conditions181 <- conditions181 %>%
  rename(contactid = tri_patientid)
table1 <- inner_join(conditions181,Demo181, by="contactid")
#new table contains conditions and demographics data

text181 <- text181 %>% 
  rename(contactid = tri_contactId)

data181 <- inner_join(table1,text181,by="contactid")
# arrange the text sent date by descending order (latest date first---> earliest date)
data181 <- data181 %>% 
  arrange(desc(TextSentDate))
library(lubridate)
data181$TextSentDate <- as.Date(data181$TextSentDate)
data181 <- data181 %>%
  group_by(contactid)%>% 
  filter(TextSentDate == max(TextSentDate))
data181 <- distinct(data181) # only keep one id per row by their latest text send date 

# relocate the column, easier to see the date
data181 <- data181 %>%
  relocate(TextSentDate, .after = contactid) %>%
  relocate(SenderName, .after = TextSentDate)
