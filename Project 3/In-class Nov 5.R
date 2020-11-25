install.packages("twitteR")
library(twitteR)
consumer_key <- "0mkqi7ig5mD85URVtiF2QspnA"
consumer_secret <- "l71e6Hor67qe181mj2bR1b1QQpXvbYrPovgr4GkIyfD8mYEa5b"
access_token <- "3412815771-7eVPXYxzeYwSFMpBnNVBZSphZHOR7c0sDXgjEnj"
access_secret <- "T7m3Ui3znUYodAVFg0s6uwWi2dFtIyIT73XxynAjYpPHA"
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
tw = twitteR::searchTwitter('#earthhour', n = 10, since = '2020-10-01', retryOnRateLimit = 10)
list(tw)
























library(rtimes)
article_key <- "1muzuYqFpPqOVSLluk34LD9m4rOeOozi"
article_search <- as_search(q="climate change",begin_date="20170101",end_date="20200101",key=article_key, n=10e2)
names(article_search)
article_search$meta
article_search$data
