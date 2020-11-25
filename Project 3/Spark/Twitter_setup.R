install.packages("twitteR")

library(twitteR) 
# Change consumer_key, consume_secret, access_token, and 
# access_secret based on your own keys
consumer_key <- "tVsBEOZRhrnMDfUUduPIRSdTl"
consumer_secret <-"uoB4OscKRePaswge4k7ye0OGOJvEUVuDQLpjfUzZIuyeS3cPkc"
access_token <- "1057953109392138240-ZABy6nzGAmSrkHVRpkVwlsgsX5F9Ti"
access_secret <- "LgUNGIRyzJWVGE9mX40iJ4tzYSSdwEhfpNdTAjR2ulSEC" 
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
#tw = twitteR::searchTwitter('#realDonaldTrump + #HillaryClinton', n = 1e4, since = '2016-11-08', retryOnRateLimit = 1e3)
#d = twitteR::twListToDF(tw)
#tw = searchTwitter('@Ramesh71624540', n = 2)
#d = twListToDF(tw)
tw = searchTwitter('#fakenews', n = 1e4, since = '2018-10-01', retryOnRateLimit = 1e3)
d = twListToDF(tw)

tw_google = twitteR::searchTwitter('#googlewalkout', n = 10, since = '2018-10-01', retryOnRateLimit = 10)
d_google = twitteR::twListToDF(tw_google)
