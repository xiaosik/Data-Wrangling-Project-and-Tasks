install.packages("RODBC")
library("RODBC")
library(dplyr)
myconn<-odbcConnect("enter your DSN name","enter your username","enter yur passsword here")
IC_Demo<-sqlQuery(myconn,"select * from Demographics")

Inpatient_Outpatient <- sqlQuery(myconn,"select A.*, B.* from Outpatient A
                                 inner join Flowsheets B
                                 on A.NEW_PAT_ENC_CSN_ID=B.PAT_ENC_CSN_ID
                                 where PATIENT_DOB_CATEGORY like '%over%' and disp_name='Height'")