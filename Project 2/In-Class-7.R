library(xml2)
library(rvest)
qbs <- read_html("https://geiselmed.dartmouth.edu/qbs/2019-cohort/")
qbs
library(tidyverse)
qbs %>%
  html_nodes("div.entry-content") %>%
  html_text()



library(rnoaa)
library(httr)
library(devtools)
noaa(token="ENSrygVJbbkcWVyvyLUeUkTLqbEbqQYG")
options(noaakey="ENSrygVJbbkcWVyvyLUeUkTLqbEbqQYG")



install.packages("devtools")
devtools::install_github("rnoaa", "ropensci")
library('rnoaa')
ncdc_locs(datasetid=c('GHCND', 'ANNUAL'),token='ENSrygVJbbkcWVyvyLUeUkTLqbEbqQYG',locationcategoryid= 'USW00013840')
data <- unlist(AFB)