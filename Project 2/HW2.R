install.packages("RODBC")
library("RODBC")
library(dplyr)

myconn<-odbcConnect("dartmouth","sxiao","sxiao@qbs181")
IC_Demo<-sqlQuery(myconn,"select * from Demographics")

phonecall <- sqlQuery(myconn,"select * from dbo.PhoneCall_Encounter
                         alter table dbo.PhoneCall_Encounter
                         add enrollment_status nvarchar(100)")
str(phonecall)

phonecall[phonecall$EncounterCode ==125060000,"Enrollment_Group"]<-"Clinical Alert"
phonecall[phonecall$EncounterCode ==125060001,"Enrollment_Group"]<-"Health Coaching"
phonecall[phonecall$EncounterCode ==125060002,"Enrollment_Group"]<-"Technical Question"
phonecall[phonecall$EncounterCode ==125060003,"Enrollment_Group"]<-"Administrative"
phonecall[phonecall$EncounterCode ==125060004,"Enrollment_Group"]<-"Other"
phonecall[phonecall$EncounterCode ==125060005,"Enrollment_Group"]<-"Lack of engagement"

library(COUNT)
library(dplyr)
as.data.frame(table(phonecall$Enrollment_Group))

duration <- sqlQuery(myconn,"select * from dbo.CallDuration")
library(plyr)
names(duration)[1] <- "Customerid"

total <- sqlQuery(myconn,"select A.*,B.* from dbo.Callduration A
                  inner join dbo.PhoneCall_Encounter B
                  on A.tri_CustomerIDEntityReference=B.Customerid")

as.data.frame(table(total$CallOutcome))
as.data.frame(table(total$CallType))


total$CallOutcome[total$CallOutcome == 1] <- "No response"
total$CallOutcome[total$CallOutcome == 2] <- "Left voice mail"
total$CallOutcome[total$CallOutcome == 3] <- "Successful"
as.data.frame(table(total$CallOutcome))

total[total$EncounterCode ==125060000,"Enrollment_Group"]<-"Clinical Alert"
total[total$EncounterCode ==125060001,"Enrollment_Group"]<-"Health Coaching"
total[total$EncounterCode ==125060002,"Enrollment_Group"]<-"Technical Question"
total[total$EncounterCode ==125060003,"Enrollment_Group"]<-"Administrative"
total[total$EncounterCode ==125060004,"Enrollment_Group"]<-"Other"
total[total$EncounterCode ==125060005,"Enrollment_Group"]<-"Lack of engagement"

library(dplyr)
total %>%
  summarise(result = sum(total$CallDuration[total$Enrollment_Group== "Clinical Alert"]))
total %>%
  summarise(result = sum(total$CallDuration[total$Enrollment_Group== "Health Coaching"]))
total %>%
  summarise(result = sum(total$CallDuration[total$Enrollment_Group== "Technical Question"]))
total %>%
  summarise(result = sum(total$CallDuration[total$Enrollment_Group== "Administrative"]))
total %>%
  summarise(result = sum(total$CallDuration[total$Enrollment_Group== "Other"]))
total %>%
  summarise(result = sum(total$CallDuration[total$Enrollment_Group== "Lack of engagement"]))

hw2 <- sqlQuery(myconn,"select * into sxiao.hw from dbo.Text d
                inner join dbo.Conditions c
                on d.tri_contactId = c.tri_patientid")
hw <- sqlQuery(myconn,"select * from sxiao.hw")

text <- sqlQuery(myconn,"select * from dbo.Text")
condition <- sqlQuery(myconn,"select * from dbo.Conditions")
text_con <- merge.default(text,condition)
library(data.table)
library(sqldf)
Text1 <- data.table(text, key = "tri_contactId")
DEMO <- data.table(Demo, key = "contactid")
temp <- Text1[DEMO]
names(temp)[names(temp) == "tri_contactId"] <- "tri_patientid"
df_final <- sqldf("SELECT * 
                   FROM temp
                   JOIN condition USING(tri_patientid)")
all <- as.data.frame(table(df_final$SenderName))
all$Freq = (all$Freq / 52)







