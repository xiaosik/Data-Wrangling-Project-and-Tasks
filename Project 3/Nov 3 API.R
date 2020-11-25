library(rjson)
library(blsAPI)
#https://www.bls.gov/help/hlpforma.htm#ML

#initial pull from in JSON format
layoffs_df <- blsAPI('MLUMS00NN0001003',1,TRUE)  #when it says TRUE, it will put the data into a dataframe 
layoffs_json <- blsAPI('MLUMS00NN0001003')

#Convert from RJSON to R format
layoffs <- fromJSON(layoffs_json)
#create an empty datset
layoff_dr <- data.frame(NULL)
#extract data of interest from each nested year and month list
seq_try <- seq_along(layoffs$Results$series[[1]]$data)
layoffs_loop <- for(i in seq_try){
  df <- data.frame(layoffs$Results$series[[1]]$data[i][[1]][1:4])}
  layoff_dr <- rbind(layoff_dr,df)

  #These examples are taken from <https://www.bls.gov/developers/api_signature.htm>
    library(rjson)
  response<-blsAPI('LAUVN040010000000005',1,TRUE) # 1 for version 1, depends on the version 
  json <- fromJSON(response)
  payload <- list('seriesid'=c('MLUMS00NN0001003','LAUVN040010000000006'))
  response<-blsAPI(payload,1,TRUE)
  response%>%filter(seriesID=='MLUMS00NN0001003')%>%filter(year=='2011')%>%filter(periodName=='October')
  json <- fromJSON(response)
  payload <- list('seriesid'=c('LAUVN040010000000005','LAUVN040010000000006'),'startyear'=2010,'endyear'=2012)
  response<-blsAPI(payload)
  json <- fromJSON(response)
  payload <- list('seriesid'=c('LAUVN040010000000005','LAUVN040010000000006'),'startyear'=2010,'endyear'=2012,'CATALOG'=FALSE,'calculations'=TRUE,'annualaverage'=TRUE,'registrationKey'='60515ad7e9a34771b07daee489c91bfd')
  response<-blsAPI(payload,2)
  json <- fromJSON(response)
  
##############
install.packages("devtools")
devtools::install_github("ropengov/rtimes")

#rtimes package"
library(rtimes)
# this package provides an interface to Congress,Campaign finance, Article search, and geographic AIS from NY times
#http://developer.nytimes.com/
article_key <- "mA3s1QNUGPcTe899fXW3ATWwrNafRCut"  # need to sign up for my own API key 
article_search_kobe <- as_search(q="Kobe",begin_date="20170101",end_date='20180101',key=article_key)
names(article_search_kobe)
article_search_kobe$meta
article_search_kobe$data[3]
# httr package
#leverage an organization's API but an R packages does not exist. Then came httr with web api's
#multiple functions for eg. head(),POST(),PUT(),DELETE() and GET()
#two types
# 1 Key-ONLY API
#2 OAuth required API

#key only API
# department of education https://api.data.gov
library(httr)
edu_key <- "oiDMUBwMOdWroqWSZ0T84VshxTkR9yyT6mLDR9La"
url <- "https://api.data.gov/ed/collegescorecard/v1/schools?"
ndsu_req <- GET(url,query=list(api_key=edu_key,school.name="Dartmouth College"))
dartmouth_data <- content(ndsu_req)
names(dartmouth_data$results[[1]])
#student data categories available by year
names(dartmouth_data$results[[1]]$`2010`)
# cost categories available per year
names(dartmouth_data$results[[1]]$`2010`$cost)
names(dartmouth_data$results[[1]]$`2010`$cost$tuition)
dartmouth_data$results[[1]]$`2017`$cost$tuition$out_of_state
# Comparing the rise in cost vs the rise in student debt. Magrittr and sapply function
dartmouth_yr <- dartmouth_data$results[[1]][c(as.character(1998:2010))]
#extract median debt
library(magrittr)
dartmouth_yr%>%sapply(function (x) x$aid$median_debt$completers$overall) %>%unlist()
dartmouth_yr%>%sapply(function (x) x$cost$avg_net_price$overall) %>%unlist()
#2 OAuth-required API



library(httr)
# some require authorization to account data. To access these we must provide proper credentials and OAuth authetication does it
##Oauth endpoints used to request access and authorixation
twitter_endpts <- oauth_endpoints("twitter")
#register my application at https://apps.twitter.com/
twitter_key="W2d50auTF9TyunZZYuXUDDF2p"
twitter_secret <- "9XE6GCfwfW0Hqzgr5LgAe6CbFp3BgvLl34fxcKEIr49egS8T4o"
library(openssl)
library(httpuv)
library(twitteR)
library(rtweet)
library(tidytext)
appname <- "twitter_app"

## api key (example below is not a real key)
key <- "0mkqi7ig5mD85URVtiF2QspnA"

## api secret (example below is not a real key)
secret <- "l71e6Hor67qe181mj2bR1b1QQpXvbYrPovgr4GkIyfD8mYEa5b"

twitter_token <- create_token(
  app = appname,
  consumer_key = twitter_key,
  consumer_secret = twitter_secret)


twitter_app <- oauth_app("twitter_app",twitter_key,twitter_secret)
twitter_token <- oauth1.0_token(endpoint=twitter_endpts,twitter_app)
